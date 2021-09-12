#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/ip.h>
#include <string.h>

int main(int argc, char* argv[]){
    int sockfd;

    sockfd = socket(AF_LOCAL, SOCK_STREAM, 0);
    if( sockfd == -1 ){
		perror("Could not create listening socket");
		return -1;
	}

    struct sockaddr_in in_addr;
    memset(&in_addr, 0, sizeof(struct sockaddr_in));
    in_addr.sin_family = AF_LOCAL;
    in_addr.sin_port = INADDR

    bind(sockfd);

    return 0;
}