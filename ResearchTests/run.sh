#!/bin/bash

# Enable running this script without the virtual environment.
if [ -z $VTENV ]; then
	echo "
Run \`source ./env.sh\` to activate the virtual environment
Run \`source ./autocmp.sh\` to activate autocompletion for ./run.sh"
	source ./env.sh
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
	echo "	welcome 			Print Welcome message and exit"
	echo "	gcd <arg1> <arg2>	Calculate the greatest common divisor of <arg1> and <arg2> "
	echo "	compression 		Compress a file"
	echo "	recursive (<arg1>)	Test with linkage of two .c files"
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

	make -C $LLVMSRCLIB/Research

	if [ ! -d tmp ]; then
		mkdir tmp
		echo ".PHONY: clean all
	all:
	clean:
		rm -f *.bc *.x *.ll *.o" > tmp/Makefile
	fi

	if [ "$(uname)" == "Darwin" ]; then
		EXT="dylib"
		CPPFLAGS="-g -stdlib=libstdc++"
		LDFLAGS="-stdlib=libstdc++"
	else
		EXT="so"
		CPPFLAGS="-g"
		LDFLAGS=
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
			opt -load $LLVMLIB/Research.$EXT $opt $f -o ${f%.bc}.g.bc
			ret=$?
			if [ $ret -ne 0 ]; then
				echo "opt failed when processing \"$f\", ret=$ret"
				exit
			fi
		fi
	done

	if [[ ! $opt =~ "-s" ]]; then ## -s means static analysis

		## link instrumentation module
		llvm-link *.g.bc printLine.bc -o "$tst".linked.bc
		ret=$?
		if [ $ret -ne 0 ]; then
			echo "llvm-link failed ret=$ret"
			exit
		fi
		for f in *.bc; do
			llvm-dis $f
		done

		## compile to native object file
		llc -filetype=obj "$tst".linked.bc -o "$tst".o
		ret=$?
		if [ $ret -ne 0 ]; then
			echo "llc failed ret=$ret"
			exit
		fi

		## generate native executable
		g++ "$tst".o $LLVMLIBS $LDFLAGS -o "$tst".x
		ret=$?
		if [ $ret -ne 0 ]; then
			echo "g++ failed ret=$ret"
			exit
		fi

		shift; shift # remove the first two arguments and pass the rest to the opt-ed program
		echo "Running ./$tst $@"
		./"$tst".x "$@"
		echo "Return $?"
	else
		echo "Analysis only"
	fi

	cd ..
else
	printUsage
fi
