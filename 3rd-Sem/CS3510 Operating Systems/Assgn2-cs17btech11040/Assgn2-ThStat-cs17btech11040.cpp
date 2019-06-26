#include<iostream>
#include<pthread.h>
#include<cmath>
#include <cstring>
#include<algorithm>

using namespace std;

double mean,median,stddev;
int n;
double *a;

void* Mean(void *param){
	for (int i = 0; i < n; ++i)	mean=(mean/(i+1))*i+a[i]/(i+1);
	pthread_exit(0);
}

void* Median(void *param){
	double *arr=new double[n];
	memcpy(arr,a,n*sizeof(double));
	nth_element(arr,arr+n/2,arr+n);
	if(n&1)median=arr[n/2];
	else{
		nth_element(arr,arr+n/2-1,arr+n);
		median=(arr[n/2]+arr[n/2-1])/2;
	}
	delete[] arr;
	pthread_exit (0);
}

void* std_dev(void *param) {
   	double var=0,mm=0;
    int i=0;
    for (i = 0; i < n; ++i){
    	mm+=a[i];
    	var+=a[i]*a[i];
    }
    stddev=((var-pow(mm,2)/n))/(n-1);
    stddev=sqrt(stddev);
	pthread_exit(0);
}

int main(){
	scanf("%d",&n);
	a=new double[n];
	for (int i = 0; i < n; ++i)scanf("%lf",&a[i]);
	pthread_t tid[3];
	pthread_attr_t attr[3];
	for (int i = 0; i < 3; ++i)
	{
		pthread_attr_init (&attr[i]);
	}
	pthread_create(&tid[0],&attr[0],Mean,nullptr);
	pthread_create(&tid[1],&attr[1],Median,nullptr);
	pthread_create(&tid[2],&attr[2],std_dev,nullptr);
	for (int i = 0; i < 3; ++i)pthread_join(tid[i],nullptr);
	printf("The average value is %lf\nThe standard deviation value is %lf\nThe median value is %lf\n",mean,stddev,median);
	delete[] a;
	return 0;

}