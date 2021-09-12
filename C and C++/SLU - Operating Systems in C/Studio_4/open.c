// Robert Campbell
// 08/28/2020
// A program to practice working with error handling

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define bufferSize 100000
char buffer[bufferSize];
int count;

int main(int argc, char* argv []){
    
    if(argc != 2){
        perror("Should only have one arguement.");
        exit(-1);
    }

    int fd_in = open(argv[1], O_RDONLY);

    if(fd_in == -1){
        perror("Cannot access file: ");
        exit(-1);
    }

    while(1){
        count = (read(fd_in, buffer, bufferSize));
        if( count == 0){
            exit(0);
            break;
        }
        else{
            write(STDOUT_FILENO, buffer, count);
        }
    }
    

    return 0;
}