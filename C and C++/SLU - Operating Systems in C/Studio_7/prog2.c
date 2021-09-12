// Robert Campbell
// 09/02/2020
// Pared down Studio 6

#include <stdio.h>
#include <string.h>

#define bufferSize 100
char buffer[bufferSize];
//int count;

int main ( int argc, char* argv[]){
    while(1){
        int max_args = 15;
        int max_argv_size = max_args + 2; //one for argv[0], one for null term
        char* cmd;
        char* my_argv[max_argv_size];

        printf("Input some string:");
        char* input;
        char* tok;
        
        input = fgets(buffer, 32, stdin);

        if(input==NULL){
            break;}

        char *pos;
        if ((pos=strchr(input, '\n')) != NULL){
            *pos = '\0';
        }

        printf("Program 2 got: %s\n", input);

        // cmd = strtok(input, " " );
        // my_argv[0] = cmd;
        // int count = 1;

        // tok = strtok(NULL, " " );
        // while(tok != NULL){
        //     my_argv[count] = tok;
        //     tok = strtok(NULL, " ");
        //     count++;
        // }
        // my_argv[count] = '\0';

        // execvp(cmd, my_argv);
    }

    return 0;
}