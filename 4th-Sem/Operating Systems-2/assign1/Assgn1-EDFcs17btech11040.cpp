#include<iostream>
#include<fstream>
#include <utility>
#include<queue>
#define lli long long int
using namespace std;
typedef pair<int, lli> Pair;

class PCB{
public:
	PCB(){}
	~PCB(){}
	int id;		// Processor id
	lli time;	// Burst time
	lli period;	// Deadline
	lli next_deadline;
	double waiting_time=0;
	double start_time=0;
	int k;		// No of instances
	bool flag=false;
	bool operator() (Pair a, Pair b){		// Comparator function for specifing priorities.
        return a.second > b.second;
    }
};

int main(){
	ifstream fin("inp-params.txt");
	priority_queue<Pair,vector<Pair>,PCB> ready_queue;			// Ready queue
	priority_queue<Pair,vector<Pair>,PCB> next_process_queue;	// Event queue
	int n;						// No of processes
	fin>>n;					
	PCB processes[n+1];			// Array of objects of Class PCB. It is used to provide a mapping between PCB information and process id
	lli misses=0;				// No of Misses
	int pid;					
	lli remaining_burst_time[n+1]={};		// Array for storing remaining burst time of process
	lli timer=0;							// Time elasped till now
	lli total_processes=0;

	ofstream fout("EDF-Log.txt");				
	for (int i = 0; i < n; i++)					// Input taken
	{
		fin>>pid;
		fin>>processes[pid].time>>processes[pid].period>>processes[pid].k;
		total_processes+=processes[pid].k;
		if(processes[pid].k>0)fout<<"Process P"<<pid<<": processing time "<<processes[pid].time<<"; deadline:"<<processes[pid].period<<"; period:"<<processes[pid].period<<"; joined the system at time "<<timer<<"\n";
		if(processes[pid].k>0)next_process_queue.push(Pair(pid,0));
	}

	fin.close();

	while(!next_process_queue.empty() || !ready_queue.empty()){							// All processes should terminate

		if(!next_process_queue.empty() && timer==next_process_queue.top().second){		// Arrival Time of process == Timer  
			pid=next_process_queue.top().first;
			processes[pid].next_deadline=timer+processes[pid].period;
				if(remaining_burst_time[pid]==0){									// process is not present in ready queue
					ready_queue.push(Pair(pid,processes[pid].next_deadline));
					processes[pid].start_time=timer;
				}
				else{																	// process is at the top of the ready priority queue
					fout<<"Process P"<<pid<<" missed deadline at time "<<timer<<".\n";
					misses++;
					processes[pid].waiting_time+=(timer-processes[pid].start_time);
					processes[pid].start_time=timer;
					ready_queue.pop();
					ready_queue.push(Pair(pid,processes[pid].next_deadline));
				}
			remaining_burst_time[pid]=processes[pid].time;								// Reseting  parameters related to the current process 
			processes[pid].k--;
			next_process_queue.pop();
			if(processes[pid].k>0)next_process_queue.push(Pair(pid,processes[pid].next_deadline));		// Push another instances of current process if it exists
			continue;
		}

		if(ready_queue.empty()){														//Ready queue is empty
			if(!next_process_queue.empty()){
				timer=next_process_queue.top().second;
				fout<<"CPU is idle till time "<<timer<<".\n";
				continue;
			}
			else break;
		}
		else{																			 
			pid=ready_queue.top().first;
			if(processes[pid].time==remaining_burst_time[pid]){							// PCB starts on cpu
				fout<<"Process P"<<pid<<" starts executing on at time "<<timer<<".\n";
				processes[pid].flag=false;
			}
			else if(processes[pid].flag){												// PCB resumes on CPU
				fout<<"Process P"<<pid<<" resumes execution at time "<<timer<<".\n";
				processes[pid].flag=false;
			}																				// When ready queue is empty
			if(next_process_queue.empty()){												
				if(remaining_burst_time[pid]+timer <= processes[pid].next_deadline){			//process completes succesfully
					processes[pid].waiting_time+=(timer-processes[pid].start_time);
					
					timer+=remaining_burst_time[pid];
					processes[pid].next_deadline+=processes[pid].period;
					fout<<"Process P"<<pid<<" finishes execution at time "<<timer<<".\n";
					remaining_burst_time[pid]=0;
					ready_queue.pop();
				}
				else{
					processes[pid].waiting_time+=(timer-processes[pid].start_time);//process misses its deadline
					timer=processes[pid].next_deadline;
					remaining_burst_time[pid]=0;
					processes[pid].next_deadline+=processes[pid].period;
					fout<<"Process P"<<pid<<" missed deadline at time "<<timer<<".\n";
					misses++;
					ready_queue.pop();
				}
			}
			else{
				if(remaining_burst_time[pid]+timer <= processes[pid].next_deadline && 	(next_process_queue.top().second >= remaining_burst_time[pid]+timer)){
					processes[pid].waiting_time+=(timer-processes[pid].start_time);
					timer+=remaining_burst_time[pid];														//process completes succesfully
					remaining_burst_time[pid]=0;
					fout<<"Process P"<<pid<<" finishes execution at time "<<timer<<".\n";
					processes[pid].next_deadline+=processes[pid].period;
					ready_queue.pop();
				}																								
				else if(next_process_queue.top().second < processes[pid].next_deadline){							//process is preempted
					processes[pid].waiting_time+=(timer-processes[pid].start_time-processes[pid].time+remaining_burst_time[pid]);
					remaining_burst_time[pid]-=(next_process_queue.top().second-timer);
					timer=next_process_queue.top().second;
					if(processes[next_process_queue.top().first].next_deadline < processes[pid].next_deadline){
						fout<<"Process P"<<pid<<" is preempted by P"<<next_process_queue.top().first<<" at time "<<timer<<"\n";
						processes[pid].flag=true;
					}
				}
				else{
					processes[pid].waiting_time+=(timer-processes[pid].start_time);

					timer=processes[pid].next_deadline;																//process misses its deadline
					remaining_burst_time[pid]=0;
					fout<<"Process P"<<pid<<" missed deadline at time "<<timer<<"\n";
					misses++;
					processes[pid].next_deadline+=processes[pid].period;
					ready_queue.pop();
				}

			}
		}
	}
	fout.close();
	fout.open("EDF-Stats.txt");
	fout<<"Number of processes that came into the system:"<<total_processes<<"\n";
	fout<<"Number of processes successfully completed:"<<total_processes-misses<<"\n";
	fout<<"Number of processes missed deadline:"<<misses<<"\n";
	fout<<"Average wait time: ";
	double sum=0;
	for (int i = 0; i < n; ++i)
	{
		sum+=processes[i].waiting_time;
	}
	fout<<sum/total_processes<<"\n";
	fout.close();
}