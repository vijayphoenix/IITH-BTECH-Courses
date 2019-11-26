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

	in_port_t servPort = atoi(argv[1]); // Local port
    struct addrinfo hints;
    struct addrinfo *result, *rp;
    char hostName[100]= "ip6-localhost";

    ssize_t nread;

    memset(&hints, 0, sizeof(struct addrinfo));
    hints.ai_family = AF_UNSPEC; // IPv4 or v6
    hints.ai_socktype = SOCK_STREAM;// Hardcoded TCP as dummy
    hints.ai_protocol = IPPROTO_TCP; // Hardcoded TCP as dummy
    hints.ai_flags = AI_CANONNAME;

    int s = getaddrinfo(hostName, NULL, &hints, &result);
    if (s != 0) {
        fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(s));
        exit(EXIT_FAILURE);
    }
    int servSock;
    for (rp = result; rp != NULL; rp = rp->ai_next) {
        servSock = socket(rp->ai_family, rp->ai_socktype, rp->ai_protocol);
        if (servSock == -1)
            continue;
        if (bind(servSock, rp->ai_addr, rp->ai_addrlen) == 0)
            break;                  /* Success */

        // close(servSock);
    }

    if (rp == NULL) {               /* No address succeeded */
        fprintf(stderr, "Could not bind\n");
        exit(EXIT_FAILURE);
    }
    struct sockaddr_storage *common;
    // struct sockaddr_in6 *saIn6;
    char addrString[INET6_ADDRSTRLEN];
    memset(addrString, 0, sizeof(addrString));
    switch (rp->ai_family) {
        case AF_INET:
            common = (struct sockaddr_storage *) rp->ai_addr;
            inet_ntop(rp->ai_family, &common->sin_addr.s_addr, addrString, sizeof(addrString));
        break;
        case AF_INET6:
            common = (struct sockaddr_storage *) rp->ai_addr;
            inet_ntop(rp->ai_family, &common->sin6_addr.s6_addr, addrString, sizeof(addrString));
        break;
        default:
        break;
    }

    struct sockaddr_storage peer_addr;
    socklen_t peer_addr_len =  sizeof(struct sockaddr_storage);

    // for (;;) {
    //     struct sockaddr_storage peer_addr;
    //     socklen_t peer_addr_len =  sizeof(struct sockaddr_storage);

}
