/****************************************************************************
 *  Joe Sloyan, Aaron Sala, Robert Campbell                                 *
 *                                                                          *
 *  Sources Consulted: Beej's Guide to network programing :                 *
 *  http://beej.us/guide/bgnet/html/                                        *
 *                                                                          *
 *  testclient.c                                                            *
 *  Operating Systems - CSCI 3500                                           *
 *  Dr. David Ferry                                                         *
 *                                                                          *
 *  11/23/2020                                                              *
 ****************************************************************************/

#define _GNU_SOURCE //needed for accept4
//#include <sys/un.h>     //we need to figure out which of these are unneeded
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
//#include <poll.h> 
//#include <sys/socket.h>
//#include <sys/types.h>
//#include <netdb.h>
//#include <errno.h>
//#include <netinet/in.h>
#include <arpa/inet.h>
#include <signal.h>

#define MAX_MESSGAGE_SIZE 256 
#define MAX_TRANSIT_SIZE 300 
//#define IP_ADDRESS "127.0.0.1"
//#define port 12364

void handleError(char* str){
    perror(str);
    exit(1);
}

int main(int argc, char* argv[]){
    if( argc != 3 ){
        printf("Usage: ./server <ip address> <port number>\n");
        return 0;
        }

	char* IP_ADDRESS = argv[1];
    char* portString = argv[2];
    int port = atoi( portString );

    struct sockaddr_in my_addr;
    int s = socket(AF_INET, SOCK_STREAM, 0);    //create Socket
        if(s == -1){
            handleError("SocketCreate");
        }
    int flags = fcntl(s,F_GETFD);
    my_addr.sin_family = AF_INET;
    my_addr.sin_port = port;
    my_addr.sin_addr.s_addr = inet_addr(IP_ADDRESS); 
    memset(my_addr.sin_zero, '\0', sizeof my_addr.sin_zero);
    //if(bind(s, (struct sockaddr *)&my_addr, sizeof my_addr) == -1){handleError("Bind:");}
    if(connect(s, (struct sockaddr *)&my_addr, sizeof my_addr) == -1){handleError("connect:");}
    pid_t forkR = fork();
    if(forkR == 0){
        char strBuffer[MAX_TRANSIT_SIZE]; 
        while(1){
            for(int i = 0; i<MAX_TRANSIT_SIZE; i++){
                strBuffer[i] = 0;
            }
            fgets(strBuffer, MAX_MESSGAGE_SIZE-1, stdin);
           // if(k>MAX_MESSGAGE_SIZE){}
            for(int k = MAX_MESSGAGE_SIZE; k < MAX_TRANSIT_SIZE; k++) strBuffer[k] = 0; 
            if(strncmp(strBuffer, "quit\n", 5) == 0){
                send(s, strBuffer, MAX_TRANSIT_SIZE-1, 0);
                kill(getppid(),SIGSTOP);
                close(s);
                exit(0);
            }
            send(s, strBuffer, MAX_TRANSIT_SIZE, 0);
        }
    
    }
    while(1){
        char strBuffer[MAX_TRANSIT_SIZE]; 
        for(int i = 0; i<MAX_TRANSIT_SIZE; i++){
            strBuffer[i] = 0;
        }
        int status = recv(s,strBuffer,MAX_TRANSIT_SIZE-1, 0);
        if(status == 0){
            printf("Server Terminated Connection Unexpectedly\n");
            kill(forkR, SIGSTOP);
            exit(0);
        }
        printf("%s", strBuffer);
    }
    return 0;




   
}