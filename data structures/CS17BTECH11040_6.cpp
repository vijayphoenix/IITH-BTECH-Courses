#include<iostream>
#include <cstring>
#define lli long long int
using namespace std;

/*
This is template class implementation of foward linked list.
Functions like add node at front and back, pop_front are supported
*/ 
template<class T>
class List{
private:
	struct node
	{
		T data;
		node *next;
		node (T d,node *n){
			data=d;
			next=n;;
		}
	}*head=nullptr,*tail=nullptr;
	size_t length=0;
//Deletes the object of class list
	void Delete(){
		node* temp=head;
		while(head){
		    head=head->next;
		    delete temp;
		    temp=head;
		}
		length=0;
	}

public:
	//Constructor
	List(){}
	//Destuctor
	~List(){
		Delete();
	}
	//Adds the specified element at the head of the list
	void push_front(T x){
		length++;
		node* temp=new node(x, head);
		if(head==nullptr) tail=temp;
		head=temp;
	}
	//Adds the specified element at the tail of the list
	void push_back(T x){
		length++;
		node* temp=new node(x, nullptr);
		if(tail==nullptr){
			tail=head=temp;
			return;
		}
		tail->next=temp;
		tail=temp;
	}
	//Removes the element at the head of the list
	void pop_front(){
		if (head==nullptr)return;
		length--;
		node* temp=head;
		if (length!=0)head=head->next;
		delete(temp);
		if(length==0)head=tail=nullptr;
	}
	//Returns the data of the head of the list
	T& front(){
		return head->data;
	}
	//Returns the data at the tail of the list
	T& back(){
		return tail->data;
	}
	//Returns the length of the list
	size_t size(){
		return length;
	}
	//Prints the list
	void print(){
		node* temp=head;
		while(temp!=nullptr){
			cout<<temp->data<<" ";
			temp=temp->next;
		}
	}
	//Function for deleting the list
	void DeleteList(){
			Delete();
	}
	//Searches for the specified element int the list
	bool search(T x){
		node* temp=head;
		while(temp!=nullptr){
			if (temp->data==x)return true;
			temp=temp->next;
		}
		return false;
	}
	//Overloaded assigment operator for list
	List & operator =(const List &a){
		DeleteList();
		List<T>::Iterator i=a.head;
		for(;i!=nullptr;i++){
			push_back(*i);
		}
		return(*this);
	}
	//Iterator class for List
	class Iterator{
		private:
		    node* itr;
		public :
			Iterator(): itr(nullptr){}
			Iterator (node* temp) : itr(temp) {} 	//constructor
		    Iterator& operator++(){
		        itr = itr->next;
		        return *this;
		    }
		    Iterator operator++(int){				//overloaded increment operator
		        Iterator tmp(*this);
		        itr = itr->next;
		        return tmp;
		    }
		    bool operator== (const Iterator& rhs){	//Overloaded equality operator
		        return itr == rhs.itr;
		    }
		    bool operator!= (const Iterator& rhs){	//Overloaded inequality operator
		        return itr != rhs.itr;
		    }
		    T& operator*() const{					//Overloaded deference operator
		        return itr->data;
		    }
		    T& operator-> () const{					//Overloaded deference operator
		        return itr->data;
		    }
		};

	Iterator begin(){
		return head;
	}
};
// This struct stores the vertex and the distance of the vertex from the source.
// Neccessary operator overloading is done.
struct Node{
	lli v,d;
	Node & operator=(const Node &a){
		v=a.v;d=a.d;
		return *this;
	}
	bool operator==(const Node &a){
		return (v==a.v);
	}
	bool operator<(const Node &a){
	return (d<a.d);
	}
	bool operator>(const Node &a){
	return (d>a.d);
	}
	bool operator==(const lli a){
		return(v==a);
	}
	bool operator >(const lli a){
		return(d>a);
	}
	bool operator <(const lli a){
		return(d<a);
	}
};
// Overloading << operator for Struct Node
ostream & operator<<(ostream &output, const Node& gg){
		output<<gg.v<<" "<<gg.d;
		return output;
}
// Overloading >> operator for Struct Node
istream & operator>>(istream &input,Node& gg){
	input>>gg.v>>gg.d;
	return input;
}
// This is template class of Heap.
template<class T>
class Heap
{
protected:
	long long int last,capacity;
	T* heap;
public:
	//This Constructor can build heap of specified size.
	Heap(long long int cap=10000000):last(0),capacity(cap){
		heap=new T[cap];
	}
	~Heap(){
		delete[] heap;
	}
	// Swap function
	virtual void Swap(T &i,T &j){
		swap(i,j);
	}
	// Corrects the position of the element present at the i th position
	void correct(int i){
		while(i>1){
			if(heap[i]<heap[i/2]){
					Swap(heap[i],heap[i/2]);
					i/=2;
				}
			else break;
		}
	}
	// Inserts a element in the heap
	void push(T data){
		heap[++last]=data;
		correct(last);
	}
	// Corrects the position of the element present at the i th position
	void heapify(int i){
		while(i<=last/2){
			int temp=(2*i==last||heap[2*i]<heap[2*i+1])?2*i:2*i+1;
			if(heap[temp]<heap[i]) {
				Swap(heap[i],heap[temp]);
				i=temp;
			}
			else break;
		}
	}
	// Removes and returns the element at the first position
	T pop(){
		if(last>0){
			Swap(heap[1],heap[last]);
				last--;
				heapify(1);
				return heap[last+1];
		}
		return {-1,-1};
	}
	// Returns the element at the first position
	T top(){
		return heap[1];
	}
	// Returns true if heap is empty
	bool empty(){
		if(last)return false;
		return true;
	}
	// Prints the all the elements of the heap
	void print(){
		for (int i = 1; i <=last; ++i)cout<<heap[i]<<" ";
	}
};
// This is a derived class of the parent Heap class.
// This class is a implementation of min priority queue with functions like decrease-key.
// All functions here perform the same use with slight modification
class priority_queue: public Heap<Node>
{
private:
	int *pos;				
public:
	priority_queue(int capac=10000000):Heap<Node>(capac){
		pos=new int[capac]{};		// This maintains the position of all the vertices in the priority queue
	}
	~priority_queue(){
		delete[] pos;
	}
	// Modified Swap function
	void Swap(Node &i,Node &j){
		swap(pos[i.v],pos[j.v]);
		swap(i,j);
	}
	// Inserts a element in the heap
	void push(Node data){
		if(pos[data.v]==0){
			heap[++last]=data;
			pos[data.v]=last;
			correct(last);
		}
		else if(heap[pos[data.v]].d>data.d){
			decrease_key(data);
		}
	}
	// Removes and returns the element at the first position
	Node pop(){
		if(last>0){
			Swap(heap[1],heap[last]);
				pos[heap[last--].v]=0;
				heapify(1);
				return heap[last+1];
		}
		return {-1,-1};
	}
	// Decreases the key(priority) of the element at the ith position of the heap
	void decrease_key(Node i){
		heap[pos[i.v]].d=i.d;
		correct(pos[i.v]);
	}
};
// Performs Dijkstra's algorithm from the given source
void Dijkstra(List<Node>*l,int size,int temp){
	bool visited[size]={};				// This array maintains if this node was visited or not
	lli dist[size]={};					// This array maintains the shortest distance from the source
	memset(dist,-1,sizeof(dist));
	priority_queue p(size);				// Creating a priority queue of size = (No. of vertices)
	dist[temp]=0;
	p.push({temp,0});					// Inserting the source node
	Node t;
	List<Node>::Iterator it; 
	while(!p.empty()){					// Performing this algorithm till the Priority queue becomes empty
		t=p.pop();
		if(!visited[t.v]){				// Only pushing the neighbours of the vertices which are not visited till now
			visited[t.v]=true;
			dist[t.v]=t.d;
			cout<<t.v<<" "<<t.d<<"\n";
			for(it=l[t.v].begin();it!=nullptr;it++){
				p.push({(*it).v,(*it).d+t.d});			
			}
		}
	}
	// Printing the non visited nodes
	for (int i = 1; i < size; ++i)
		if(!visited[i]){
			visited[i]=true;
			cout<<i<<" "<<"-1\n";
		}
}
// Modifies the the min dstance array and the parent array.
void path(List<Node>*l,int size,int temp,int a[],lli dist[]){
	bool visited[size]={};				// This array maintains if this node was visited or not
	priority_queue p(size+5);			// Creating a priority queue of size = (No. of vertices)
	dist[temp]=0;						// This array maintains the shortest distance from the source
	p.push({temp,0});					// Inserting the source node
	a[temp]=temp;						// This array maintains the value of the parent node(used for backtracking)
	Node t;
	List<Node>::Iterator it; 
	while(!p.empty()){					// Performing this algorithm till the Priority queue becomes empty
		t=p.pop();
		if(!visited[t.v]){
			visited[t.v]=true;
			dist[t.v]=t.d;
			for(it=l[t.v].begin();it!=nullptr;it++){
				if(dist[(*it).v]==-1 || (*it).d+t.d < dist[(*it).v]){
					dist[(*it).v]=(*it).d+t.d;			//Updating the dist of the node from the source
					p.push({(*it).v,(*it).d+t.d});
					a[(*it).v]=t.v;						//Updating the parent of the node
				}
			}
		}
	}
}

int main(){
	char a,b; string s;
	lli size=1,i,j,k=-1,t=-1,temp,V,dist;
	List<Node>*l=new List<Node>[1];
	List<Node>::Iterator it;
	int *arr=new int[1];
	lli *dis=new lli[1];
	while(cin>>a){
		switch(a){
			case 'N':
				delete[] l;k=-1;t=-1;
				cin>>size;size++;
				l=new List<Node>[size];
				break;
			case 'E':
				scanf("%lli%c",&temp,&b);
				l[temp].push_back(Node{temp,0});
				while(b!='\n'){
					scanf("%lli%lli%c",&V,&dist,&b);
					l[temp].push_back(Node{V,dist});
				}
				break;
			case '?':
				cin>>i>>j;
				if(i==j)cout<<"-1\n";
				else{
					for(it=l[i].begin();it!=nullptr;it++){
						if(*it==j){
							cout<<(*it).d<<"\n";
							break;
						}
					}
					if (it==nullptr)cout<<"-1\n";
				}
				break;
			case 'D':
				cin>>i;
				Dijkstra(l,size,i);
				break;
			case 'P':
				cin>>k>>j;
				s="";
				if(k!=t){
					delete[] arr;
					delete[] dis;
					arr=new int[size]{};
					dis=new lli[size];
					for(i=0;i<size;i++)dis[i]=-1;
					path(l,size,k,arr,dis);
				}
				if(dis[j]==-1)cout<<"-1\n";
				else{
					cout<<dis[j]<<" ";
					while(arr[j]!=j) {
						s=to_string(j)+" "+s;
						j=arr[j];
					}
					s=to_string(j)+" "+s;
					cout<<s<<"\n";
				}
				t=k;
				break;
		}
	}
	delete[] l;
	delete[] arr;
	delete[] dis;
	return 0;		
}