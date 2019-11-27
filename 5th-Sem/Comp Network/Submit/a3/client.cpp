#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

#define BUFSIZE 1024

int main(int argc, char **argv) {
	struct addrinfo hints;
	struct addrinfo *result, *rp;

	if (argc != 4) {
		printf("<Server Address> <Server Port> <Echo Word>\n");
		exit(-1);
	}
	char *echoString = argv[3];
	struct sockaddr_in *servAddr_In4;
	struct sockaddr_in6 *servAddr_In6;	
	char addrString[INET6_ADDRSTRLEN];
	memset(addrString, 0, sizeof(addrString));
	memset(&hints, 0, sizeof(struct addrinfo));
	hints.ai_family = AF_UNSPEC; // IPv4 or v6
	hints.ai_socktype = SOCK_STREAM;// Hardcoded TCP as dummy
	hints.ai_protocol = IPPROTO_TCP; // Hardcoded TCP as dummy
	hints.ai_flags = AI_CANONNAME;
	int s = getaddrinfo(argv[1], argv[2], &hints, &result);
    if (s != 0) {
        fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(s));
        exit(EXIT_FAILURE);
    }
	int sockfd;
	for (rp = result; rp != NULL; rp = rp->ai_next) {
		if(rp->ai_family ==  AF_INET){
			servAddr_In4 = (struct sockaddr_in *) rp->ai_addr;
			inet_ntop(rp->ai_family, &servAddr_In4->sin_addr.s_addr, addrString, sizeof(addrString));
			sockfd = socket(rp->ai_family, rp->ai_socktype, rp->ai_protocol);
			if (sockfd == -1)continue;
			if(connect(sockfd, rp->ai_addr, rp->ai_addrlen) !=-1) {
				printf("IPv4 detected\n");
				break;
			}
		}
		else if(rp->ai_family ==  AF_INET6){
			servAddr_In6 = (struct sockaddr_in6 *) rp->ai_addr;
			inet_ntop(rp->ai_family, &servAddr_In6->sin6_addr.s6_addr, addrString, sizeof(addrString));
			sockfd = socket(rp->ai_family, rp->ai_socktype, rp->ai_protocol);
			if (sockfd == -1)continue;
			if(connect(sockfd, rp->ai_addr, rp->ai_addrlen) !=-1) {
				printf("IPv6 detected\n");
				break;
			}
		}
	}
	ssize_t echoStringLen = strlen(echoString);
	ssize_t sentLen = send(sockfd, echoString, echoStringLen, 0);
	if (sentLen < 0) {
		printf("send() failed\n");
		exit(-1);
	} else if (sentLen != echoStringLen) {
		printf("send(): sent unexpected number of bytes\n");
		exit(-1);
	}

	// Receive string from server
	unsigned int totalRecvLen = 0;

	fputs("Received: ", stdout);
	while (totalRecvLen < echoStringLen) {
		char buffer[BUFSIZE];
		memset(buffer, 0, BUFSIZE);
		ssize_t recvLen = recv(sockfd, buffer, BUFSIZE - 1, 0);
		if (recvLen < 0) {
			printf("recv() failed\n");
			exit(-1);
		} else if (recvLen == 0) {
			printf("recv() connection closed prematurely\n");
			exit(-1);
		}
	
		totalRecvLen += recvLen;
		buffer[recvLen] = '\n';
		fputs(buffer, stdout);	
	}
	fflush(stdout);
	close(sockfd);
	exit(0);
}
