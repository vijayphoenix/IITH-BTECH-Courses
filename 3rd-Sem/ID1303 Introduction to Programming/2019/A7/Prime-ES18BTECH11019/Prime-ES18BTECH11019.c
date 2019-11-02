#include <stdio.h>
#include<math.h>
int isDigit(char a) { //Function to check if input is digit
    if (a >= '0' && a <= '9')
        return 1;
    else
        return 0;
}

int res(long long int num) { //Recursive fn to get sum of prime digits in a number
    if(num!=0) {
        if (num % 10 == 2 || num % 10 == 3 || num % 10 == 5 || num % 10 == 7) //primality check
            return (num % 10 + res(num / 10)); //recursive call
        else return res(num / 10); //If not prime ignoring last digit
    }
    else return 0;
}
int main() {
    char ch;
    int cnt = 0,flag=0;
    long long int sum = 0;//Initialising sum
    printf("Enter the number: ");
    scanf("%c",&ch);//Taking input as digit by digit
    if(ch=='-') flag=1;//checking for negative number
    while (ch!='\n') {//Incrementing cnt for each valid value of digit else exit while loop
        cnt += 1;
        if(isDigit(ch)) sum += (ch - '0') * pow(10, 10 - cnt);
        scanf("%c",&ch);
    }
    if (cnt == 10 && flag==0) //If no. of digits is 10 and a valid number we should print the result
        printf("%d \n", res(sum));
    else
        printf("INCORRECT INPUT!! Please enter again... \n");
    return 0;
}