#include <iostream>
#include <fstream>
#include <thread>
#include <vector>
#include <unistd.h>
#include <random>
#include <chrono>
#include <semaphore.h>
#define lli long long int
#define scale 1000000
using namespace std;

sem_t rw_mutex,mutex;
lli nw,nr,kw,kr,reader_count=0;										// no of readers,no of writers, no of executions of reader and writer
double mu_cs,mu_rem;
default_random_engine generator(time(NULL));						// Random number generator
exponential_distribution<double> *distribution1,*distribution2; 	// Exponential Distributions
chrono::duration<double> average_time_reader(0); 					
chrono::duration<double> average_time_writer(0); 				
chrono::duration<double> worst_time_reader(0); 					
chrono::duration<double> worst_time_writer(0);
time_t t;
FILE *out = fopen("RW-log.txt","w");				

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

void writer(int id){
	chrono::time_point<chrono::system_clock> start_time,end_time;				// Variables for calculating waiting time
	chrono::duration<double> temp(0);				
	for (int i = 0; i <= kw; ++i){
		fprintf(out,"%dth CS Request by Writer Thread %d at %s \n",i,id,getSysTime().data());
    	start_time = chrono::system_clock::now();
		sem_wait(&rw_mutex);
		end_time = chrono::system_clock::now();
		temp=(end_time-start_time);
		average_time_writer+=temp;
		worst_time_writer = max(worst_time_writer,temp);
		fprintf(out,"%dth CS Entry   by Reader Thread %d at %s \n",i,id,getSysTime().data());
		usleep((*distribution1)(generator)*scale);
		fprintf(out,"%dth CS Exit    by Reader Thread %d at %s \n",i,id,getSysTime().data());
		sem_post(&rw_mutex);
		usleep((*distribution2)(generator)*scale);
	}
}

void reader(int id){
	chrono::time_point<chrono::system_clock> start_time,end_time;				// Variables for calculating waiting time
	chrono::duration<double> temp(0);				
	for (int i = 0; i < kr; ++i){
		fprintf(out,"%dth CS Request by Reader Thread %d at %s \n",i,id,getSysTime().data());
    	start_time = chrono::system_clock::now();
		sem_wait(&mutex);
		reader_count++;
		if(reader_count==1)sem_wait(&rw_mutex);
		end_time = chrono::system_clock::now();
		temp=(end_time-start_time);
		average_time_reader+=temp;
		worst_time_reader = max(worst_time_reader,temp);
		fprintf(out,"%dth CS Entry   by Reader Thread %d at %s \n",i,id,getSysTime().data());
		sem_post(&mutex);
		usleep((*distribution1)(generator)*scale);

		sem_wait(&mutex);
		reader_count--;
		if(reader_count==0)sem_post(&rw_mutex);
		fprintf(out,"%dth CS Exit    by Reader Thread %d at %s \n",i,id,getSysTime().data());
		sem_post(&mutex);
		usleep((*distribution2)(generator)*scale);
	}
}

int main(){
	ifstream fin("inp-params.txt");
	fin>>nw>>nr>>kw>>kr>>mu_cs>>mu_rem;
	fin.close();
	distribution1 = new exponential_distribution<double>(1/mu_cs);
	distribution2 = new exponential_distribution<double>(1/mu_rem);
	sem_init(&rw_mutex,0,1);
	sem_init(&mutex,0,1);
	vector<thread> readers;														// Array of kr reader threads
	vector<thread> writers;														// Array of kw writer threads
	for(int i=0;i<nr;i++) readers.push_back(thread(reader,i));
	for(int i=0;i<nw;i++) writers.push_back(thread(writer,i));
	for(int i=0;i<nr;i++) readers[i].join();
	for(int i=0;i<nw;i++) writers[i].join();
	fclose(out);
	ofstream fout("Average_time.txt");
    fout <<"Average time of readers = " << average_time_reader.count()*1000/(nr*kr) << "s\n"; 
    fout <<"Average time of writers = " << average_time_writer.count()*1000/(nw*kw) << "s\n";
    fout <<"Worst case time of readers = " << worst_time_reader.count()*1000 << "s\n"; 
    fout <<"Worst case time of writers = " << worst_time_writer.count()*1000 << "s\n"; 
    fout.close();
    delete distribution1;
    delete distribution2;
	return 0;
}