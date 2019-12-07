#include <iostream>
#include <fstream>
#include <thread>
#include <vector>
#include <unistd.h>
#include <random>
#include <chrono>
#include <pthread.h>
#define lli long long int
#define scale 1000
#define THINKING 0
#define HUNGRY 1
#define EATING 2
using namespace std;

lli n,h;										                    // no of philosopher, no of executions
double mu_eat,mu_think;											    // μeat, μthink
default_random_engine generator(time(NULL));						// Random number generator
exponential_distribution<double> *distribution1,*distribution2; 	// Exponential Distributions
chrono::duration<double> average_time(0); 					
chrono::duration<double> worst_time(0);
chrono::duration<double> temp(0);         			
time_t t;
pthread_mutex_t mutex;                                              // Mutex lock
pthread_cond_t *self;                                               // array of conditional variables
int *state;			                                                // Array of state of philosopher
FILE *out = fopen("Phil-log.txt","w");    

string getSysTime()												// Returns a string in following format -> hh:mm:ss
{
	time(&t);
	struct tm * time;
	time = localtime (&t);
	char s[9];
	sprintf(s,"%.2d:%.2d:%.2d",time->tm_hour,time->tm_min,time->tm_sec);
	string str(s);
	return str;
}

void test(int i){                                       // Function to signal self
    if(state[i]==HUNGRY)pthread_cond_signal(&self[i]);
}

void pickup(int i){                                     // Picks up chopsticks or wait till you have a chance
    pthread_mutex_lock(&mutex);
    state[i] = HUNGRY;
    while((state[(i+n-1)%n]==EATING) || (state[(i+1)%n]==EATING)){
        pthread_cond_wait(&self[i],&mutex);
    }
    state[i] = EATING;
    pthread_mutex_unlock(&mutex);
}

void putdown(int i){                                    // Release chopsticks
    pthread_mutex_lock(&mutex);
    state[i] = THINKING;
    test((i+n-1)%n);
    test((i+1)%n);
    pthread_mutex_unlock(&mutex);
}

void philosopher(int id){
	chrono::time_point<chrono::system_clock> start_time,end_time;			// Variables for calculating waiting time
	for (int i = 0; i < h; ++i){
		fprintf(out,"%dth eat request by Thread %d at %s \n",i,id,getSysTime().data());
    	start_time = chrono::system_clock::now();
		pickup(id);                                                          
        end_time = chrono::system_clock::now();
        fprintf(out,"%dth CS Entry by Philosopher Thread %d at %s \n",i,id,getSysTime().data());
        temp =end_time-start_time;
        average_time+= temp;
        worst_time= max(temp,worst_time);
        usleep((*distribution1)(generator)*scale);                          //eat
        putdown(id);
        fprintf(out,"%dth CS Exit by Philosopher Thread %d at %s \n",i,id,getSysTime().data());
        usleep((*distribution2)(generator)*scale);                          //think
	}
}

int main(){
	ifstream fin("inp-params.txt");
    fin>>n>>h>>mu_eat>>mu_think;
	fin.close();
    state = new int[n]{};
    self = new pthread_cond_t[n];
    pthread_mutex_init(&mutex,NULL);                                    // initializing mutex
    for (int i = 0; i < n; ++i)
        pthread_cond_init(&self[i],NULL);                               // initializing conditional variables
	distribution1 = new exponential_distribution<double>(1/mu_eat);
	distribution2 = new exponential_distribution<double>(1/mu_think);
	vector<thread> philosophers;										// Array of np producer threads
	for(int i=0;i<n;i++) philosophers.push_back(thread(philosopher,i));
	for(int i=0;i<n;i++) philosophers[i].join();
    fclose(out);
    ofstream fout("Time.txt");
    fout <<"Average time = " << average_time.count()/(n*h) << " s\n"; 
    fout <<"Worst time = " << worst_time.count() << " s\n"; 
    fout.close();
    delete[] state;
    delete[] self;
    delete distribution1;
    delete distribution2;
	return 0;
}