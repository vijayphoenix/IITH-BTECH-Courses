#include <iostream>
using namespace std;

struct node{
    string name;
    string code;
    struct node* next;
}*temp7;

void print(struct node* head){
    if(head==NULL) 
	{
	  cout<<"List is empty\n";	
	  return;		
	}
	int i=1;
	do
	{
		cout<<"\nPosition: "<<i;
		cout<<"\nAddress: "<<head;
		cout<<"\nCourse Name: "<<head->name;
		cout<<"\nCourse Code: "<<head->code;
		cout<<"\n";
		head=head->next;
		i++;
	}while(head!=NULL);
}

struct node* Insert(node *head,string s, string r)
{
    node* temp=new node;
    temp->name=s;
    temp->code=r;
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

node* Delete(node *head, int position)
{
    node* temp=head,* temp1;
    if(position==0)head=head->next;
    else
    {
        for(int i=0;i<position-1;i++)
        {
          temp=temp->next;
        }
        temp1=temp;
        temp->next=(temp->next)->next;
        temp1=temp;
    }
    return head;
}
void change(struct node* head){
	temp7=head;
}

struct node* split(struct node* head,struct node* head2)
{
	node* temp=head;
	string s;
	int l=0,i=0;
	while(temp!=NULL)
	{
		s=temp->code;
		l=s.length();
		if((s[l-1]-'0')%2==0)
		{
			head2=Insert(head2,temp->name,temp->code);
			temp=temp->next;
			head=Delete(head,i);
		}
		else{
			temp=temp->next;
			i++;
		}
	}
	change(head);
	return head2;
}

int main(){
    struct node* head=NULL,*head2=NULL;
    cout<<"   ****Lab Assignment 3****  \n\n";
    cout<<"Please press enter after each Input\n\n";
    int n;
    string s1,s2;
    cout<<"Enter 1 to add a Course Code and Course Name\n";
    cout<<"Enter 2 to Split two course codes\n";
    cout<<"Enter 3 For displaying all elements of the first list\n";
    cout<<"Enter 4 For displaying all elements of the second list\n";
    cout<<"Enter 5 to EXIT\n";
        cin>>n;
    while(n!=1 && n!=2 && n!=3 && n!=4 && n!=5){
        cout<<"Enter a Valid input\n";
        cin>>n;
    }
    while(n!=5)
    {
        if(n==1){
        	cout<<"Enter Course Name\n";
            cin>>s1;
            cout<<"Enter Course Code\n";
            cin>>s2;
            head=Insert(head,s1,s2);
            cout<<"Added Succesfully!!!\n";
        }
        else if(n==2){
        	head2=split(head,head2);
        	head=temp7;
        	cout<<"LIST 1\n";
        	print(head);
        	cout<<"LIST 2\n";
        	print(head2);
        	return 0;
        }
        else if(n==3){
            print(head);
        }
        else if(n==4){
            print(head2);
        }
        cout<<"Enter 1 to add a Course Code and Course Name\n";
	    cout<<"Enter 2 to Split two course codes\n";
	    cout<<"Enter 3 For displaying all elements of the first list\n";
	    cout<<"Enter 4 For displaying all elements of the second list\n";
	    cout<<"Enter 5 to EXIT\n";
		cin>>n;
		while(n!=1&&n!=2&&n!=3&&n!=4&&n!=5)
		{
			cout<<"please enter correct number"<<endl;
			cin>>n;
		}
    }
    return 0;
}
