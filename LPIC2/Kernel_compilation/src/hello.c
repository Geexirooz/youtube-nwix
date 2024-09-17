#include <stdio.h>

#ifndef USERNAME
#define USERNAME "World"
#endif

int main() {
    printf("Hello, %s!\n", USERNAME);
    return 0;
}

