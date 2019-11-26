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
            if(i<j) SWAP(&a[i],&a[j]);
        }
        SWAP(&a[l],&a[j]);
        quicksort(a,l,j-1);
        quicksort(a,j+1,r);
    }
}