#include <stdio.h>


int main(int argc, char* argv[]){
    int x = 0;

    printf("x before: %d\n", x);
    __sync_add_and_fetch(&x, 10);
    printf("x after: %d\n", x);


    return 0;
}