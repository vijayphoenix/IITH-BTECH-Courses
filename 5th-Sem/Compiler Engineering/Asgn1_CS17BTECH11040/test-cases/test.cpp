int foo() {
	int i=0;
	int *ip=&i;
	for(int i=0;i<100;i++){	
		int temp=0;
		temp+=i;
		*ip=temp;
	}
	return i;
}