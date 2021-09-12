/****************************************************************************
 *  Joe Sloyan, Aaron Sala, Robert Campbell                                 *
 *                                                                          *
 *  Sources Consulted: Beej's Guide to network programing :                 *
 *  http://beej.us/guide/bgnet/html/                                        *
 *                                                                          *
 *  server.c                                                                *
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
#include <netdb.h>
#include <errno.h>

#define MAX_CONNECTIONS 16
#define MAX_MESSGAGE_SIZE 256 
#define MAX_TRANSIT_SIZE 300 
//#define DEFAULT_PORT 12364;

struct user_info{
    char username[25];
    int clientFD; 
    struct user_info* next; 
    int number;
};


void handleError(char* str){
    perror(str);
    exit(1);
}

struct user_info* users; 
char userNumber = 0;
int nextSpace = 1;

void broadcast(char* message){
    char messageBuffer[MAX_TRANSIT_SIZE];
    for(int i = 0; i<MAX_TRANSIT_SIZE; i++){
        messageBuffer[i] = 0; 
    }
    strncpy(messageBuffer,message, MAX_TRANSIT_SIZE-1);
    struct user_info* current = users;  
    while(current != NULL){
        send(current->clientFD,messageBuffer,MAX_TRANSIT_SIZE-1,0);
        current = current->next;
    }
}

void insertIntoUsers(struct user_info* newUser){
    //working
    //insert User at the end of the linked list 
    if(users == NULL){
        users = newUser;
        return;
    }
    struct user_info* currentUser = users;
    while(currentUser->next){
        currentUser = currentUser->next;
    } 
    currentUser->next = newUser; 
}

int removeUser(int number){
    //UNTESTED
    //remove user with the given id from the list 
    //return 0 if successful 
    //return -1 if failed
    if(users->number == number){
        struct user_info* tofree = users; 
        users = users->next;
        close(tofree->clientFD);
        char messageBuffer[MAX_TRANSIT_SIZE];
        for(int i = 0; i<MAX_TRANSIT_SIZE; i++){
            messageBuffer[i] = 0; 
        }
        strncpy(messageBuffer,tofree->username,sizeof(tofree->username));
        strcat(messageBuffer, " Has Left The Server\n");
        free(tofree);
        broadcast(messageBuffer);
        return 0;
    }
    struct user_info* currentUser = users->next;
    struct user_info* last = users;

    while(currentUser->number != number){
        last = currentUser;
        currentUser = currentUser->next;
        if(currentUser == NULL){
            return -1;
        }
    } 
    last->next = currentUser->next;
    close(currentUser->clientFD);
    
    char messageBuffer[MAX_TRANSIT_SIZE];
    for(int i = 0; i<MAX_TRANSIT_SIZE; i++){
        messageBuffer[i] = 0; 
    }
    strncpy(messageBuffer,currentUser->username,sizeof(currentUser->username));
    strcat(messageBuffer, " Has Left The Server\n");
    free(currentUser);
    broadcast(messageBuffer);
    return 0;
}


void addUser(int clientFD){
    //UNTESTED
    //Handle Creation of the user after accept call happens

    struct user_info* newUser = malloc(sizeof(struct user_info));
    strncpy(newUser->username,"USER",5);
    char number[5];
    sprintf(number, "%d", userNumber);
    strncat(newUser->username, number,6);
    newUser->clientFD = clientFD;
    newUser->next = NULL;
    newUser->number = userNumber;
    userNumber++;
    insertIntoUsers(newUser);
    char messageBuffer[MAX_TRANSIT_SIZE];
    for(int i = 0; i<MAX_TRANSIT_SIZE; i++){
        messageBuffer[i] = 0; 
    }
    strncpy(messageBuffer,newUser->username,sizeof(newUser->username));
    strcat(messageBuffer, " Has Joined The Server!\n");
    broadcast(messageBuffer);
    //todo: finish this 
}

void pollFds(){
    struct user_info* current = users;  
    char messageBuffer[MAX_TRANSIT_SIZE];
    for(int i = 0; i<MAX_TRANSIT_SIZE; i++){
        messageBuffer[i] = 0; 
    }
    while(current != NULL){
        int readRes = recv(current->clientFD,messageBuffer,MAX_MESSGAGE_SIZE-1,0);
        if(readRes!= -1){
            if(readRes == 0){
                int number = current->number;
                current = current->next;
                removeUser(number);
                continue;
            }
            if(messageBuffer[0] == 0){
                continue;
            }
            if(strncmp(messageBuffer, "quit\n",5) == 0){
                //not working?
                //maybe handle clientside?
                int numToRemove = current->number;
                current = current->next;
                removeUser(numToRemove);
                continue;
            }
            if(strncmp(messageBuffer, "name ",5) == 0){
                for(int i = 0; i<strlen(messageBuffer); i++){
                    if(messageBuffer[i] == '\n') messageBuffer[i] = 0;
                }

                char message2Buffer[MAX_TRANSIT_SIZE];
                for(int i = 0; i<MAX_TRANSIT_SIZE; i++){
                    message2Buffer[i] = 0;
                }
                strncpy(message2Buffer, current->username, strlen(current->username));
                strcat(message2Buffer, " has changed their name to ");
                strcat(message2Buffer, messageBuffer+5);
                strcat(message2Buffer, "\n");
                strncpy(current->username, messageBuffer+5, 24);
                broadcast(message2Buffer);
                current = current->next;
                continue;
            }
            char messageBuffer2[MAX_TRANSIT_SIZE];
            for(int i = 0; i<MAX_TRANSIT_SIZE; i++){
                messageBuffer2[i] = 0; 
            }
            strncpy(messageBuffer2, current->username, strlen(current->username));
            strcat(messageBuffer2, ": ");
            strcat(messageBuffer2, messageBuffer);
            broadcast(messageBuffer2);
        }
        current = current->next;
    }
}


int main(int argc, char* argv[]){
    unsigned short port;
    /*if(argc > 1){
        port = (short)strtol(argv[1], NULL, 10); //get numerical socket
    }
    port = DEFAULT_PORT;*/

    if( argc != 2 ){
		printf("Usage: ./server <port number>\n");
		return 0;
	}

	port = (unsigned short)strtol(argv[1], NULL, 10); //get numerical socket

    if(port < 1024 || port > 65525){
        errno = ERANGE;
        handleError("PORT");
    }
    struct sockaddr_in my_addr;
    int s = socket(AF_INET, SOCK_STREAM, 0);    //create Socket
        if(s == -1){
            handleError("SocketCreate");
        }
    int flags = fcntl(s,F_GETFL);
    flags |= O_NONBLOCK;
    int value = fcntl(s,F_SETFL, flags); //set as nonblocking
    flags = fcntl(s,F_GETFL);
    my_addr.sin_family = AF_INET;
    my_addr.sin_port = port;
    printf("Open On Port: %d\n", my_addr.sin_port);
    my_addr.sin_addr.s_addr = INADDR_ANY; 
    memset(my_addr.sin_zero, '\0', sizeof my_addr.sin_zero);
    if(bind(s, (struct sockaddr *)&my_addr, sizeof my_addr) == -1){handleError("Bind:");}
    if(listen(s, MAX_CONNECTIONS) == -1) handleError("listen");
    while(1){
        unsigned int sizeofClient = sizeof(struct sockaddr_storage);
        int accepted = accept4(s, (struct sockaddr *)&my_addr, &sizeofClient, O_NONBLOCK); 
        if(accepted != -1){
            addUser(accepted);
        } 
        pollFds();

    }

}

