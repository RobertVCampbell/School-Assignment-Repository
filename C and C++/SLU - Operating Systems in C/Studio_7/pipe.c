// Robert Campbell
// 09/07/2020
// A program to implement piping i/o
#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


int main(int argc, char* argv[]){

    int fd[2];
	int retval = pipe( fd );
	if( retval == -1 ){
		perror("Could not create pipe");
		exit(-1);
	}

    int child_pid1 = fork();

    if( child_pid1 == -1){
        perror("Could not fork.");
        exit(-1);
    }
    if(child_pid1 == 0){
        close(fd[0]);
        dup2(fd[1], STDOUT_FILENO);

        char* cmd = "./print";
        char* myargv[] = {"print",'\0'};

        int ret = execvp( cmd, myargv );
        if( ret == -1 ) perror("Error exec'ing print" );

        exit(0);
    }

    int child_pid2 = fork();

    if( child_pid2 == -1){
        perror("Could not fork.");
        exit(-1);
    }

    if(child_pid2 == 0){
        close(fd[1]);
        dup2(fd[0], STDIN_FILENO);

        char* cmd = "./prog2";
        char* myargv[] = {"prog2",'\0'};

        int ret = execvp( cmd, myargv );
        if( ret == -1 ) perror("Error exec'ing prog2" );

        exit(0);
    }

    close(fd[0]);
    close(fd[1]);
    waitpid(child_pid1, NULL, 0);
    waitpid(child_pid2, NULL, 0);

    return 0;
}