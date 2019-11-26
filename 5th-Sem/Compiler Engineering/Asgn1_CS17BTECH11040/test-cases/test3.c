int main()
{
	int i=0;
	int *p1=&i;
	*p1 = 3;
	{
		*p1 = 4;
	}
	return 0;
}
