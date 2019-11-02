#include<stdio.h>
#define ll long long int

int add(int first,int second) {//function to add two numbers
     int res=first+second;
    return res;
}
int sub(int first,int second) {//function to subtract two numbers
    int res=first-second;
    return res;
}
ll mul(int first,int second) {//function to multiply two numbers
    ll res=0;
    for(int i=1;i<=second;i++) res+=first;//multiplication is repeated addition
    return res;
}
int div(int first,int second) {//function to divide two numbers
    int cnt=0;
    if(second==0)   return -1;//invalid numbers
    else if(second<0 || first <0)   return -2;//Both numbers should be positive
    while(first>=second) {//Repeated subtraction is division
        ++cnt;
        first-=second;
    }
    return cnt;//returning the floor of division
}
int mod(int first,int second) {//function to get remainder when two numbers are divided
    int result,flag=first;
    if(second<=0)   return -1;//second number must be positive
    if(first<0)    flag=-first;//case to handle -x%y where x and y are positive no's
    //printf("%d \n",flag);
    result=flag;
    while (result >= second)
        result -= second;
        //printf("%d \n",result);
        if(first>=0)    return result;
        else return (second-result);//if first no is -ve then (-x%y)=y-(x%y), where x and y are positive
}
ll square(int num){//function to print square of two no's
    if(num<0)   num=-num;
    return mul(num,num);//square of x is x*x
}
int square_root(int num){//function to print square root of a number
    if(num<0)   return -1;//corner case
    int k = 0;
    int s = 0;
    while (s <= num){//returns floor of square root
        s = s+k+k+1;//'s' stores the square of the number 'k'
        k = k+1;//'k' stores the root of 's'
    }
    return k-1;//returns answer
}

int log_2(int num){//function to print log(to base 2) of number
    int flag=0,cnt=0;
    if(num<=0)  return -1;//Invalid number
    for(int i=1;i<num;i=mul(i,2))   ++cnt;//checking and incrementing if no. lies b/w 2^i and 2^(i+1)
    return cnt;
}
int main() {
    while(1) {//implementing menu
        printf("Enter the number corresponding to the operation you want to perform from the following \n");
        printf(" 1: Add \n 2: Subtract \n 3: Multiply \n 4: Divide \n");
        printf(" 5: Modulus \n 6: Square \n 7: Square root \n 8: Log (Base 2) \n 9: Exit \n");
        int choice,first,second,num,res;
        printf("Your Choice is : ");
        scanf("%d",&choice);
        if(choice==9)   {
            printf("You chose to terminate the program \n");
            break;
        }
        switch (choice)
        {
        case 1:
            printf("Enter the first number \n");
            scanf("%d",&first);
            printf("Enter the second number \n");
            scanf("%d",&second);
            printf("The result is: %d \n",add(first,second));
            break;
        case 2:
            printf("Enter the first number \n");
            scanf("%d",&first);
            printf("Enter the second number \n");
            scanf("%d",&second);
            printf("The result is: %d \n",sub(first,second));
            break;
        case 3:
            printf("Enter the first number \n");
            scanf("%d",&first);
            printf("Enter the second number \n");
            scanf("%d",&second);
            printf("The result is: %lld \n",mul(first,second));
            break;
        case 4:
            printf("Enter the first number \n");
            scanf("%d",&first);
            printf("Enter the second number \n");
            scanf("%d",&second);
            res=div(first,second);
            if(res==-1) printf("2nd number must be Non-Zero! \n");
            else if(res==-2) printf("Both numbers should be must be positive! \n");
            else printf("The result is: %d \n",res);
            break;
        case 5:
            printf("Enter the first number \n");
            scanf("%d",&first);
            printf("Enter the second number \n");
            scanf("%d",&second);
            res=mod(first,second);
            if(res==-1) printf("2nd number must be positive! \n");
            else printf("The result is: %d \n",mod(first,second));
            break;
        case 6:
            printf("Enter the number to be squared \n");
            scanf("%d",&num);
            printf("The result is: %lld \n",square(num));
            break;
        case 7:
            printf("Enter the number to perform Square root \n");
            scanf("%d",&num);
            res=square_root(num);
            if(res==-1) printf("Number must be positive! \n");
            else printf("The result is: %d \n",square_root(num));
            break;
        case 8:
            printf("Enter the number to perform Log(Base 2) \n");
            scanf("%d",&num);
            res=log_2(num);
            if(res==-1) printf("2nd number must be positive! \n");
            else printf("The result is : %d \n",res);
            break;
        default:
            printf("Invalid Choice, choose among 1 to 9 \n");
            break;
        }
    }
    return 0;
}
