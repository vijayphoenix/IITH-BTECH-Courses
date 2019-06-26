#include<iostream>
#include<algorithm>
#include<string>
#include<string.h>
#include<fstream>
#include<list> 
#include<set>
#include<map>
#include <queue>
#include<iterator>
using namespace std;

/*
In this program, I used the following STL libabries:
1)List class is used to implement cache.
2)Set class is used to store the address(unique)
3)Map class is used to store the positions of the addresses specified in the file (Precomputation)
*/

ofstream fout;
ifstream fin;
bool hm[50003]={false};
int TOTAL_ACCESSES=0,hits=0;

//This function writes the output to the file created
void display(int x){
	fout<<"TOTAL_ACCESSES = "<<TOTAL_ACCESSES<<"\n";
	fout<<"TOTAL_MISSES = "<<TOTAL_ACCESSES-hits<<"\n";
	fout<<"COMPULSORY_MISSES = "<<x<<"\n";
	fout<<"CAPACITY_MISSES = "<<TOTAL_ACCESSES-hits-x<<"\n";
	for (int i = 0; i < TOTAL_ACCESSES; i++){
		if(hm[i]==false)fout<<"MISS\n";
		else fout<<"HIT\n";		
	}
}

//When cache size is zero
void CacheIsZero(){
	string c;
	set<string>s;
	set<string>::iterator iter;
	while(fin>>c){
		s.insert(c);
		TOTAL_ACCESSES++;
	}
	display(s.size());
}

void LRU(int count){
	string c;
	list<string>l;
	list<string>::iterator it;
	set<string>s;
	set<string>::iterator iter;
	while(fin>>c){
		iter=s.find(c);
		if(iter==s.end()){
			s.insert(c);
			if(l.size()>=(unsigned int)(count))l.pop_front();
		}
		else{
			for(it=l.begin();it!=l.end();it++)
				if(c.compare(*it)==0)break;
			if(it!=l.end()){
				hm[TOTAL_ACCESSES]=true;
				hits++;
				l.erase(it);
			}
			else l.pop_front();
		}
		l.push_back(c);
		TOTAL_ACCESSES++;
	}
	display(s.size());
}

void FIFO(int count){
	string c;
	list<string>l;
	list<string>::iterator it;
	set<string>s;
	set<string>::iterator iter;
	while(fin>>c){
		iter=s.find(c);
		if(iter==s.end()){
			s.insert(c);
			if(int(l.size())>=count)
				l.pop_front();
			l.push_back(c);
		}
		else{
			for(it=l.begin();it!=l.end();it++)
				if(c.compare(*it)==0)break;
			if(it!=l.end()){
				hm[TOTAL_ACCESSES]=true;
				hits++;
			}
			else {
				l.pop_front();
				l.push_back(c);
			}
		}
		TOTAL_ACCESSES++;
	}
	display(s.size());
}

void OPTIMAL(int count,string file){
	string c;
	list<string>l;
	list<string>::iterator it,it2;
	set<string>s;
	set<string>::iterator iter;
	map <string,queue<int> >m;
	map< string,queue<int> >::iterator j;
	int i=0,maxi=0;
	while(fin>>c){
		m[c].push(i);
		i++;
	}
	fin.close();
	fin.open(file.data());
	for (j=m.begin();j!=m.end();j++){
		m[j->first].push(1e6);
	}
	while(fin>>c){
		iter=s.find(c);
		if(iter==s.end()){
			s.insert(c);
			if(l.size()>=(unsigned int)(count)){
				maxi=0;
				for(it=l.begin();it!=l.end();it++){
					if(maxi<m[*it].front()){
						maxi=m[*it].front();
						it2=it;
					}
				}
				l.erase(it2);
			}
			l.push_back(c);
		}
		else{
			for(it=l.begin();it!=l.end();it++)
				if(c.compare(*it)==0)break;
			if(it!=l.end()){
				hm[TOTAL_ACCESSES]=true;
				hits++;
			}
			else {
				maxi=0;
				for(it=l.begin();it!=l.end();it++){
					if(maxi<m[*it].front()){
						maxi=m[*it].front();
						it2=it;
					}
				}
				l.erase(it2);
				l.push_back(c);
			}
		}
		m[c].pop();
		TOTAL_ACCESSES++;
	}
	display(s.size());
}

int main(int argc, char const *argv[])
{
	
	string s=argv[3];
	string name=argv[2];
	int count=0;		//cache size
	int l=s.length();
	for(int i=0;i<l;i++){
		count*=10;
		count+=s[i]-'0';
	}
	int position=name.find_last_of(".");
	string n=name.substr(0,position);
	n="CS17BTECH11040_"+string(argv[1])+"_"+n+"_"+string(argv[3])+".out";
	fin.open(argv[2]);	//Opening the input file 
	fout.open(n.data());		//Creating a file according to the naming convention specified
	if(count>0){
		if(strcmp(argv[1],"LRU")==0){
			LRU(count);
		}
		if(strcmp(argv[1],"FIFO")==0){
			FIFO(count);
		}
		if(strcmp(argv[1],"OPTIMAL")==0){
			OPTIMAL(count,argv[2]);
		}
	}
	else CacheIsZero();
	fin.close();
	return 0;
}