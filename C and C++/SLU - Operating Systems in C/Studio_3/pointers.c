// Robert Campbell
// 08/24/2020
// A program to practise pointers in C
#include <stdio.h>
#include <stdlib.h>

char* reverseString(char* input){
    int leng = 0;
    while(*(input + leng) != '\0'){
        leng++;
    }
    char *output = (char*)malloc(leng + 1);

    output[leng+1] = '\0';
    
    for(int i = 0; i < (leng); i++){
        output[i] = input[leng-i - 1];
    }
   
    return output;
}

void printReverse ( char* string){
    int leng = 0;
    while(*(string + leng) != '\0'){
        leng++;
    }
    for(leng; leng > 0; leng--){
        printf("%c\n", *(string + leng - 1));
    }

}

int main(int argc, char* argv []){
    char *messagePtr = "HELLOWORLD!";
    printf("%s\n", messagePtr);

    for(int i = 0; i < 11; i++){
        printf("%c\n", messagePtr[i]);
    }
    printf("Dereferenced value: %c\n", *messagePtr);
    printf("Pointer arithmetic loop:\n");

    for(int i = 0; i < 11; i++){
        printf("ptr + %i: %c\n", i, *(messagePtr + i));
    }
    int i = 0;
    while(*(messagePtr + i) != '\0'){
        printf("%c\n", *(messagePtr + i));
        i++;
    }
    printReverse(messagePtr);

    printf("\n\n\n");
    char* reversedMessage = reverseString( messagePtr );
    printf("Reversed string: %s\n", reversedMessage);

    return 0;
}