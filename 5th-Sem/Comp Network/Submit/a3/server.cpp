#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>


#define BUFSIZE 1024

static const int MAXPENDING = 5; // Maximum outstanding connection requests

int main(int argc, char ** argv) {

	if (argc != 2) {
		perror("<server port>");
		exit(-1);
	}

    struct addrinfo hints;
    struct addrinfo *result, *rp;

    memset(&hints, 0, sizeof(struct addrinfo));
    hints.ai_family = AF_INET6;
    hints.ai_socktype = SOCK_STREAM;// Hardcoded TCP as dummy
    hints.ai_protocol = 0; // Hardcoded TCP as dummy
    hints.ai_flags = AI_PASSIVE;
    hints.ai_canonname = NULL;
    hints.ai_addr = NULL;
    hints.ai_next = NULL;

    int s = getaddrinfo(NULL, argv[1], &hints, &result);
    if (s != 0) {
        fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(s));
        exit(EXIT_FAILURE);
    }
    int servSock;
    for (rp = result; rp != NULL; rp = rp->ai_next) {
        servSock = socket(AF_INET6, rp->ai_socktype, rp->ai_protocol);
        if (servSock == -1)
            continue;
        if (bind(servSock, rp->ai_addr, rp->ai_addrlen) == 0 and listen(servSock, MAXPENDING) == 0)
            break;                  /* Success */
    }

    if (rp == NULL) {               /* No address succeeded */
        fprintf(stderr, "Could not bind\n");
        exit(EXIT_FAILURE);
    }

    // Server Loop
	for (;;) {
		struct sockaddr_in6 clntAddr;
		socklen_t clntAddrLen = sizeof(clntAddr);
        printf("Waiting for Client\n");

		// Wait for a client to connect
		int clntSock = accept(servSock, (struct sockaddr *) &clntAddr, &clntAddrLen);
		if (clntSock < 0) {
			perror("accept() failed");
			exit(-1);
		}

        printf("Mesage Sent to client\n");


		char clntIpAddr[INET_ADDRSTRLEN];
		if (inet_ntop(AF_INET6, &clntAddr.sin6_addr.s6_addr, 
				clntIpAddr, sizeof(clntIpAddr)) != NULL) {
			printf("----\nHandling client %s %d\n", clntIpAddr, ntohs(clntAddr.sin6_port));
		}

		// Receive data
		char buffer[BUFSIZE];
		memset(buffer, 0, BUFSIZE);
		ssize_t recvLen = recv(clntSock, buffer, BUFSIZE - 1, 0);
		if (recvLen < 0) {
			perror("recv() failed");
			exit(-1);
		}
		buffer[recvLen] = '\n';
		fputs(buffer, stdout);

		while (recvLen > 0) {
			ssize_t sentLen = send(clntSock, buffer, recvLen, 0);
			if (sentLen < 0) {
				perror("send() failed");
				exit(-1);
			} else if (sentLen != recvLen) {
				perror("send() sent unexpected number of bytes");
				exit(-1);
			}

			// See if there is more data to receive
			memset(buffer, 0, BUFSIZE);
			recvLen = recv(clntSock, buffer, BUFSIZE, 0);
			if (recvLen < 0) {
				perror("recv() failed");
				exit(-1);
			} else if (recvLen > 0) { // some data was remaining
				buffer[recvLen] = '\n';
				fputs(buffer, stdout);
			}
		}
	}

	printf("End of Program\n");
}
