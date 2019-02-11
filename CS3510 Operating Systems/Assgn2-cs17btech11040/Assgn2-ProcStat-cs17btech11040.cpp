#include <iostream>
#include <unistd.h>
#include <fcntl.h>
#include <cmath>
#include <algorithm>
#include <sys/mman.h>
#include <sys/wait.h>
#define lli long long int

using namespace std;

double Mean(double arr[],int n){
	double mean=0;
	for (int i = 0; i < n; ++i)	mean=(mean/(i+1))*i+arr[i]/(i+1);
	return mean;
}

double Median(double arr[],int n){
	nth_element(arr,arr+n/2,arr+n);
	if(n&1)return arr[n/2];
	nth_element(arr,arr+n/2-1,arr+n);
	return (arr[n/2]+arr[n/2-1])/2;
}

double std_dev(double a[], int n) {
    double mean=Mean(a,n);
    mean*=mean;
    double var=0;
    for(int i = 0; i < n; ++i)var+=(a[i]*a[i]-mean)/(n-1);
    return sqrt(var);
}

int main(){
	int n;
	scanf("%d",&n);
	double *arr=new double[n];
	for (int i = 0; i < n; ++i)scanf("%lf",&arr[i]);	
	// The size (in bytes) of shared memory object				
	const int SIZE = 3*sizeof(double);
	// name of the shared memory object 
	const char *name = "OS1";
	// shared memory file descriptor
	int fd;
	// pointer to shared memory obect
	double *ptr;
	// create the shared memory object
	fd= shm_open(name,O_CREAT | O_RDWR,0666);
	// configure the size of the shared memory object
	ftruncate (fd, SIZE);
	// memory map the shared memory object
	ptr= (double*)mmap(0, SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	// fork a child process
	pid_t pid = fork();
	// error occured
	if (pid < 0) { 
		fprintf(stderr, "Fork Failed");
		return 1;
	}
	else if (pid==0) {			//Child Process 1 for calculating mean	
		ptr[0]=Mean(arr,n);
		return 0;
	}
	else{
		pid_t pid1=fork();
		if (pid1 < 0) { 
			fprintf(stderr, "Fork Failed");
			return 1;
		}
		else if(pid1 == 0) {	//Child Process 2 for calculating median
			ptr[1]=Median(arr,n);
			return 0;
		}
		else{
			pid_t pid2=fork();
			if (pid2 < 0) { 
				fprintf(stderr, "Fork Failed");
				return 1;
			}
			else if(pid2 == 0){		//Child process 3 for calculating standard deviation
				ptr[2]=std_dev(arr,n);
				return 0;
			}
			else waitpid(pid2,nullptr,0);
			waitpid(pid1,nullptr,0);
		}
		waitpid(pid,nullptr,0);
	}
	printf("The average value is %lf\nThe standard deviation value is %lf\nThe median value is %lf\n",ptr[0],ptr[2],ptr[1]);
	shm_unlink (name);
	delete [] arr;
	return 0;
}