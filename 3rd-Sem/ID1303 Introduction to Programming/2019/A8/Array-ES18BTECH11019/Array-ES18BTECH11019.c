#include<stdio.h>
#include<limits.h>
void lar(int arr[],int n) {
    int first,second,i;
    if (n < 1) {
        printf("First Largest Element: NULL \n");
        printf("Second Largest Element: NULL \n");
        return;
    }
    else if(n<2) {
        printf("First Largest Element: %d \n",arr[0]);
        printf("Second Largest Element: %d \n",arr[0]);
        return;
    }
    first = second = INT_MIN;
    for (i = 0; i < n ; i ++) {
        /* If current element is greater than first
           then update both first and second */
        if (arr[i] > first) {
            second = first;
            first = arr[i];
        }

        /* If arr[i] is in between first and
           second then update second  */
        else if (arr[i] > second && arr[i] != first)
            second = arr[i];
    }
    printf("First Largest Element: %d \n",first);
    printf("Second Largest Element: %d \n",second);
}
int main() {
    int a[10],b[10],c[10],d[20],flag,m=0,k=10,cnt1=0,cnt2=0;
    for(int i=0; i<20; i++)   d[i]=INT_MIN;
    for(int i=0; i<10; i++)   c[i]=INT_MIN;
    for(int i=0; i<10; i++)   scanf("%d",&a[i]);
    for(int i=0; i<10; i++)   scanf("%d",&b[i]);
    for(int i=0; i<10; i++) {
        for(int j=i+1; j<10; j++) {
            if(a[i]==a[j] || b[i]==b[j]) {
                printf("The Elements in the array are not Distinct!\n");
                printf("Please enter only the distinct elements \n");
                main();
            }
        }
    }
    for(int i=0; i<10; i++)   d[i]=a[i];
    for(int i=0; i<10; i++) {
        flag=0;
        for(int j=0; j<10; j++) {
            if(b[i]==a[j]) {
                flag=1;
                c[m++]=b[i];
            }
        }
        if(flag==0) d[k++]=b[i];
    }
    printf("Union: ");
    for(int i=0; i<20; i++) if(d[i]!=INT_MIN) {
            printf("%d ",d[i]);
            ++cnt1;//cnt1 indicates no.of valid indices which are not equal to INT_MIN
        }
    printf("\n");
    printf("Intersection: ");
    for(int i=0; i<10; i++) if(c[i]!=INT_MIN) {
            printf("%d ",c[i]);
            ++cnt2;//cnt2 indicates no.of valid indices which are not equal to INT_MIN
        }
    if(cnt2==0)    printf("NULL");
    printf("\n \n");
    printf("Union Computation: \n");
    lar(d,cnt1);
    printf("\n");
    printf("Intersection Computation: \n");
    lar(c,cnt2);
    return 0;
}