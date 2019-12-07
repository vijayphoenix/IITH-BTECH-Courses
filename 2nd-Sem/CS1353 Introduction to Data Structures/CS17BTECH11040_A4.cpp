#include <iostream>
using namespace std;

struct node{
    int data;
    struct node* next;
};

void print(struct node* head){
    if(head==NULL) 
	{
	  cout<<"List is empty\n";	
	  return;		
	}
	int i=1;
	do
	{
		cout<<"\nPosition   : "<<i;
		cout<<"\nAddress    : "<<head;
		cout<<"\nData       : "<<head->data;
		cout<<"\n";
		head=head->next;
		i++;
	}while(head!=NULL);
}

struct node* Insert(node * head,int a)
{
    node* temp=new node;
    temp->data=a;
    temp->next=NULL;
    if(head==NULL)
    {
        head=temp;
        return head;
    }
    struct node* temp1=head;
    while(temp1->next!=NULL)
    {
        temp1=temp1->next;
    }
    temp1->next=temp;
    return head;
}

node* Union(node* head,node* head2,node* head3){
    while(head!=NULL&&head2!=NULL){
        if(head->data>head2->data){
            head3=Insert(head3,head->data);
            head=head->next;
        }
        else if(head->data<head2->data){
            head3=Insert(head3,head2->data);
            head2=head2->next;
        }
         else {
            head3=Insert(head3,head2->data);
            head2=head2->next;
            head=head->next;
         }
    }
         while(head!=NULL){
             head3=Insert(head3,head->data);
            head=head->next;
         }
         while(head2!=NULL){
             head3=Insert(head3,head2->data);
            head2=head2->next;
         }
    return head3;
}

void Free(node* &head){
    node* temp=head;
    while(head!=NULL){
        temp=head;
        head=head->next;
        free(temp);
    }
}

int main(){
    struct node* head=NULL,*head2=NULL,*head3=NULL;
    cout<<"   ****Lab Assignment 4****  \n\n";
    int n,a;
    cout<<"Enter 1 to add a Element to LIST1\n";
    cout<<"Enter 2 to add a Element to LIST2\n";
    cout<<"Enter 3 For displaying all elements of the first list\n";
    cout<<"Enter 4 For displaying all elements of the second list\n";
    cout<<"Enter 5 for taking union of both the lists and displaying List3\n";
    cout<<"Enter 6 to EXIT\n";
    cin>>n;
    while(n!=1 && n!=2 && n!=3 && n!=4 && n!=5 && n!=6){
        cout<<"Enter a Valid input\n";
        cin>>n;
    }
    while(n!=6)
    {
        if(n==1){
        	cout<<"Enter number\n";
            cin>>a;
            head=Insert(head,a);
            cout<<"Added Succesfully!!!\n";
        }
        else if(n==2){
        	cout<<"Enter number\n";
            cin>>a;
            head2=Insert(head2,a);
            cout<<"Added Succesfully!!!\n";
        }
        else if(n==3){
            print(head);
        }
        else if(n==4){
            print(head2);
        }
        else if(n==5){
            head3=Union(head,head2,head3);
            cout<<"\nDisplaying all elements of List3\n";
            print(head3);
            cout<<"\nClearing all data\n";
            Free(head);Free(head2);Free(head3);
            print(head);print(head2);print(head3);
            return 0;
        }
        cout<<"Enter 1 to add a Element to LIST1\n";
        cout<<"Enter 2 to add a Element to LIST2\n";
        cout<<"Enter 3 For displaying all elements of the first list\n";
        cout<<"Enter 4 For displaying all elements of the second list\n";
        cout<<"Enter 5 for taking union of both the lists and displaying List3\n";
        cout<<"Enter 6 to EXIT\n";
		cin>>n;
		while(n!=1&&n!=2&&n!=3&&n!=4&&n!=5&&n!=6)
		{
			cout<<"please enter correct number"<<endl;
			cin>>n;
		}
    }
    return 0;
}
