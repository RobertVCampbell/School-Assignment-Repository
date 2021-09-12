// Robert Campbell
// 09/02/2020
// A program to practice parsing user input

#include <stdio.h>
#include <string.h>

#define bufferSize 100
char buffer[bufferSize];
//int count;

int main ( int argc, char* argv[]){
    int max_args = 15;
    int max_argv_size = max_args + 2; //one for argv[0], one for null term
    char* cmd;
    char* my_argv[max_argv_size];

    printf("Input some string:");
    char* input;
    char* tok;
    
    input = fgets(buffer, 32, stdin);

    char *pos;
    if ((pos=strchr(input, '\n')) != NULL){
        *pos = '\0';
    }

    printf("%s\n", input);

    cmd = strtok(input, " " );
    my_argv[0] = cmd;
    int count = 1;

    tok = strtok(NULL, " " );
    while(tok != NULL){
        my_argv[count] = tok;
        tok = strtok(NULL, " ");
        count++;
    }
    my_argv[count] = '\0';

    execvp(cmd, my_argv);


    return 0;
}