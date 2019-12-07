#include <iostream>
#include <fstream>
#include <thread>
#include <vector>
#include <atomic>
#include <unistd.h>
#include <random>
#include <chrono>
#define lli long long int
#define scale 1000
using namespace std;

std::atomic<int> currect_session = ATOMIC_VAR_INIT(-1);         // Atomic variable for maintaining current session in CS
std::atomic<int> count = ATOMIC_VAR_INIT(0);                    // Atomic variable for maintaining no of threads in CS
lli n,k,S;														// No. of threads, no of times each thread will enter the CS, No. of sessions
double lt1,lt2;													// λ1, λ2
default_random_engine generator(time(NULL));					// Random number generator
exponential_distribution<double> *distribution1,*distribution2; // Exponential Distributions
uniform_int_distribution<int> *distribution3;
time_t t;														
chrono::duration<double> waiting_time(0); 						// Average waiting time
chrono::duration<double> max_waiting_time(0); 					// Max waiting time
chrono::duration<double> tmp(0); 								
pthread_mutex_t mutex;                                          // Mutex lock
pthread_cond_t *self;                                           // array of conditional variables


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

void entry_sec(int id,int s){
    if(currect_session==-1)currect_session=s;
    while(s!=currect_session){
        if(currect_session==-1)currect_session=s;
        pthread_cond_wait(&self[id],&mutex);
    }
}


void exit_sec(int id){
    count--;
    if(count==0){
        currect_session=-1;
        for (int i = 0; i < n; ++i)pthread_cond_signal(&self[i]);
    }
}

void testCS(int id){                                                            // test function
    // thread::id id = this_thread::get_id();
    chrono::time_point<chrono::system_clock> start_time,end_time;               // Variables for calculating waiting time
    for(int i=0;i<k;i++){


        int s = ((*distribution3)(generator));                                  // Get a random number

        start_time = chrono::system_clock::now();           
        printf("%dth CS Request at %s by thread %d for session %d \n",i,getSysTime().data(),id,s);
        pthread_mutex_lock(&mutex);                                             // Lock for conditional variables
        entry_sec(id,s);                                                        // Request for entry

        // Critical Section Starts
        end_time = chrono::system_clock::now();
        printf("%dth CS Entry   at %s by thread %d for session %d \n",i,getSysTime().data(),id,s);

        count++;

        tmp=(end_time - start_time);
        waiting_time +=tmp;                             // Calculating waiting time
        max_waiting_time = max(max_waiting_time,tmp);   // Updating max time taken
        usleep((*distribution1)(generator)*scale);
        
        exit_sec(id);                                   // Exiting CS
        pthread_mutex_unlock(&mutex);
        printf("%dth CS Exit    at %s by thread %d for session %d \n",i,getSysTime().data(),id,s);

        // Critical Section ends

        // Reminder Section starts
        usleep((*distribution2)(generator)*scale);
    }
}

int main(){
	ifstream fin("inp-params.txt");
	fin>>n>>k>>S>>lt1>>lt2;
	fin.close();
    self = new pthread_cond_t[n];

	distribution1 = new exponential_distribution<double>(1/lt1);
	distribution2 = new exponential_distribution<double>(1/lt2);
    distribution3 = new uniform_int_distribution<int>(1,S);

	vector<thread> t;														// Array of n threads
	for(int i=0;i<n;i++) t.push_back(thread(testCS,i));
	for(int i=0;i<n;i++) t[i].join();
    cout <<"Average time = " << waiting_time.count()/(n*k)*1000 << " ms\n"; 
    cout <<"Max waiting time = " << max_waiting_time.count()*1000 << " ms\n";
    delete[] self;
    delete distribution1;
    delete distribution2;
    delete distribution3;
	return 0;
}