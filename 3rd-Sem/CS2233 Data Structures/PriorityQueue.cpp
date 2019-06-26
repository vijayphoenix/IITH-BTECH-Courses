#include<iostream>
using namespace std;

struct Node{
	int v,d;
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
	bool operator==(const int a){
		return(v==a);
	}
	bool operator >(const int a){
		return(d>a);
	}
	bool operator <(const int a){
		return(d<a);
	}
};


ostream & operator<<(ostream &output, const Node& gg){
		output<<gg.v<<" "<<gg.d;
		return output;
}
istream & operator>>(istream &input,Node& gg){
	input>>gg.v>>gg.d;
	return input;
}

template<class T>
class Heap
{
protected:
	long long int last,capacity;
	T* heap;
public:
	Heap(long long int cap=10000000):last(0),capacity(cap){
		heap=new T[cap];
	}
	~Heap(){
		delete[] heap;
	}

	virtual void Swap(T &i,T &j){
		swap(i,j);
	}

	void correct(int i){
		while(i>1){
			if(heap[i]<heap[i/2]){
					Swap(heap[i],heap[i/2]);
					i/=2;
				}
			else break;
		}
	}
	void push(T data){
		heap[++last]=data;
		correct(last);
	}

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

	T pop(){
		if(last>0){
			Swap(heap[1],heap[last]);
				last--;
				heapify(1);
				return heap[last+1];
		}
		return {-1,-1};
	}

	T top(){
		return heap[1];
	}

	bool empty(){
		if(last)return false;
		return true;
	}

	void print(){
		for (int i = 1; i <=last; ++i)cout<<"Node at i"<<"="<<i<<" ("<<heap[i]<<") ";
			cout<<endl;
	}
};

class priority_queue: public Heap<Node>
{
private:
	int *pos;
public:
	priority_queue(int capac=10000000):Heap<Node>(capac){
		pos=new int[capac]{};
	}
	~priority_queue(){
		delete[] pos;
	}

	void Swap(Node &i,Node &j){
		swap(pos[i.v],pos[j.v]);
		swap(i,j);
	}

	void push(Node data){
		if(pos[data.v]==0){
			heap[++last]=data;
			pos[data.v]=last;
			correct(last);
		}
		else decrease_key(data);
	}

	void decrease_key(Node i){
		heap[pos[i.v]].d=i.d;
		correct(pos[i.v]);
	}

	Node pop(){
		if(last>0){
			Swap(heap[1],heap[last]);
				pos[heap[last--].v]=0;
				heapify(1);
				return heap[last+1];
		}
		return {-1,-1};
	}

	void display(){
		for (int i = 1; i <=10; i++)cout<<"Vertex at i"<<"="<<i<<" ("<<pos[i]<<") ";
			cout<<"\n\n";
	}
};

int main(){
	priority_queue p(1000);
	p.push({1,10});
	p.print();
	p.display();
	p.push({2,8});
	p.print();
	p.display();
	p.push({3,9});
	p.print();
	p.display();
	p.push({4,7});
	p.print();
	p.display();
	cout<<"vhvhv\n";
	p.push({5,4});
	p.print();
	p.display();
	p.push({1,1});
	p.print();
	p.display();
	p.pop();
	p.print();
	p.display();
	// p.push({7,3});
	// p.print();
	// p.display();
	// p.push({1,1});
	// p.print();
	// p.display();
	// p.push({10,10});
	// p.push({10,3});
	// p.push({10,4});
	// p.push({10,1000});
	// p.push({10,83});
	// p.push({10,1});
	// p.print();
	Node a=p.top();
	cout<<a<<endl;
	p.pop();
	p.print();
	p.display();
	cout<<p.empty();

	//p.print();
	// cout<<p.empty();

 	//p.pop();
	//p.print();
	// cout<<p.empty();

	//p.pop();
	// cout<<p.empty()<<endl;
	// p.print();
	// p.pop();
	// cout<<"sdf";
	// cout<<p.empty()<<endl;



	return 0;
}