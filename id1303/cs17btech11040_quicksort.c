#include<stdio.h>

void SWAP(int *a,int *b){
	int temp=*a;
	*a=*b;
	*b=temp;
}

void quicksort(int a[],int l,int r){
	if(l<r){
		int i=l,j=r;
		while(i<j){
			while(a[i]<=a[l] && i<=j)i++;
			while(a[j]>=a[l] && j>=i)j--;
			if(i<j)	SWAP(&a[i],&a[j]);
		}
		SWAP(&a[l],&a[j]);
		quicksort(a,l,j-1);
		quicksort(a,j+1,r);
	}
}

int main(){
	int n,i;
	printf("Enter a number\n");
	scanf("%d",&n);
	int a[n];
	printf("Enter numbers in Array\n");
	for (i = 0; i < n; ++i)scanf("%d",&a[i]);
	quicksort(a,0,n-1);
	printf("Array after quicksort\n");
	for (i = 0; i < n; ++i)printf("%d ",a[i]);
	return 0;
}