#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define BUFSIZE 1024

int main() {
    char servIP[100] = "127.0.0.1"; 
    in_port_t servPort = 8002;
	printf("Enter: <Server Address>\n");
    // scanf("%s", servIP);
    printf("Enter: <Port>\n");
    // scanf("%hu", &servPort);

	//Creat a socket
	int sockfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
	if (sockfd < 0) {
		perror("socket() failed");
		exit(-1);
	}

    struct sockaddr_in servAddr;
   	memset(&servAddr, 0, sizeof(servAddr));
    servAddr.sin_family = AF_INET;
	int err = inet_pton(AF_INET, servIP, &servAddr.sin_addr.s_addr);
	if (err <= 0) {
		perror("inet_pton() failed");
		exit(-1);
	}
    servAddr.sin_port = htons(servPort);

	// Connect to server
	if (connect(sockfd, (struct sockaddr *) &servAddr, sizeof(servAddr)) < 0) {
		perror("connect() failed");
		exit(-1);
	}
    printf("Connected to server: %s\nPort: %hu\n", servIP, servPort);


    printf("------------------- Welcome ---------------------\n\n");
    printf("Enter:\nCommand 1 ->    !<cmd> -> Exec <cmd> command \nCommand 2 ->    <Msg> - Send msg other \nCommand 3 ->    Bye - Disconnect\n\n");
	while(1){
		printf("Send message to User1\n>> ");
	    char id[1024]; 
	    int echoStringLen = 1024;
	    fgets(id, 1024, stdin);
	    if(strcmp(id,"Bye")==0)break;
		ssize_t sentLen = send(sockfd, id, 1024, 0);
		if (sentLen < 0) {
			perror("send() failed");
			exit(-1);
		} else if (sentLen != echoStringLen) {
			perror("send(): sent unexpected number of bytes");
			exit(-1);
		}
		printf("Over\n");

		// Receive string from server
		unsigned int totalRecvLen = 0;
		fputs(">> ", stdout);
		char buffer[BUFSIZE];
        ssize_t recvLen = recv(sockfd, buffer, BUFSIZE - 1, 0);
		printf("<< Message Received from User1\n");
		// while (totalRecvLen < echoStringLen) {
		// 	memset(buffer, 0, BUFSIZE);
		// 	if (recvLen < 0) {
		// 		perror("recv() failed");
		// 		exit(-1);
		// 	} else if (recvLen == 0) {
		// 		perror("recv() connection closed prematurely");
		// 		exit(-1);
		// 	}
		
			// totalRecvLen += recvLen;
        buffer[recvLen] = '\0';
        fputs(buffer, stdout);	
		// }
	}
	
	close(sockfd);
	exit(0);
}