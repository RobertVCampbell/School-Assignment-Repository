// Robert Campbell
// 08/31/2020
// A program to practice working with processes

#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
    
    int child_PID = fork();
    char* child_argv[] = {"ls", "-l", NULL};
    char* child_prog = child_argv[0];

    if( child_PID == -1){
        perror("Could not fork.");
        exit(-1);
    }

    if(child_PID != 0){
        waitpid(child_PID, NULL, 0);
        printf("Parent pid: %i\n", getpid());
    }
    else{
        sleep(3);
        printf("Child pid: %i\n", getpid());
        execvp(child_prog, child_argv);
        exit(-1);
    }    
    return 0;


}