/*Program for calculating xcy*/

#include<stdio.h>
long long int fac(int x);//Function for calculation of factorial
int main(void) {
    int x,y;
    long long int xcy;//declarations
    scanf("%d %d",&x,&y);
    if( x>0 && y>=0 && x>=y) {//checking conditions
        xcy=fac(x)/fac(y);
        xcy/=fac(x-y);
        printf("%lld \n",xcy);
    }
    else printf("Incorrect Input!! \n");
    return 0;

}
long long int fac(int x) {//return type is long long int(explained in Design File)
    if(x==0)    return 1;//0!=1
    int i;
    long long int fact=1;
    for(i=2; i<=x; i++) fact*=i;//factorial calculation
    return fact;//returning result
}