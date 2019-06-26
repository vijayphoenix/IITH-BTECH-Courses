#include<iostream>
using namespace std;

/*
This class is implementation of foward linked list.
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
	//Stores the parent of each node in a array.(Path can now be obtained by backtracking)
	void path(List *l,int size,int p[]){
		for (int o = 0; o < size; ++o)p[o]=0;
		List queue;
		bool color[size]={};
		queue.push_back(head->data);
		color[head->data]=true;
		p[head->data]=head->data;
		List<T>::iterator i=head;
		while(queue.length!=0){
			T x=queue.front();
			queue.pop_front();
			for (i=l[x].head; i!=nullptr; i++){
				if(color[*i]==false){
					queue.push_back(*i);
					p[*i]=x;
					color[*i]=true;
				}
			}
		}
	}
	//Outputs the BFS of the given node
	void BFS(List *l,int size){
		List queue;
		bool color[size]={};
		queue.push_back(head->data);
		color[head->data]=true;
		List<T>::iterator i=head;
		while(queue.length!=0){
			T x=queue.front();
			cout<<x<<" ";
			queue.pop_front();
			for (i=l[x].head; i!=nullptr; i++){
				if(color[*i]==false){
					queue.push_back(*i);
					color[*i]=true;
				}
			}
		}
	}
	//Overloaded assigment operator for list
	List & operator =(const List &a){
		DeleteList();
		List<T>::iterator i=a.head;
		for(;i!=nullptr;i++){
			push_back(*i);
		}
		return(*this);
	}
	//Iterator class for List
	class iterator{
		private:
		    node* itr;
		public :
			iterator (node* temp) : itr(temp) {} 	//constructor
		    iterator& operator++(){
		        itr = itr->next;
		        return *this;
		    }
		    iterator operator++(T){					//overloaded increment operator
		        iterator tmp(*this);
		        itr = itr->next;
		        return tmp;
		    }
		    bool operator== (const iterator& rhs){	//Overloaded equality operator
		        return itr == rhs.itr;
		    }
		    bool operator!= (const iterator& rhs){	//Overloaded inequality operator
		        return itr != rhs.itr;
		    }
		    T& operator*() const{					//Overloaded deference operator
		        return itr->data;
		    }
		    T& operator-> () const{					//Overloaded deference operator
		        return itr->data;
		    }
		};
};

int main(){
	char a,b;
	string s="";
	int temp,t,k,i=0,ii=-1,j,size=0;
	List<int>*l= new List<int>[1];
	int *p=new int[1];
	while(cin>>a){
		switch(a){
			case 'N':
				delete[] l;i=0;ii=-1;
				cin>>size;
				size++;
				l=new List<int>[size];
				break;
			case 'E':
				scanf("%d%c",&temp,&b);
				l[temp].push_back(temp);
				while(b!='\n'){
					scanf("%d%c",&t,&b);
					l[temp].push_back(t);
				}
				break;
			case '?':
				cin>>temp>>k;
				cout<<(l[temp].search(k)?1:0)<<"\n";
				break;
			case 'B':
				cin>>temp;
				l[temp].BFS(l,size);
				cout<<endl;
				break;
			case 'P':
				cin>>i>>j;
				s="";
				if (ii!=i){
					delete[] p;
					p=new int[size];
					l[i].path(l,size,p);
				}
				if (p[j]==0)cout<<"-1";
				else {
					while(p[j]!=j) {
						s=to_string(j)+" "+s;
						j=p[j];
					}
					s=to_string(i)+" "+s;
					cout<<s;
				}
				cout<<"\n";
				ii=i;
				break;
		}
	}
	delete[] l;
	delete[] p;
	return 0;		
}