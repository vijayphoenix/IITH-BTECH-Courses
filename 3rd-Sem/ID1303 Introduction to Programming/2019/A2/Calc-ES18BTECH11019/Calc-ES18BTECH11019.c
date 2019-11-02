/*Program for Simple Calculator*/

#include <stdio.h>

int main(void)
{
    int a, b; //declaring variables
    char c;
    scanf("%c %d %d", &c, &a, &b); //Taking input from user
    switch (c)
    {         //implementing switch case conditions as problem is divided into 4 cases
    case '+': //If the operation is addition
        printf("Addition \n");
        printf("%d \n", a + b);
        break; //we break the loop if the operation is finished

    case '-': //If the operation is subtraction
        printf("Subtraction \n");
        printf("%d \n", a - b);
        break;

    case '*': //If the operation is Multiplication
        printf("Multiplication \n");
        printf("%d \n", a * b);
        break;

    case '/': //If the operation is Divison
        printf("Division \n");
        (b == 0) ? printf("Error \n") : printf("%lf \n", (a * 1.0) / b); //Short hand if else conditon, typecasting so that "a/b" becomes double
        break;
    }
    return 0;
}