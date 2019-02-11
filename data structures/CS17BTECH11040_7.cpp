#include<iostream>

using namespace std;
// This stores the data, rank and pointer to the parent
struct node
{
	size_t data,rank;
	node* p;
	node(size_t d, size_t r){
		data=d;rank=r;
	}
};
// Returns the representative element of the set
size_t find_set(size_t x,node* arr[]){
	node* temp=arr[x];
	while(temp->p!=temp)temp=temp->p;		// Iterating to find the root element
	return temp->data;
}

// Returns the rank of the element
int Rank(size_t x, node* arr[],size_t size){
	if(x<size)return arr[x]->rank;
	return -1;
}
// Performs the union function on two sets
void Union(size_t x,size_t y, node* arr[],size_t size){
	if(x<size and y<size){
		size_t p1=find_set(x,arr),p2=find_set(y,arr);
		if(p1!=p2){
			if(arr[p1]->rank > arr[p2]->rank)arr[p2]->p=arr[p1];		// Rank 1 > Rank 2
			else if(arr[p1]->rank < arr[p2]->rank)arr[p1]->p=arr[p2];	// Rank 1 < Rank 2
			else{														// Rank 1 == Rank 2
				arr[p1]->rank++;
				arr[p2]->p=arr[p1];
			}
		}
	}
}

int main(){
	char c;
	size_t p,q,i=0,size=0;
	node** a=new node*[1];								//Array of pointers to the element
	node* temp;
	while(cin>>c){
		switch(c){

			case 'N':
				for (i = 1; i < size; ++i)delete a[i];	// Deletes the allocated memory of nodes
				delete[] a;								// Deletes the allocated memory to the array
				cin>>size;										
				size++;
				a=new node*[size];
				for (i = 1; i < size; ++i){
					temp=new node(i,1);
					temp->p=temp;
					a[temp->data]=temp;
				}
			break;

			case 'U':									//Performs Union
				cin>>p>>q;
				Union(p,q,a,size);
			break;

			case '?':											
				cin>>p>>q;
				if(p>=size || q>=size)cout<<"-1";
				else if(find_set(p,a)==find_set(q,a))cout<<"1";
				else cout<<"0";
				cout<<"\n";
			break;

			case 'S':
				cin>>p;
				if(p<size)cout<<find_set(p,a);
				else cout<<"-1";
				cout<<"\n";
			break;

			case 'R':
				cin>>p;
				cout<<Rank(p,a,size)<<"\n";
			break;
		}
	}
	for (i = 1; i < size; ++i)delete a[i];
	delete[] a;
	return 0;
}