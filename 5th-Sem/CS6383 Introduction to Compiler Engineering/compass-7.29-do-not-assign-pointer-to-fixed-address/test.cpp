#include <iostream>
#define ulli unsigned long long int

// Function pointer is assigned to fixed address
int (*f1)(float, char, char) = (int (*)(float, char, char))0x08040000;
int (*f2)() = (int (*)())0x08040000;

// Decleration of Function ptr 
int (*f3)(float, char, char);

int main()
{
	int *n = new int(5);
	ulli ptr = (ulli)n;

	// 'ptr' does not have fixed address as it is allocated with 'new'
	// This is allowed.
	int *m = (int *)ptr;
	std::cout << m;

	// Assigning fixed address to Function ptr
	f3 = (int (*)(float, char, char))0x08040000;
	return 0;
}