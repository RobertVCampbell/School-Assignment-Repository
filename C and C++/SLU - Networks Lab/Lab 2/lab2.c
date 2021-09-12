#include <stdio.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <netdb.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>


int main(int argc, char **argv) {
    struct addrinfo hints, *results;
    int rv, valread;
    int sockfd;
	char inputVal[100];
    char inbuf[100];
    char port[100];
    char *ip;
    char hostname[100];
	unsigned char buffer[4096];

    if(argc == 1){
        printf("Enter an port number: ");
        scanf("%s", port);
        printf("Enter an Host: ");
        scanf("%s", hostname);
        printf("\n");
    }
    else if(argc==3){
        strcpy(hostname,argv[1]);
        strcpy(port,argv[2]);
    }
    else{
        printf("Invalid syntax. Correct usage is:\n\t./lab2 [hostname] [port]\nOR\n\t./lab2\n\n");
        return -1;
    }



    memset(&hints, 0, sizeof hints);
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;

    //Get IP from Domain Name
    /*struct hostent *ghbn=gethostbyname(hostname);
	if (ghbn) {
        ip = inet_ntoa(*(struct in_addr *)ghbn->h_name);
        fprintf("\nIP from ghbn: %s\n\n", ip);
    }*/

    if ( (rv = getaddrinfo( hostname , port , &hints , &results)) != 0)
    {
        //fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(rv));
        return 1;
    }
    struct sockaddr_in *addr;
    addr = (struct sockaddr_in *)results->ai_addr;
    ip=inet_ntoa((struct in_addr)addr->sin_addr);

    printf("Port: %s\n", port);
    printf("Host Name: %s\n", hostname);
    printf("IP Address: %s\n\n",ip);

    sockfd = socket(results->ai_family, results->ai_socktype, results->ai_protocol);

    connect(sockfd, results->ai_addr, results->ai_addrlen);

    send(sockfd, "GET / HTTP/1.1\r\n\r\n", 23, 0);

    //Read if any value returns into buffer
    valread = recv(sockfd , buffer, 1024,0);
    printf("%s\n",buffer );
    return 0;

    return 1;

}