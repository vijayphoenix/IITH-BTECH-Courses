#include<stdio.h>

int main(){
	int n,i,j,temp;
	printf("Enter a number\n");
	scanf("%d",&n);
	int a[n];
	printf("Enter numbers in Array\n");
	for (i = 0; i < n; ++i)scanf("%d",&a[i]);
	for (i = 0; i < n; ++i)
	{
		j=i;
		temp=a[i];
		while(j>0 && temp<a[j-1]){
			a[j]=a[j-1];
			j--;
		}
		a[j]=temp;
	}
	printf("Array after Insertion sort\n");
	for (i = 0; i < n; ++i)printf("%d ",a[i]);
	return 0;
}