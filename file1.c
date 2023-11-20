#include <stdio.h>
#include "file1.h"

extern int myint;       //Will be linked from file2.c in link time

int main(){
        printf("Var from file1.h:\t%d\n", file1_h_var);
        printf("Var from file2:\t\t%d\n", myint);
}