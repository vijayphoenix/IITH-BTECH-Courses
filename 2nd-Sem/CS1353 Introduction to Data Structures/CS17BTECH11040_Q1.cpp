#include <stdio.h>

int top=0;
int size;
int stack[100]={0};

int isEmpty()
{
  return top==0?1:0;
}

int isFull()
{
  return top==size?1:0;
}

void display()
{
  int i=0;
  if(isEmpty()==0){
    printf("Elements - ");
    for(i=0;i<top;++i){
      printf("%d , ",stack[i]);
    }
    printf("\n");
  }
  else printf("Stack is Empty\n");
  return;
}

void push(){
  if(isFull()==0){
    int n;
    printf("Enter a number to push\n");
    scanf("%d",&n);
    stack[top]=n;
    ++top;
    printf("Pushed\n");
  }
  else printf("Stack is Full\n");
}

void pop(){
  if(isEmpty()==0){
    --top;
    printf("Popped\n\n");
  }
  else printf("Stack is Empty\n");
}

int peek(){
  if(isEmpty()==0)return stack[top-1];
  else {
    printf("Stack is Empty\n");
    return -1;
  }
}

void call(){
  int n;
  scanf("%d",&n);
  while(n<0 || n>6){
    printf("Please enter valid operation number between 1 and 5\n");
    scanf("%d",&n);
  }
  
  switch(n){
    case 1:push();break;
    case 2:pop();break;
    case 3:printf("%d\n\n",peek());break;
    case 4:
      if(isEmpty()==1)printf("TRUE\n\n");
      else printf("FALSE\n\n");
      break;
    case 5:display();break;
    case 6:return;
  }
  printf("Enter next operation number - ");
  call();
  return;
}

int main() {
  
  printf("Enter size of stack (less than or equal to 100)\n");
  scanf("%d",&size);
  while(size>100 || size<0){
    printf("Please enter valid size between 0 and 100\n");
    scanf("%d",&size);
  }
  
  printf("\n\nEnter operation number to do corresponding operation\n1.Push\n2.Pop\n3.Peek\n4.isEmpty\n5.Display\n6.Exit program\n");
  
  call();
  return 0;
}
