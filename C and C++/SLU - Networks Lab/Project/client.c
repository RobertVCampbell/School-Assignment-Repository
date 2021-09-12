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
#include <openssl/ssl.h>
#include <openssl/err.h>
#include <fcntl.h> //for open
#include <unistd.h> //for close


void handleError(char* str){
    perror(str);
    exit(1);
}

int main(int argc, char **argv) {
    SSL_CTX *ctx;
    SSL *ssl;
    struct addrinfo hints, *results;
    int sockfd;
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
        printf("Invalid syntax. Correct usage is:\n\t./client [hostname] [port]\nOR\n\t./lab2\n\n");
        return -1;
    }

    // Initialize SSL
    SSL_library_init();
    SSL_load_error_strings();
    OpenSSL_add_ssl_algorithms();

    ctx = SSL_CTX_new(SSLv23_client_method());
    if(!ctx) handleError("Could not create context\n\n");

    // Configure cert/key
	if(SSL_CTX_use_certificate_file(ctx, "campbell.pem", SSL_FILETYPE_PEM) <1) handleError("Certificate missing");
	if(SSL_CTX_use_PrivateKey_file(ctx, "campbell.pem", SSL_FILETYPE_PEM)<1) handleError("Private key missing.");

    memset(&hints, 0, sizeof hints);
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;

    // Get host information
    if ( (getaddrinfo( hostname , port , &hints , &results)) != 0)
    {
        handleError("Could not get the address information.");
    }

    // Pull out the ip address
    struct sockaddr_in *addr;
    addr = (struct sockaddr_in *)results->ai_addr;
    ip=inet_ntoa((struct in_addr)addr->sin_addr);

    printf("Port: %s\n", port);
    printf("Host Name: %s\n", hostname);
    printf("IP Address: %s\n\n",ip);

    // Create the socket
    sockfd = socket(results->ai_family, results->ai_socktype, results->ai_protocol);

    if(connect(sockfd, results->ai_addr, results->ai_addrlen) != 0) handleError("Could not connect.");

    // Set up SSL connection
    ssl = SSL_new(ctx);
    SSL_set_fd(ssl, sockfd);
    if(SSL_connect(ssl) <1) handleError("Could not establish SSL connection.");
    else printf("Established SSL Encryption.\n\n");

    // Send HTTP GET request
    SSL_write(ssl, "GET / HTTP/1.1\r\n\r\n", 23);

    //Read if any value returns into buffer
    if(SSL_read(ssl , buffer, 2048) <1) printf("SSL_Read failed\n\n");
    else printf("%s\n",buffer);

    SSL_free(ssl);
    close(sockfd);
    SSL_CTX_free(ctx);
    EVP_cleanup();

    return 0;


}