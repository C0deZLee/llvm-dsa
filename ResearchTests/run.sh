#!/usr/bin/env bash

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

make -C $LLVMSRCLIB/Research

if [ ! -d tmp ]; then
	mkdir tmp
	echo ".PHONY: clean all
all:
clean:
	rm -f *.bc *.x *.ll *.o" > tmp/Makefile
fi

if [ $# -gt 1 ]; then
	tst=$2
	opt=$1
	echo "Running Test: $tst with opt options $opt"
	cd $TMP
	make clean

	clang $CPPFLAGS -O0 -emit-llvm -c $BBInfo/printLine.cpp -o printLine.bc
	llvm-dis printLine.bc
	clang $CPPFLAGS -O0 -emit-llvm -c $BENCHMARKS/$tst/"$tst".c* -o "$tst".bc
	llvm-dis "$tst".bc
	if [ $? -ne 0 ]; then
		echo "clang failed $?"
		exit
	fi

	opt -load $LLVMLIB/Research.so $opt "$tst".bc -o "$tst".g.bc
	llvm-dis "$tst".g.bc
	if [ $? -ne 0 ]; then
		echo "opt failed $?"
		exit
	fi

	## link instrumentation module
	llvm-link "$tst".g.bc printLine.bc -o "$tst".linked.bc
	if [ $? -ne 0 ]; then
		echo "link failed $?"
		exit
	fi

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

	if [ $opt != "-sprtLnNum" ]; then
		echo "Running ./$tst"
		shift; shift # remove the first two arguments and pass the rest to the opt-ed program
		./"$tst".x "$@"
	fi

	cd ..
else
	echo
	echo "Usage: ./run.sh \"<options>\" <TEST> (<ARGUMENTLIST>)"
	echo "Usable options: "
	echo "	-sprtLnNum		Statically print the filename and debuginfo for each BasicBlock entrance"
	echo "	-prtLnNum		Dynamically print the filename and debuginfo for each BasicBlock entrance"
	echo "Usable TESTs: "
	echo "	gcd welcome compression"
	echo
fi
