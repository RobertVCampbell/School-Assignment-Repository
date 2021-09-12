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
#include <openssl/ssl.h>
#include <openssl/err.h>

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

	// SSL Setup 
	SSL_CTX *ctx;
	SSL_load_error_strings();
	OpenSSL_add_ssl_algorithms();

	// Create and configure SSL Context
	ctx = SSL_CTX_new(SSLv23_server_method());
	if(!ctx) handleError("Context create error;");
	SSL_CTX_set_ecdh_auto(ctx, 1);

	// Configure cert/key
	if(SSL_CTX_use_certificate_file(ctx, "campbell.pem", SSL_FILETYPE_PEM) <1) handleError("Certificate missing");
	if(SSL_CTX_use_PrivateKey_file(ctx, "campbell.pem", SSL_FILETYPE_PEM)<1) handleError("Private key missing.");


	// Configure 

	// Socket Setup
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
    if(listen(sockfd, 5) == -1) handleError("Listen error");
	printf("Server successfully listening on localhost port %d\n\n", port);


	// Handle connections and serve webpage
    while(1){
		SSL *ssl;

	    int clientfd = accept(sockfd, (struct sockaddr *)&clientAddr, &inSockSize);
	    if(clientfd != -1){
			
			// Set SSL
			ssl = SSL_new(ctx);
			SSL_set_fd(ssl,clientfd);
			if(SSL_accept(ssl) <1) {printf("Could not establish SSL with client.\n\n");}
			else{



				char rMess[2048] = {'\0'};
				char sMess[2048] = {'\0'};
				int readRes = SSL_read(ssl,rMess,2047);

				// Check received message for HTTP Get
				if(readRes != -1){

					// Send HTML if valid
					if(strncmp(rMess, MATCH, strlen(MATCH)) == 0){
						generateMessage(sMess);
					}

					// Send 501 for anything else
					else{
						strncpy(sMess, NOGOOD, sizeof(NOGOOD));
					}
					SSL_write(ssl, sMess, strlen(sMess));

					SSL_shutdown(ssl);
					SSL_free(ssl);
				}
			}
		}
		else handleError("Could not accept connection.\n\n");

	    close(clientfd);
		
    }	

	// cleanup
	close(sockfd);
	SSL_CTX_free(ctx);
	EVP_cleanup();	

    return 0;

}
