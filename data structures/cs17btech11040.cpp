#include<iostream>
#include<string>

using namespace std;

struct node{	
	int data;
	node* prev, *next;
	node (int v,node* p,node* n){
		data=v;
		prev=p;next=n;
	}
};

class number{
	private:
		node* sentinel;
		int size;
/*
This function inserts each digit just after sentinel node. 
MSB is the first digit after the sentinel node i.e number is stored in the same order.
It is a doubly circular linked list.
.*/ 
	void insert(int x){
		node* temp=new node(x,sentinel,sentinel->next);
		sentinel->next->prev=temp;
		sentinel->next=temp;
		if(size==0){
			sentinel->prev=temp;
		}
		size++;
	}
//Removes the leading zeros
	void trim(){
		node* tep=sentinel->next;
		while(tep->data==0 && size>1){
				tep->prev->next=tep->next;
				tep->next->prev=tep->prev;
				Delete(tep);
				tep=sentinel->next;
				size-=1;
			}
	}

	void Delete(node* tep){
				tep->prev->next=tep->next;
				tep->next->prev=tep->prev;
				delete(tep);
	}
//Adding two numbers
	number add(const number *a,const number *b){
		node* tempa=a->sentinel->prev, *tempb=b->sentinel->prev;
		number c;
		int sum=0,carry=0;
		while(tempa->data!=-1 && tempb->data!=-1){
			sum=tempa->data+tempb->data+carry;
			carry=sum/10;
			sum%=10;
			c.insert(sum);
			tempa=tempa->prev;
			tempb=tempb->prev;
		}
		if(tempa->data==-1)
			while(tempb->data!=-1){
				c.insert(carry+tempb->data);
				tempb=tempb->prev;
				carry=0;
			}
		else
			while(tempa->data!=-1){
				c.insert(carry+tempa->data);
				tempa=tempa->prev;
				carry=0;
			}
		c.insert(carry);
		c.trim();
		return c;
	}
//constructor
	public:
	number(){
		sentinel=new node(-1,nullptr,nullptr);
		sentinel->prev=sentinel->next=sentinel;
		size=0;
	}
//Number inserted in the linked list after clearing the previous data
	void putnum(string s){
		DeleteEverything();
		for(int i=s.length()-1;i>=0;i--)
			insert(s[i]-'0');
	}
//prints the complete number
	void print(){
		node* tep=sentinel->next;
		while(tep!=sentinel){
			cout<<tep->data;
		    tep=tep->next;
		}
		cout<<"\n";
	}
//operator overloading
	number operator +(const number &a){
		return add(this,&a);
	}

	void DeleteEverything(){
		while(sentinel->next->data!=-1) {
		    Delete(sentinel->next);
		}
		size=0;
	}
//Destructor
	~number(){
		while(sentinel->next->data!=-1) {
		    Delete(sentinel->next);
		}
		delete(sentinel);
	}
};

int main(){
	string str1,str2;
	number a,b;
	while(cin>>str1>>str2){				// Taking numbers as a strings
		a.putnum(str1);
		b.putnum(str2);					
		(a+b).print();
	}
	return 0;
}