#include <iostream>
#include <fstream>
#include <thread>
#include <vector>
#include <atomic>
#include <unistd.h>
#include <random>
#include <chrono>
#define lli long long int
#define scale 1000000
using namespace std;

atomic_flag flag=ATOMIC_FLAG_INIT;								// Atomic bool variable flag set to false
lli n,k;														// No. of threads and no of times each thread will enter the CS
double lt1,lt2;													// λ1, λ2
default_random_engine generator(time(NULL));					// Random number generator
exponential_distribution<double> *distribution1,*distribution2; // Exponential Distributions
chrono::duration<double> waiting_time(0); 						// Average waiting time
time_t t;														
chrono::duration<double> max_waiting_time(0); 					// Max waiting time
chrono::duration<double> tmp(0); 								
ofstream fout("TAS-Log.txt");

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

void testCS(int id){															// test function
	// thread::id id = this_thread::get_id();
	chrono::time_point<chrono::system_clock> start_time,end_time;				// Variables for calculating waiting time
	for(int i=0;i<k;i++){
		// Entry Section Starts
		string reqEnterTime=getSysTime();
    	start_time = chrono::system_clock::now();			
		while(atomic_flag_test_and_set(&flag));									// Test and Set implementation

		// Critical Section Starts
    	end_time = chrono::system_clock::now();

		fout<<i<<"th CS Requested at "<<reqEnterTime<<" by thread "<< id <<endl;
		tmp=(end_time - start_time);
    	waiting_time +=tmp;								// Calculating waiting time
    	max_waiting_time = max(max_waiting_time,tmp);	// Updating max time taken
		fout<<i<<"th CS Entered at   "<<getSysTime()<<" by thread "<< id <<endl;
		usleep((*distribution1)(generator)*scale);
		fout<<i<<"th CS Exited at    "<<getSysTime()<<" by thread "<< id <<endl;
		flag.clear();
		// Critical Section ends

		// Reminder Section starts
		usleep((*distribution2)(generator)*scale);
	}
}

int main(){
	ifstream fin("inp-params.txt");
	fin>>n>>k>>lt1>>lt2;
	fin.close();

	distribution1 = new exponential_distribution<double>(1/lt1);
	distribution2 = new exponential_distribution<double>(1/lt2);

	vector<thread> t;														// Array of n threads
	for(int i=0;i<n;i++) t.push_back(thread(testCS,i));
	for(int i=0;i<n;i++) t[i].join();
	fout.close();

	fout.open("TAS-Stats.txt");	
    fout <<"Average time = " << waiting_time.count()/(n*k) << "s\n"; 
    fout <<"Max waiting time = " << max_waiting_time.count() << "s\n";
    fout.close();

    delete distribution1;
    delete distribution2;
	return 0;
}