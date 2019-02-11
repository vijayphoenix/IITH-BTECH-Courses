/*This program is implementation of Binary Search tree.
Nodes of this tree can store arbitarily large numbers.
*/
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
class BST{
	private:
	struct Node
	{
		number data;
		Node* left, *right,*parent;
		Node (const string &v,Node* l,Node *r,Node *p){
			data=v;
			left=l;right=r;parent=p;
		}
	}*root=nullptr;
// Prints preorder traversal
	void preorder(Node* t){
		if(t!=nullptr){
			t->data.print();
			preorder(t->left);
			preorder(t->right);
		}
	}
// Deletes the tree
	void Delete(Node* t){
		if(t!=nullptr){
			Delete(t->left);
			Delete(t->right);
			delete(t);
		}
		root=nullptr;
	}
// Finds the successor of the number object a.
	number* successor(Node* temp,number &a){
		number* tep;
		if(temp->left==nullptr && temp->right==nullptr){
			if(!(a>=temp->data))return &temp->data;
			else return &a;
		}
		if( a >= temp->data && temp->right!=nullptr)
			tep=successor(temp->right,a);
		else if (!(a>=temp->data) && temp->left!=nullptr)
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
		while(temp!=nullptr) {
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
		return nullptr;
	}
// Removes the specified node
	Node* RemoveNode(Node* temp, number &a){
		if(temp==nullptr)return temp;
		if(!(temp->data>=a)){
			temp->right=RemoveNode(temp->right, a);
		}
		else if(!(a>=temp->data)){
			temp->left=RemoveNode(temp->left,a);
		}
		else{
			if(temp->left==nullptr && temp->right==nullptr){
				delete(temp);
				return nullptr;
			}
			if(temp->left==nullptr){
				Node *t = temp->right;
				temp->right->parent=temp->parent;
            delete temp;
            return t;
			}
			else if(temp->right==nullptr){
				Node *t = temp->left;
				temp->left->parent=temp->parent;
            delete temp;
            return t;
			}
			else{				
				Node* t = temp->right;
				while(t->left!=nullptr)t= t->left;
				temp->data = t->data;
				temp->right=RemoveNode(temp->right, t->data);
			}
		}
		return temp;
	}

public:
//Constructor
	BST(){}
//Destructor
	~BST(){
		DeleteBST();
		delete root;
	}
//This function inserts different elements into the BST from a given sequence.
	void insert(string &s){
		number temp;
		temp=s;
		if(root==nullptr){
			root=new Node(s,nullptr,nullptr,nullptr);
		}
		else{
			Node* t=root,*t1;
			while(t!=nullptr){
				t1=t;
				if(t->data==temp)return;
				if(t->data>=temp)t=t->left;
				else t=t->right;
			}
				Node *tep=new Node(s,nullptr,nullptr,t1);
				if(t1->data>=temp)t1->left=tep;
				else t1->right=tep;
		}
	}
//Prints the preorder traversal of BST 
	void preorder(){
		preorder(root);
	}
//This function searches for a given key. Path to the key is printed if the key is found.
	void search(string &s){
		Node* temp=root;
		number t;
		string r="";
		t=s;
		while(temp!=nullptr) {
			if(temp->data==t){
				cout<<r<<"\n";
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
	
//This function deletes the complete BST.
	void DeleteBST(){
		Delete(root);
	}
// Finds the minimum number greater than the specified number.
	void successor(string &s){
		number t;
		number* tep;
		t=s;
		tep=successor(root,t);
		if(t==*tep){
			cout<<"-1";
		}
		else
			tep->print();
		cout<<"\n";
	}

//This function deletes the number specified by searching in the given tree.
	void RemoveNode(string &s){
		number t;
		t=s;
		root=RemoveNode(root,t);
	}
// Prints the children of the given node
	void child(string &s){
		number t;
		t=s;
		Node* temp=search(t);
		if (temp==nullptr)cout<<"-1";
		else{
			if(temp->left==nullptr)cout<<"Nil ";
				else temp->left->data.print();
			if(temp->right==nullptr)cout<<"Nil ";
				else temp->right->data.print();
		}
		cout<<"\n";
	}
// Prints the uncle of the given node
	void uncle(string &s){
		number t;
		t=s;
		Node* temp=search(t);
		if (temp==nullptr)cout<<"-1";
		else{
			if(temp->parent==nullptr)cout<<"-1";
			else if(temp->parent->parent==nullptr)cout<<"-1";
			else{
				Node* dada=temp->parent->parent;
				Node* tep=temp->parent;
				if (dada->left!=nullptr and !(tep->data==dada->left->data))	dada->left->data.print();
				else if(dada->right!=nullptr and !(tep->data==dada->right->data)) dada->right->data.print();
				else cout<<"-1";
			}
		}
		cout<<"\n";
	}
// Left rotates at the given node 
	void LeftRotate(string &s){
		number t;
		t=s;
		Node* temp= search(t);
		if (temp==nullptr || temp->right==nullptr)return;
		Node* oldparent=temp->parent;
		temp->right->parent=temp->parent;
		temp->parent=temp->right;
		temp->right=temp->right->left;
		temp->parent->left=temp;
		if(temp->right!=nullptr)
			temp->right->parent=temp;
		if (oldparent!=nullptr){
			if(oldparent->left!=nullptr and oldparent->left->data==temp->data)
				oldparent->left=temp->parent;
			else if(oldparent->right!=nullptr and oldparent->right->data==temp->data)
				oldparent->right=temp->parent;
		}
		else root=temp->parent;
	}
// Right Rotates at the given node
	void RightRotate(string &s){
		number t;
		t=s;
		Node* temp= search(t);
		if (temp==nullptr || temp->left==nullptr)return;
		Node* oldparent=temp->parent;
		temp->left->parent=temp->parent;
		temp->parent=temp->left;
		temp->left=temp->left->right;
		temp->parent->right=temp;
		if(temp->left!=nullptr)
			temp->left->parent=temp;
		if (oldparent!=nullptr){
			if(oldparent->left!=nullptr and oldparent->left->data==temp->data)
				oldparent->left=temp->parent;
			else if(oldparent->right!=nullptr and oldparent->right->data==temp->data)
				oldparent->right=temp->parent;
		}
		else root=temp->parent;
	}
};

int main(){
	int i,l;
	string s,r;
	number a;
	BST b;
	while(getline(cin,s)){
		l=s.length();
		r="";
		switch(s[0]){
			case 'N':
				b.DeleteBST();
				i=1;
				while(i!=l){
					r="";
					while(s[++i]!=' '&&i<l)r.push_back(s[i]);
				b.insert(r);
				}
				break;
			case 'B':
				b.DeleteBST();
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
			case 'U':
				i=2;
				while(i!=l)r.push_back(s[i++]);
				b.uncle(r);
			break;
			case 'L':
				i=2;
				while(i!=l)r.push_back(s[i++]);
				b.LeftRotate(r);
			break;
			case 'R':
				i=2;
				while(i!=l)r.push_back(s[i++]);
				b.RightRotate(r);
			break;
		}
	}
	return 0;
}