/*
Joe Sloyan, Robert Campbell, Aaron Sala

Only known bug is that when a command returns a large enough STD_OUT that it fills the pipe, the program will hang as the executable tries to write more into the file

The extra credit was completed.

*/
#define MAX_ARGV 15
#define MAX_CHARS 256
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>  
#include <stdlib.h>
#include <setjmp.h>


struct Exec {
    //int PID, fd_in, fd_out;
    char* argv[MAX_ARGV];
    char* command;
};

int main(int argc, char* argv[]);
//Forward Declaration of main;

void quitprog ( int signum ){
    //Interrupt Handler
    printf("\nInterrupt Caught, If you do not see a new prompt press enter and a new one will magically show up!\n");
}

int executeExec(struct Exec* ex, int In_fileNo){
    //Execute a prepopulated Exec structure
    int fds[2];
    pipe(fds);  //create a pipe
    int f = fork(); 
    if(f == 0){
        //In child 
        if(In_fileNo >= 0){
            //If there is a valid in file use it for STDIN
            dup2(In_fileNo,STDIN_FILENO);
        }
        //Put STD_OUT to pipe
        dup2(fds[1],STDOUT_FILENO);  
        close(fds[0]);
        //run the command
        execvp(ex->command, ex->argv);
		
	    //Execvp only returns if it errors out
        //Construct an error string from the program name
        //Print the error string using perror()
        int errtextsize = strlen(ex->command) + strlen(": Not found");
        char* errtext = (char*)malloc(errtextsize);
        strcpy(errtext, ex->command);
        strcat(errtext, ": Not found\n");
        perror(errtext);
        close(fds[1]);
        close(In_fileNo);
        _exit(0);
    }
    waitpid( f, NULL, 0 );
    close(In_fileNo);
    close(fds[1]);
    //give the out file pipe to calling function
    return fds[0];
}

char* trim(char* string){
    //trims leading and trailing whitespace from string and returns modified string address
    //works in a similar manner to high level string strip() or trim() functions
    char* trimstart = string;
    int i = 0;
    while(1){
        if(*trimstart == ' ' || *trimstart == '\t' || *trimstart == '\n' || *trimstart == '\r'){
            trimstart+=sizeof(char);
            continue;
        }
        break;
    }
    char* trimEnd = trimstart;
    while(1){
        if(*trimEnd == '\0'){
            break;
        }
        trimEnd+=sizeof(char);
    }
    trimEnd-=sizeof(char);
    while(1){
        if(*trimEnd == ' ' || *trimEnd == '\t' || *trimEnd == '\n' || *trimEnd == '\r'){
            *trimEnd = '\0';
            trimEnd-=sizeof(char);
            continue;
        }
        break;
    }
    return trimstart;
}

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

int setupExec(char* commandString, struct Exec* execStructure){
    //populate the exec structure with parsed commandString 
    char* argv[MAX_ARGV];
    //Create ArgV and fill
    if(split(commandString, ' ', MAX_ARGV, argv)){
        //error in split (too many args)
		perror("Too many args");
        return -1;
    }
    //trim whitespace fromeach command
    int i = 0;
    while(1){
        if(argv[i]){
            argv[i] = trim(argv[i]);
            i++;
        }
        else{
            perror("Invalid null command");
            return -1;
        }
        break;
    }
    char* command = argv[0];
    i = 0;
    //load argv into EXEC
    while(1){
        execStructure->argv[i] = argv[i];
        if(argv[i] == NULL){
            break;
        }
        i++;
    }
    //load command into exec
    execStructure->command = command;
    return 0;
}

char* removeDir(char* original, char* toMatch){
    //Function to take a working dir string input and pull the home directory out of it if it contains it 
    int i = 0; 
    while(1){
        //Start at the beginning and check that the characters at each position match. break when they dont 
        if(*(original + i*sizeof(char)) != *(toMatch + i*sizeof(char))){
            break;
        }
        i++;
    }
    int len = strlen(toMatch);
    if(i == len){
        //If the whole home dir doesnt match, dont change anything 
        original[i-1] = '~';
        return &(original[i-1]);
    }
    return original;
}

int main(int argc, char* argv[]){
    //put handler in
    signal(2,quitprog);
    while(1){
        //create buffers for the pwd and ~
        char pwd[100];
        char homeDir[100];
        getcwd(pwd, 100);
        char* home = getenv("HOME");
        strncpy(homeDir,home,100);
        char* dir = removeDir(pwd,home); //filter out the ~ dir if it is contained
        printf("%s | SLU$H>>> ", dir);  //SLUSH prompt
        char command[256];  //command buffer
        command[0] = '\0';
        int readl = scanf("%[^\n]", command); //scan until new line
        getchar();  //flush newL
        if(readl == EOF){
            printf("\n");   //break out on ^D
            break;
        }
        if(command[0] == 'c' && command[1] == 'd' && command[2] == ' '){
            //handle cd command 
            char* dir = command+3*sizeof(char);
            chdir(dir);
            continue;
        }
        char* commands[MAX_ARGV];
        //split commands into args
        split(command, '(', MAX_ARGV, commands);
        int i = 0;
        while(1){
            //find the end of commands and populate array with commands
            if(commands[i]){
                i++;
                continue;
            }
            break;
        }
        i--;
        if(i<0){
            continue;
        }
        int fd = -1;
		int err = 0;
        while(i>=0){
            //execute each command starting and end and working backwards. pass STD_OUT of last one exectued into the new one 
            struct Exec c;
            err = setupExec(commands[i], &c);
			if(err == -1){
				close(fd);
				break;
			}
            fd = executeExec(&c, fd);
            i--;
        }
        char buffer[200];
		if(err == -1){
			continue;
		}
		else{
            //print the material in the STD_OUT pipe of the last command to the STD_OUT
			while(read(fd, buffer, 200)){
				printf(buffer);
			}
		}
        printf("\n");
        close(fd);
    }
    return 0;
}