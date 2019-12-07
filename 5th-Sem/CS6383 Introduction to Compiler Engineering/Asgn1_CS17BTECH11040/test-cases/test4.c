#include <stdio.h>

int main() {
	int i = 1;
	int *i0 = &i;
	int *i1 = i0;
	{
		*i1 = 5;
	}
	*i0 = 7;
	return 0;
}