#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <map>

using namespace std;

int level = 0;

void printBBEntry(int ln, char* filename) {
	for (int i = 0; i<level; i++)
		cerr << "|  ";
	cerr << "Enter BasicBlock in file " << (string)filename << " at line # " << ln << endl;
	level++;
}

void printBBExit(int ln, char* filename) {
	level--;
	for (int i = 0; i<level; i++)
		cerr << "|  ";
	cerr << "Exit BasicBlock" << endl;
	// cerr << "Exit BasicBlock in file " << (string)filename << " at line # " << ln << endl;
}
