/*Product of Even Positive Numbers*/

#include <stdio.h>

int main()
{
    int N, i = 2; //defining variables
    long long int prod = 1;
    scanf("%d", &N); //taking input from user
    if (N <= 0)
    {
        printf("Error \n"); //Printing error message
    }
    else if (N == 1)
        printf("\n");
    else if (N > 33)
        printf("Overflow \n");
    else
    {
        while (i <= N) //Condition Statement
        {
            if (i % 2 == 0) //if 'i' is an even integer, we print it and we store the multiplication of even integers upto that number
            {
                printf("%d ", i);
                prod *= i; //storing and computing products
            }
            i++; //incrementing 'i'
        }
        printf("\n");
        printf("%lld \n", prod); //printing product
    }
    return 0; //end of program
}