#!/bin/bash

if [ -n $BASE ]; then
	TEST=$(dirname $(readlink -f $0))
	BASE=$(dirname $TEST)
	LLVMBIN="$BASE/Debug+Asserts/bin"
	LLVMLIB="$BASE/Debug+Asserts/lib"
	LLVMSRCLIB="$BASE/lib"
	BENCHMARKS="$TEST/benchmarks"
	BBInfo="$TEST/instrumentation/BBInfo"
	TMP="$TEST/tmp"
	export PATH="${LLVMBIN}:$PATH"
fi

CPPFLAGS=-g
LLVMLIBS=
LDFLAGS=
OPTFLAGS="-sprtLnNum -prtLnNum"
TESTS="gcd welcome compression recursive"

make -C $LLVMSRCLIB/Research

if [ ! -d tmp ]; then
	mkdir tmp
	echo ".PHONY: clean all
all:
clean:
	rm -f *.bc *.x *.ll *.o" > tmp/Makefile
fi

printUsage() {
	echo
	echo "Usage: ./run.sh \"<options>\" <TEST> (<ARGUMENTLIST>)"
	echo "Usable options: "
	echo " Static: "
	echo "	-sprtLnNum		Statically print the filename and debuginfo for each BasicBlock entrance"
	echo " Dynamic: "
	echo "	-prtLnNum		Dynamically print the filename and debuginfo for each BasicBlock entrance"
	echo "Usable TESTs: "
	echo "	$TESTS"
	echo
}


if [ $# -gt 1 ]; then
	tst=$2
	opt=$1

	if [[ ! $OPTFLAGS =~ "$opt" ]]; then
		echo "$opt is not an available flag"
		printUsage
		exit
	fi
	if [[ ! $TESTS =~ "$tst" ]]; then
		echo "$tst is not an available test"
		printUsage
		exit
	fi

	echo "Running Test: $tst with opt options $opt"
	cd $TMP
	make clean

	clang $CPPFLAGS -O0 -emit-llvm -c $BBInfo/printLine.cpp -o printLine.bc
	for f in $BENCHMARKS/$tst/*.c*; do
		clang $CPPFLAGS -O0 -emit-llvm -c $f #-o $(basename ${f%.c*}).bc
	done
	ret=$?
	if [ $ret -ne 0 ]; then
		echo "clang failed with ret=$ret"
		exit
	fi


	for f in *.bc; do
		llvm-dis $f
		if [[ $f != "printLine.bc" ]]; then
			opt -load $LLVMLIB/Research.so $opt $f -o ${f%.bc}.g.bc
			ret=$?
			if [ $ret -ne 0 ]; then
				echo "opt failed when processing file $f, ret=$ret"
				exit
			fi
		fi
	done

	if [[ ! $opt =~ "-s" ]]; then ## -s means static analysis

		## link instrumentation module
		llvm-link *.g.bc printLine.bc -o "$tst".linked.bc
		ret=$?
		if [ $ret -ne 0 ]; then
			echo "llvm-link failed $ret"
			exit
		fi
		for f in *.bc; do
			llvm-dis $f
		done

		## compile to native object file
		llc -filetype=obj "$tst".linked.bc -o "$tst".o
		if [ $? -ne 0 ]; then
			echo "llc failed $?"
			exit
		fi

		## generate native executable
		g++ "$tst".o $LLVMLIBS $LDFLAGS -o "$tst".x
		if [ $? -ne 0 ]; then
			echo "g++ failed $?"
			exit
		fi

		shift; shift # remove the first two arguments and pass the rest to the opt-ed program
		echo "Running ./$tst $@"
		./"$tst".x "$@"
	else
		echo "Analysis only"
	fi

	cd ..
else
	printUsage
fi
