#define lli long long int

lli fib(int n) 
{ 
  lli f1 = 0, f2 = 1, sum; 
  if(n == 0) return f1; 
  for (int i = 2; i <= n; i++) 
  { 
     sum = f1 + f2; 
     f1 = f2; 
     f2 = sum; 
  } 
  return f2; 
} 
  
int main () 
{ 
  fib(10); 
  return 0; 
} 