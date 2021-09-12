#define _GNU_SOURCE //needed for accept4
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <netdb.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <time.h>
#include <fcntl.h> //for open
#include <unistd.h> //for close

char WEBSTRING[] = "<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"utf-8\"><title>Lab 3</title></head><body><b>Just some text on this webpage</b></body></html>";
char NOGOOD[] = "HTTP/1.1 501 Not Implemented\r\n\r\n\r\n";
char MATCH[] = "GET / HTTP/1.1\r\n";

void handleError(char* str){
    perror(str);
    exit(1);
}

void genDate(char buf[]){
	time_t now = time(NULL);
	struct tm *tm = gmtime(&now);
	strftime(buf, 2044, "%a, %d %b %Y %H:%M:%S %Z", tm);
	strcat(buf, "\r\n\0");
	//printf(buf);
	return;
}

void generateMessage(char* message){
	char status[] = "HTTP/1.1 200 OK\r\n";
	char connection[] = "Connection: close\r\n";
	char date[200] = {'\0'};
	strncpy(date, "Date: ", strlen("Date: "));
	genDate(date+6);
	char server[] = "Server: AdamanyCampbell/0.0.1\r\n";
	char last[] = "Last-Modified: Mon, 03 May 2021 15:37:02 GMT\r\n";
	char length[20] = {'\0'};
	sprintf(length, "Content-Length: %ld\r\n", strlen(WEBSTRING));
	char type[] = "Content-Type: text/html\r\n\r\n";
	
	char full[2048] = {'\0'};
	strncpy(full,status,strlen(status));
    strcat(full, connection);
	strcat(full,date);
	strcat(full,server);
	strcat(full,last);
	strcat(full,length);
	strcat(full,type);
	strcat(full,WEBSTRING);

	strcpy(message, full);
	//printf("Full: \n%s\n\n", full);
	//printf("Message: \n%s\n\n",message);

	return;
}

int main(int argc, char **argv) {
    int one = 1;
	int port = 12345;
    int sockfd=socket(AF_INET, SOCK_STREAM, 0);

	if(sockfd <0) handleError("Socket error");

	// Allows use of claimed address/port if it is currently idle.
	setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(int));

	// Initialize address info to bind to the socket
    struct sockaddr_in myAddr;
    myAddr.sin_family = AF_INET;
    myAddr.sin_port = htons(port);
    myAddr.sin_addr.s_addr = INADDR_ANY; 
    memset(myAddr.sin_zero, '\0', sizeof myAddr.sin_zero);

	// Generate placeholder client address info
	struct sockaddr_in clientAddr;
	socklen_t inSockSize = sizeof(clientAddr);

	// Bind address info to the socket
    if(bind(sockfd, (struct sockaddr *)&myAddr, sizeof myAddr) == -1){
		close(sockfd);
		handleError("Bind error");
	}

	// Sets the socket to listen on the port
    if(listen(sockfd, 5) == -1) handleError("listen");

    /*char* message;
    unsigned int sizeofClient = sizeof(struct sockaddr_storage);
	int i = 1;*/

	printf("Server successfully listening on localhost port %d\n\n", port);
	//int messSize;
    while(1){
		//printf("%d", i);
	    int clientfd = accept(sockfd, (struct sockaddr *)&clientAddr, &inSockSize);
	    if(clientfd != -1){
			//i+=1;
		    //Clear buffer
		    /*for(int i = 0; i<MAX_TRANSIT_SIZE; i++){
			    messageBuffer[i] = 0; 
		    };*/
			char rMess[2048] = {'\0'};
			char sMess[2048] = {'\0'};
		    int readRes = recv(clientfd,rMess,2047,0);
		    if(readRes != -1){
			    if(strncmp(rMess, MATCH, strlen(MATCH)) == 0){
					//i+=3;
			    	generateMessage(sMess);
			    }
			    else{
				    strncpy(sMess, NOGOOD, sizeof(NOGOOD));
					//messSize = sizeof(NOGOOD);
			    }
			//printf("%s", *message);
			send(clientfd, sMess, strlen(sMess)-1, 0);
		    }
		else printf("Could not accept connection.\n\n");

	    close(clientfd);
		
	    }
    }	
    return 0;

    return 1;

}