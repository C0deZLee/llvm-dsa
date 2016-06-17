#!/usr/bin/env bash
# linking example

CPPFLAGS=
LLVMLIBS=
LDFLAGS=
# if your instrumentation code calls into LLVM libraries, then comment out the above and use these instead:
#CPPFLAGS=`llvm-config --cppflags`
#LLVMLIBS=`llvm-config --libs`
#LDFLAGS=`llvm-config --ldflags`

## compile the instrumentation module to bitcode
## clang $CPPFLAGS -O0 -emit-llvm -c sample.cpp -o sample.bc
clang -O0 -emit-llvm -o test.bc -c test.c

## opt -load *.so -infoflow < $BENCHMARKS/welcome/welcome.bc -o welcome.bc
~/llvm-dsa/Debug+Asserts/bin/opt  -load ~/llvm-dsa/projects/poolalloc/Debug+Asserts/lib/LLVMDataStructure.so -load /home/ubuntu/llvm-dsa/projects/llvm-deps/Debug+Asserts/lib/Constraints.so  -load /home/ubuntu/llvm-dsa/projects/llvm-deps/Debug+Asserts/lib/sourcesinkanalysis.so -load /home/ubuntu/llvm-dsa/projects/llvm-deps/Debug+Asserts/lib/pointstointerface.so -load /home/ubuntu/llvm-dsa/projects/llvm-deps/Debug+Asserts/lib/Deps.so  -infoflow  -debug < ~/test/test.bc > /dev/null

## link instrumentation module
#llvm-link welcome.bc sample.bc -o welcome.linked.bc

## compile to native object file
#llc -filetype=obj welcome.linked.bc -o=welcome.o

## generate native executable
#g++ welcome.o $LLVMLIBS $LDFLAGS -o welcome

#./welcome

