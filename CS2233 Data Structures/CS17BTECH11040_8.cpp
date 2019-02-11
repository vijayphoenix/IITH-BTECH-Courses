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

//This is a class for storing numbers of any length.
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
//Deletes a digit
	void Delete(node* tep){
				tep->prev->next=tep->next;
				tep->next->prev=tep->prev;
				delete(tep);
	}
//Defining how to add two numbers. This function returns a+b
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
//Defining how to compare two numbers. This function returns 1 if a>=b, else 0
	bool compare(const number *a,const number *b){
		if(a->size>b->size)return true;
		else if(a->size<b->size)return false;
		else{
			node* tempa=a->sentinel->next,*tempb=b->sentinel->next;
			while(tempa->data==tempb->data && tempa->data!=-1){
				tempa=tempa->next;tempb=tempb->next;
			}
			if(tempa->data>=tempb->data)return true;
			else return false;
		}
	}
//Defining how to check equality of two numbers. This function returns 1 if a==b, else returns 0.
	bool equality(const number *a,const number *b){
		if(a->size==b->size){
			node* tempa=a->sentinel->next,*tempb=b->sentinel->next;
			while(tempa->data==tempb->data && tempa->data!=-1){
				tempa=tempa->next;tempb=tempb->next;
			}
			if(tempa->data==tempb->data)return true;
			else return false;
		}
		else return false;
	}
//Constructor of class number
	public:
	number(){
		sentinel=new node(-1,nullptr,nullptr);
		sentinel->prev=sentinel->next=sentinel;
		size=0;
	}
//Destructor of class number
	~number(){
		while(sentinel->next->data!=-1) {
		    Delete(sentinel->next);
		}
		delete(sentinel);
	}
//Number is inserted in the linked list after clearing the previous data
	void putnum(string s){
		DeleteEverything();
		for(int i=s.length()-1;i>=0;i--)
			insert(s[i]-'0');
		trim();
	}
//This function prints the complete number
	void print(){
		node* tep=sentinel->next;
		while(tep!=sentinel){
			cout<<tep->data;
		    tep=tep->next;
		}
		cout<<" ";
	}
//Overloading Plus operator i.e (number a + number b)
	number operator +(const number &a){
		return add(this,&a);
	}
//Overloading greater than operator i.e (number a >= number b)
	bool operator >=(const number &a){
		return compare(this,&a);
	}
//Overloading equality operator i.e (number a == number b)
	bool operator ==(const number &a){
		return equality(this,&a);
	}
//Overloading assignment operator('='). It stores the data of a string into a object of class number i.e (number b = string a)
	number & operator =(const string &a){
		DeleteEverything();
		putnum(a);
		return *this;
	}
// Overloaded assignment operator for two numbers objects
	number & operator =(const number &a){
		DeleteEverything();
		node* temp= a.sentinel->prev;
		while(temp->data!=-1){
			insert(temp->data);
			temp=temp->prev;
		}
		return(*this);
	}
// Overloaded assignment operator for int and number objects
	number & operator =(int a){
		DeleteEverything();
		insert(a);
		return *this;
	}
//Deletes all the nodes except the sentinal node
	void DeleteEverything(){
		while(sentinel->next->data!=-1){
		    Delete(sentinel->next);
		}
		size=0;
	}
};

/*This class is implementation of Binary Search tree.
Nodes of this tree can store arbitarily large numbers.
*/
class RBT{
	private:
	struct Node
	{
		number data;
		bool col;		// col=0 means black and col=1 means red
		Node* left, *right,*parent;
		Node(){
			//data=-1;
			left=right=parent=nullptr;
			col=0;
		}
		Node (const string &v,Node* l,Node *r,Node *p,bool c=1){
			data=v;
			left=l;right=r;parent=p;
			col=c;
		}
	}*root=nullptr,*nil=nullptr;

	void preorder(Node* t){
		if(t!=nil){
			t->data.print();
			preorder(t->left);
			preorder(t->right);
		}
	}
// Deletes the tree
	void Delete(Node* t){
		if(t!=nil){
			Delete(t->left);
			Delete(t->right);
			delete(t);
		}
		root=nil;
	}
// Finds the successor of the number object a.
	number* successor(Node* temp,number &a){
		number* tep=&a;
		if(temp->left==nil && temp->right==nil){
			if(!(a>=temp->data))return &temp->data;
			else return &a;
		}
		if( a >= temp->data && temp->right!=nil)
			tep=successor(temp->right,a);
		else if (!(a>=temp->data) && temp->left!=nil)
			tep=successor(temp->left,a);
		if(*tep==a){
			if(!(a>=temp->data))return &temp->data;
			else return &a; 
		}
		return tep;
	}
// The function returns the pointer to the node if the number object is found.
	Node* search(number &t){
		Node* temp=root;
		while(temp!=nil) {
			if(temp->data==t){
				return temp;
			}
			else if(temp->data>=t){
				temp=temp->left;
			}
			else{
				temp=temp->right;
			}
		}
		return nil;
	}
	// Left rotates at the given node 
	void LeftRotate(Node* temp){
		if (temp==nil || temp->right==nil)return;
		Node* oldparent=temp->parent;
		temp->right->parent=temp->parent;
		temp->parent=temp->right;
		temp->right=temp->right->left;
		temp->parent->left=temp;
		if(temp->right!=nil)
			temp->right->parent=temp;
		if (oldparent!=nullptr){
			if(oldparent->left==temp)oldparent->left=temp->parent;
			else if(oldparent->right==temp)oldparent->right=temp->parent;
		}
		else root=temp->parent;
	}
// Right Rotates at the given node
	void RightRotate(Node* temp){
		if (temp==nil || temp->left==nil)return;
		Node* oldparent=temp->parent;
		temp->left->parent=temp->parent;
		temp->parent=temp->left;
		temp->left=temp->left->right;
		temp->parent->right=temp;
		if(temp->left!=nil)temp->left->parent=temp;
		if (oldparent!=nullptr){
			if(oldparent->left==temp)oldparent->left=temp->parent;
			else if(oldparent->right==temp)	oldparent->right=temp->parent;
		}
		else root=temp->parent;
	}

public:
//Constructor
	RBT(){
		nil =new Node();
		root=nil;
	}
//Destructor
	~RBT(){
		DeleteRBT();
		delete nil;
	}
//This function inserts different elements into the RBT from a given sequence.
	void insert(string &s){
		number temp;
		temp=s;
		if(root==nil){
			root=new Node(s,nil,nil,nullptr,0);
		}
		else{
			Node* t=root,*t1;
			while(t!=nil){
				t1=t;
				if(t->data==temp)return;
				if(t->data>=temp)t=t->left;
				else t=t->right;
			}
				Node *tep=new Node(s,nil,nil,t1);
				if(t1->data>=temp)t1->left=tep;
				else t1->right=tep;
				FixInsert(tep);
		}

	}
	// Corrects the position of node
	void FixInsert(Node * temp){
		while(temp->parent!=nullptr and temp->parent->col) {
			    Node* Uncle= uncle(temp);
			    if (Uncle->col){
			    	temp->parent->col=Uncle->col=0;
			    	temp=Uncle->parent;
			    	temp->col=1;
			    	continue;
			    }
			    Node* p=temp->parent;
			    Node* grandpa=p->parent;
			    if(ChildPosition(p)==0){
			    	if(ChildPosition(temp)==0){
			    		p->col=!p->col;
			    		grandpa->col=!grandpa->col;
			    		RightRotate(grandpa);
			    	}
			    	else{
			    		temp=p;
			    		LeftRotate(temp);
			    	}
			    }
			    else{
			    	if(ChildPosition(temp)==1){
			    		p->col=!p->col;
			    		grandpa->col=!grandpa->col;
			    		LeftRotate(grandpa);
			    	}
			    	else{
			    		temp=p;
			    		RightRotate(temp);
			    	}
			    }
			}
		root->col=0;
	}
// Returns 1 if right child else returns 0 if left child
	bool ChildPosition(Node * t){
		if(t->parent->left==t)return 0;
		return 1;
	}
//Prints the preorder traversal of RBT 
	void preorder(){
		preorder(root);
	}
//This function searches for a given key. Path to the key is printed if the key is found.
	void search(string &s){
		Node* temp=root;
		number t;
		string r="";
		t=s;
		while(temp!=nil) {
			if(temp->data==t){
				cout<<r<<" ";
				if(temp->col==0)cout<<"B";
					else cout<<"R";
				cout<<"\n";
				return;
			}
			else if(temp->data>=t){
				temp=temp->left;
				r.push_back('0');
			}
			else{
				temp=temp->right;
				r.push_back('1');
			}
		}
		cout<<"-1\n";
	}
	
//This function deletes the complete RBT.
	void DeleteRBT(){
		Delete(root);
		root=nil;
	}
// Finds the minimum number greater than the specified number.
	void successor(string &s){
		number t;
		number* tep;
		t=s;
		tep=successor(root,t);
		if(t==*tep)cout<<"-1";
		else tep->print();
		cout<<"\n";
	}

//This function deletes the number specified by searching in the given tree.
	void RemoveNode(string &s){
		number t;
		t=s;
		Node* temp=search(t);
		RemoveNode(temp);
	}
// Deletes the node from RB tree
	void RemoveNode(Node* temp){
		if(temp==nil || temp==nullptr)return;
		if(temp->left!=nil and temp->right!=nil){
			Node* tmp=temp->left;
			while(tmp->right!=nil)tmp=tmp->right;
			temp->data=tmp->data;
			RemoveNode(tmp);return;
		}
		Node* child=(temp->left==nil)?temp->right:temp->left;
		if(temp->col==1 || child->col==1){
			splice(temp,child);
			child->col=0;
			return;
		}
		Node * p=temp->parent;
		splice(temp,child);
		child->parent=p;
		FixToken(child);
	}
/*
CASE
1. S is red.
2. S is black and has both children colored black.
3. S is black and has left child red and right child black.
4. S is black and has right child red.
*/

	void FixToken(Node* child){
		Node* p=child->parent;
		Node* bro=sibling(child);
		if(bro==nullptr){
			root->col=0;
			return;
		}
		if(child->col==1){					// M IS RED
			child->col=0;
			return;
		}
		if(bro->col==1){						// CASE 1
			bro->col=0;p->col=1;
			if(ChildPosition(child)==0)LeftRotate(p);
			else RightRotate(p);
			bro=sibling(child);
		}
		if(bro->col==0 and bro->right->col==0 and bro->left->col==0){	//CASE 2
			bro->col=1;
			FixToken(p);
			return;
		}
		if(ChildPosition(bro)==1){
			if(bro->left->col==1 and bro->right->col==0){		//CASE 3
				swap(bro->col,bro->left->col);
				RightRotate(bro);
				child->parent=p;
				FixToken(child);
			}
			else{												// CASE 4
				bro->right->col=0;
				bro->col=p->col;
				p->col=0;
				LeftRotate(p);
				FixToken(root);
			}

		}else{
			if(bro->left->col==0 and bro->right->col==1){			//CASE 3
				swap(bro->col,bro->right->col);
				LeftRotate(bro);
				child->parent=p;
				FixToken(child);
			}
			else{													//CASE 4
				bro->left->col=0;
				bro->col=p->col;
				p->col=0;
				RightRotate(p);
				FixToken(root);
			}
		}
	}
// Parent is replaced by the child 
	void splice(Node* temp,Node* child){
		child->parent=temp->parent;
		if(temp!=root){
			if(temp->parent->left==temp)temp->parent->left=child;
			else temp->parent->right=child;
		}
		delete(temp);
	}
// Prints the children of the given node
	void child(string &s){
		number t;
		t=s;
		Node* temp=search(t);
		if (temp==nil)cout<<"-1";
		else{
			if(temp->left==nil)cout<<"L B ";
				else {
					temp->left->data.print();
					if(temp->left->col==0)cout<<"B ";
					else cout<<"R ";
				}
			if(temp->right==nil)cout<<"L B ";
				else {
					temp->right->data.print();
					if(temp->right->col==0)cout<<"B ";
					else cout<<"R ";
				}
		}
		cout<<"\n";
	}
// Prints the uncle of the given node
	Node* uncle(Node* temp){
		if (temp==nil || temp->parent==nullptr || temp->parent->parent==nullptr)return nullptr;
		Node* dada=temp->parent->parent;
		if (!(temp->parent==dada->left))return dada->left;
		return dada->right;
	}
// Finds sibling of the Node
	Node* sibling(Node* temp){
		if(temp->parent==nullptr)return nullptr;
		if(temp->parent->left==temp)return temp->parent->right;
		return temp->parent->left;
	}
};

int main(){
	int i,l;
	string s,r;
	number a;
	RBT b;
	while(getline(cin,s)){
		l=s.length();
		r="";
		switch(s[0]){

			case 'N':
				b.DeleteRBT();
				i=1;
				while(i!=l){
					r="";
					while(s[++i]!=' '&&i<l)r.push_back(s[i]);
				b.insert(r);
				}
			break;

			case 'P':
				b.preorder();
				cout<<"\n";
			break;

			case 'S':
				i=2;
				while(i!=l)r.push_back(s[i++]);
				b.search(r);
			break;

			case '+':
				i=2;
				while(i!=l)r.push_back(s[i++]);
				b.insert(r);
			break;

			case '>':
				i=2;
				while(i!=l)r.push_back(s[i++]);
				b.successor(r);
			break;

			case '-':
				i=2;
				while(i!=l)r.push_back(s[i++]);
				b.RemoveNode(r);
			break;

			case 'C':
				i=2;
				while(i!=l)r.push_back(s[i++]);
				b.child(r);
			break;
		}
	}
	return 0;
}