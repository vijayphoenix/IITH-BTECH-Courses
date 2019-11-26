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
		perror("<Server Address> <Server Port> <Echo Word>");
		exit(-1);
	}
	
	char *servIP = argv[1];
	char *echoString = argv[3];
	
	// Set port num
	in_port_t servPort = atoi(argv[2]);
	
	// int sockfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
	// if (sockfd < 0) {
	// 	perror("socket() failed");
	// 	exit(-1);
	// }
	struct sockaddr_in *servAddr_In4;
   struct sockaddr_in6 *servAddr_In6;
   struct sockaddr_storage peer_addr;
   char addrString[INET6_ADDRSTRLEN];
   memset(addrString, 0, sizeof(addrString));
	

   memset(&hints, 0, sizeof(struct addrinfo));
   hints.ai_family = AF_UNSPEC; // IPv4 or v6
   hints.ai_socktype = SOCK_STREAM;// Hardcoded TCP as dummy
   hints.ai_protocol = IPPROTO_TCP; // Hardcoded TCP as dummy
   hints.ai_flags = AI_CANONNAME;
   int s = getaddrinfo(servIP, NULL, &hints, &result);
// for (rp = result; rp != NULL; rp = rp->ai_next) {
   // I want canonical name!!
   switch (rp->ai_family) {
      case AF_INET:
         printf("ip4");
         servAddr_In4 = (struct sockaddr_in *) rp->ai_addr;
         inet_ntop(rp->ai_family, &servAddr_In4->sin_addr.s_addr, addrString, sizeof(addrString));
      break;
      case AF_INET6:
         printf("ip6");
         servAddr_In6 = (struct sockaddr_in6 *) rp->ai_addr;
         inet_ntop(rp->ai_family, &servAddr_In6->sin6_addr.s6_addr, addrString, sizeof(addrString));
      break;
   }
	// // Set the server address
	// memset(&servAddr_ip4, 0, sizeof(servAddr_ip4));
	// servAddr_ip4.sin_family = AF_INET;
	// int err = inet_pton(AF_INET, servIP, &servAddr_ip4.sin_addr.s_addr);
	// if (err <= 0) {
	// 	perror("inet_pton() failed");
	// 	exit(-1);
	// }
	// servAddr_ip4.sin_port = htons(servPort);
	
	// // Connect to server
	// if (connect(sockfd, (struct sockaddr *) &servAddr_ip4, sizeof(servAddr_ip4)) < 0) {
	// 	perror("connect() failed");
	// 	exit(-1);
	// }
	
	// size_t echoStringLen = strlen(echoString);
	
	// // Send string to server
	// ssize_t sentLen = send(sockfd, echoString, echoStringLen, 0);
	// if (sentLen < 0) {
	// 	perror("send() failed");
	// 	exit(-1);
	// } else if (sentLen != echoStringLen) {
	// 	perror("send(): sent unexpected number of bytes");
	// 	exit(-1);
	// }

	// // Receive string from server
	// unsigned int totalRecvLen = 0;

	// fputs("Received: ", stdout);
	// while (totalRecvLen < echoStringLen) {
	// 	char buffer[BUFSIZE];
	// 	memset(buffer, 0, BUFSIZE);
	// 	ssize_t recvLen = recv(sockfd, buffer, BUFSIZE - 1, 0);
	// 	if (recvLen < 0) {
	// 		perror("recv() failed");
	// 		exit(-1);
	// 	} else if (recvLen == 0) {
	// 		perror("recv() connection closed prematurely");
	// 		exit(-1);
	// 	}
	
	// 	totalRecvLen += recvLen;
	// 	buffer[recvLen] = '\n';
	// 	fputs(buffer, stdout);	
	// }
	
	// close(sockfd);
	// exit(0);
}
