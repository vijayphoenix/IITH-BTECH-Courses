#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/wait.h>
#include <sys/time.h>

int main(int argc, char *argv[]){
	// If no arguments are passed
	if (argv[1]==NULL){						
		printf("Please enter some arguments\n");
		return 0;
	}
	// Creating a Process Indetifier(pid) variable 
	pid_t pid;		
	// The size (in bytes) of shared memory object				
	const int SIZE = 128;
	// name of the shared memory object 
	const char *name = "OS1";
	// shared memory file descriptor
	int fd;
	// pointer to shared memory obect
	char *ptr;
	// This struct consists of two members: tv_sec and t_usec 
	struct timeval current;
	// create the shared memory object
	fd= shm_open(name,O_CREAT | O_RDWR,0666);
	// configure the size of the shared memory object
	ftruncate (fd, SIZE);
	// memory map the shared memory object
	ptr= (char *)mmap(0, SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	// fork a child process
	pid = fork ();
	// error occured
	if (pid < 0) { 
		fprintf(stderr, "Fork Failed");
		return 1;
	}
	else if (pid == 0) {				// pid of child processes is 0
		gettimeofday(&current,NULL);	// This function is used to record the current timestamp.
		sprintf(ptr,"%ld %ld",current.tv_sec,current.tv_usec);
		execvp(argv[1], argv+1);		// execvp() system call is used to replace the process’s memory space with a new program.
		return 0;
	}
	else { 								// pid of parent processes is greater than 0
		wait(NULL);						// parent will wait for the child process to complete
		gettimeofday(&current,NULL);
		long int temp1,temp2;
		sscanf(ptr,"%ld %ld",&temp1,&temp2);
		double t=current.tv_sec+current.tv_usec*0.000001;
		t=t-temp1-temp2*0.000001;		// Calculating the difference between the starting and the end time
		printf("Elapsed time: %lf\n",t);// Outputs the time elaspsed in seconds
		shm_unlink (name);				// Remove the shared memory object
	}
	return 0;
}