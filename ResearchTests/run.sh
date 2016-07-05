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

if [ $# -gt 0 ]; then
	tst=$1
	echo "Running Test: $tst"
	cd $TMP
	rm -f *

	clang $CPPFLAGS -O0 -emit-llvm -c $BBInfo/printLine.cpp -o printLine.bc
	llvm-dis printLine.bc
	clang $CPPFLAGS -O0 -emit-llvm -c $BENCHMARKS/$tst/"$tst".c* -o "$tst".bc
	llvm-dis "$tst".bc
	if [ $? -ne 0 ]; then
		echo "clang failed $?"
		exit
	fi

	opt -load $LLVMLIB/Research.so -prtLnNum "$tst".bc -o "$tst".g.bc
	llvm-dis "$tst".g.bc
	if [ $? -ne 0 ]; then
		echo "opt failed"
		exit
	fi

	## link instrumentation module
	llvm-link "$tst".g.bc printLine.bc -o "$tst".linked.bc
	if [ $? -ne 0 ]; then
		echo "link failed"
		exit
	fi

	## compile to native object file
	llc -filetype=obj "$tst".linked.bc -o "$tst".o
	if [ $? -ne 0 ]; then
		echo "llc failed"
		exit
	fi

	## generate native executable
	echo "g++"
	g++ "$tst".o $LLVMLIBS $LDFLAGS -o "$tst".x
	if [ $? -ne 0 ]; then
		echo "g++ failed"
		exit
	fi

	echo "Running ./$tst"
	./"$tst".x $2 $3 $4 $5 $6 $7

	cd ..
else
	echo
	echo "Usage: ./run.sh TEST ARGUMENTLIST"
	echo "Usable TESTs: gcd welcome compression"
	echo
fi
