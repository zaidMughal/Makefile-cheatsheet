#include <stdio.h>
#include "file1.h"

extern int myint;       //Will be linked from file2.c in link time

int main(){
        printf("%d\n", myint);
}