#include<stdio.h>
#include<stdlib.h>

// the program analysis should return the first branch condition, since its
// both tainted and untrusted
int main() {
  int key = 6; // pretend this is the secret key. It is tainted.
  int plain = 10; // pretend this is the plaintext given by user. It is untrusted.
  int N = 15;     // some constant, neither tainted, nor untrusted.
  int x=0;

  if (key < plain)  // we should identify this branch condition.
     x = 1;
  if (key < N)      // this branch condition is tainted, but not untrusted.
     x = 2;
  if (plain < N)    // this branch is untrusted, but not tainted.
     x = 3;
}
