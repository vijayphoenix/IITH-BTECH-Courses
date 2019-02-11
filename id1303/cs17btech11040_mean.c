#include<stdio.h>

int main(){
	double d,sum=0;
	int n,i=0;
	printf("Enter a number\n");
	scanf("%d",&n);
	for (i = 0; i < n; ++i)
	{
		scanf("%lf",&d);
		sum+=d;
	}
	printf("%lf\n",sum/n);
}