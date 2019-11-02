/*Program for Bank Application */

#include <stdio.h>
int main() {
    long long int N, in_bal, debit, credit;
    char sel;
    // printf("Enter the no. of Operations \n");
    while (scanf("%lld", &N) == 1 && N <= 0)//Scan the input from the user till "N" value is valid
        printf("Please Enter a valid value for \"N\" \n");

    // printf("Enter the initial Balance \n");
    scanf("%lld", &in_bal);

    for (int itr = 1; itr <= N; itr++) {
        // printf("Enter the Selection \n");
        scanf(" %c", &sel);//Using a whitespace for %c for preventing new line buffer
        switch (sel) {//switch statement for decison control

        case 'w'://withdraw case

            printf("WithdrawAmount \n");
            scanf("%lld", &debit);
            if (in_bal - debit >= 0) {
                printf("Success \n");
                in_bal -= debit;
            } else
                printf("Error! Insufficient Balance \n");
            break;

        case 'a'://add case

            printf("AddAmount \n");
            scanf("%lld", &credit);
            printf("Success \n");
            in_bal += credit;
            break;

        case 'p'://Showing balance case

            printf("GetBalance \n");
            printf("%lld \n", in_bal);
            break;

        default://Else Error

            printf("Error! Please enter the correct Selection \n");
            break;
        }
    }
    return 0;
}