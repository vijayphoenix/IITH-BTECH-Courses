#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <pthread.h>

#define BUFSIZE 1024

void recieveData(char * buffer, int sockfd){
	memset(buffer, 0, BUFSIZE);
	ssize_t recvLen = recv(sockfd, buffer, BUFSIZE - 1, 0);
	if (recvLen < 0) {
		perror("recv() failed");
		exit(-1);
	}
	buffer[recvLen] = '\0';
}

void sendData(char * buffer, int sockfd, ssize_t len){
	ssize_t sentLen = send(sockfd, buffer, len, 0);
	if (sentLen < 0) {
		perror("send() failed");
		exit(-1);
	}
    else if (sentLen != len){
        perror("send(): sent unexpected number of bytes");
		exit(-1);
    }
	memset(buffer, 0, BUFSIZE);
}


void * recieve(void * sockID){
    int sockfd = *((int *) sockID);
    while(1){
        char buffer[BUFSIZE];
        recieveData(buffer, sockfd);
        printf("\n<<");
        printf("%s\n",buffer);
        printf(">> ");
        fflush(stdout);
    }
}

int main() {
    char servIP[100] = "127.0.0.1"; 
    in_port_t servPort = 8002;
	printf("Enter: <Server Address>\n");
    // scanf("%s", servIP);
    printf("Enter: <Port>\n");
    // scanf("%hu", &servPort);

	// Create a socket
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

    printf("Enter: <User_ID>\n");
    ssize_t length;
    char id[BUFSIZE] = "User@name";
    length = strlen(id);
    sendData(id, sockfd, length);
    scanf("%s",id);
    length = strlen(id);

    printf("------------------- Welcome %s---------------------\n\n" , id);
    printf("Enter:\nCommand 1 ->    User_List - To get list of all the users\nCommand 2 ->    Send <ID> <Msg> - To send msg to user with <ID> user_id\n\n");
    printf("Happy Chatting!!!\n\n\n");
    
    sendData(id, sockfd, length);

    pthread_t thread;
    pthread_create(&thread, NULL, recieve, (void *) &sockfd );

    while(1){
        printf(">> ");
       	size_t len;
        char input[BUFSIZE];
        scanf("%s",input);
        len = strlen(input);

        if(strcmp(input,"User_List") == 0){
            sendData(input, sockfd, len);
        } else if (strcmp(input,"Send") == 0){
            sendData(input, sockfd, len);
            
            scanf("%s",input);
            len = strlen(input);
            sendData(input, sockfd, len);

            scanf("%[^\n]s",input);
            len = strlen(input);
            sendData(input, sockfd, len);
        }
    }
}