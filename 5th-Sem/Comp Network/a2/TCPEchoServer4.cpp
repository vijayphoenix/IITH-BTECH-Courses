#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <pthread.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <arpa/inet.h>

#define BUFSIZE 1024

static const int MAXPENDING = 10; // Maximum outstanding connection requests

int clientCount = 0;

static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
static pthread_cond_t cond = PTHREAD_COND_INITIALIZER;

struct client{
	int index;
	int sockID;
	struct sockaddr_in clientAddr;
	int len;
};

char name[1024][100];
int name_id =0;
struct client Client[1024];
pthread_t thread[1024];

void * host(void * ClientDetail){

	struct client* clientDetail = (struct client*) ClientDetail;
	int index = clientDetail -> index;
	int clientSocket = clientDetail -> sockID;

	printf("Client %d connected.\n",index + 1);

	while(1){

		char data[1024];
		int read = recv(clientSocket,data,1024,0);
		data[read] = '\0';
		char output[1024];

		if(strcmp(data,"User@name") == 0){
			read = recv(clientSocket,data,1024,0);
			data[read] = '\0';
			int i=0;
			for(i=0; i <name_id;i++){
				if(strcmp(data,name[i]) == 0){
					send(clientSocket,"0",10,0);
					break;
				}
			}
			if(i== name_id){
				printf("hogaya");
				name_id++;
				strcpy(name[name_id],data);
				send(clientSocket,"1",10,0);
			}
			// snprintf(output, 100, "Registered successfully\n");
		}
		else if(strcmp(data,"User_List") == 0){

			int l = 0;

			for(int i = 0 ; i < clientCount ; i ++){
				if(i != index)
					l += snprintf(output + l,1024,"Client %d: %s.\n",i + 1,name[i]);
			}
			send(clientSocket,output,1024,0);
			continue;
		}
		else if(strcmp(data,"SEND") == 0){
			read = recv(clientSocket,data,1024,0);
			data[read] = '\0';
			int id = atoi(data) - 1;
			read = recv(clientSocket,data,1024,0);
			data[read] = '\0';
			send(Client[id].sockID,data,1024,0);			
		}
	}
	return NULL;
}

int main(){
	
    char servIP[100] = "127.0.0.1"; 
    in_port_t servPort = 8002;
	printf("Enter: <Server Address>\n");
    // scanf("%s", servIP);
    printf("Enter: <Port>\n");
    // scanf("%hu", &servPort);

	// create socket for incoming connections
	int servSock;
	if ((servSock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
		perror("socket() failed");
		exit(-1);
	}

	// Set local parameters
	struct sockaddr_in servAddr;
	memset(&servAddr, 0, sizeof(servAddr));
	servAddr.sin_family = AF_INET;
	servAddr.sin_addr.s_addr = htonl(INADDR_ANY);
	servAddr.sin_port = htons(servPort);


	// Bind to the local address
	if (bind(servSock, (struct sockaddr *) &servAddr, sizeof(servAddr)) < 0) {
		perror("bind() failed");
		exit(-1);
	}

	// Listen to the client
	if (listen(servSock, MAXPENDING) < 0) {
		perror("listen() failed");
		exit(-1);
	}
    printf("Server hosted on IP: %s\nListening on Port: %hu ..........\n", servIP, servPort);
	while(1){

		Client[clientCount].sockID = accept(servSock, (struct sockaddr*) &Client[clientCount].clientAddr, &Client[clientCount].len);
		if(Client[clientCount].sockID < 0){
			perror("accept() failed");
			exit(-1);
		}
		Client[clientCount].index = clientCount;
		pthread_create(&thread[clientCount], NULL, host, (void *) &Client[clientCount]);
		clientCount ++;
	}

	for(int i = 0 ; i < clientCount ; i ++)
		pthread_join(thread[i],NULL);

}