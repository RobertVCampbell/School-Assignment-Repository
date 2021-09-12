#define MAX_ARGV 15
#define MAX_CHARS 256
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int split(char* string, char character, int maxSize, char* toFill[]){
    //Functions as a split call in a higher level programing language
    //string --> to be split
    //character --> character to split on
    //maxSize --> max number of strings to split into 
    //toFill --> array to fill. this array will be null terminated
    char splitter[] = {character, '\0'};
    char* readWord = strtok(string, splitter);
    int i = 0;
    while(1){
        if(readWord){
            toFill[i] = readWord;
            i++;
            //printf("%s\n",readWord);
            if(i >= maxSize){
                toFill[i] = '\0';
                return -1;
            }
            readWord = strtok(NULL, splitter);
            continue;
        }
        toFill[i] = NULL;
        break;
    }
    return 0;
}

int main(int argc, char* argv[]){
    char a[] = "1 2 3 4 5 6 7 8 9 10 11 12 13 14";
    char* commands[MAX_ARGV];
    printf("%d\n",split(a, ' ', MAX_ARGV, commands));
}

        // while(i>=0){
        //     if (strcmp(commands[i],"cd")) {
        //         i--;
        //         chdir(commands[i]);
        //         i--;
        //     }
        //     else {
        //         struct Exec c;
        //         setupExec(commands[i], &c);
        //         executeExec(&c);
        //         i--;
        //     }
        // }