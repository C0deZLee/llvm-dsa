#!/usr/bin/env bash
# linking example

CPPFLAGS=
LLVMLIBS=
LDFLAGS=
LEVEL="../../.."

# if your instrumentation code calls into LLVM libraries, then comment out the above and use these instead:
#CPPFLAGS=`llvm-config --cppflags`
#LLVMLIBS=`llvm-config --libs`
#LDFLAGS=`llvm-config --ldflags`

## compile the instrumentation module to bitcode
## clang $CPPFLAGS -O0 -emit-llvm -c sample.cpp -o sample.bc
$LEVEL/Debug+Asserts/bin/clang -O0 -emit-llvm -o test.bc -c test.c

## opt -load *.so -infoflow < $BENCHMARKS/welcome/welcome.bc -o welcome.bc
$LEVEL/Debug+Asserts/bin/opt  -load $LEVEL/projects/poolalloc/Debug+Asserts/lib/LLVMDataStructure.so \
  -load $LEVEL/projects/llvm-deps/Debug+Asserts/lib/Constraints.so  \
  -load $LEVEL/projects/llvm-deps/Debug+Asserts/lib/sourcesinkanalysis.so \
  -load $LEVEL/projects/llvm-deps/Debug+Asserts/lib/pointstointerface.so \
  -load $LEVEL/projects/llvm-deps/Debug+Asserts/lib/Deps.so  \
  -infoflow  -debug < $LEVEL/projects/llvm-deps/test/test.bc > /dev/null

## link instrumentation module
#llvm-link welcome.bc sample.bc -o welcome.linked.bc

## compile to native object file
#llc -filetype=obj welcome.linked.bc -o=welcome.o

## generate native executable
#g++ welcome.o $LLVMLIBS $LDFLAGS -o welcome

#./welcome

