#include <stdio.h>
int main() {
  int a = 0;
  for (unsigned int i = 0; i < 10; ++i) {
    printf("%d ", i);
  }
  printf("\n");
  for (int i = 100; i <= 110; i += 3) {
    a += i;
    printf("%d ", i);
  }
  printf("\n");

  for (int i = 23; i < 87; i += 5) {
    a += i;
    printf("%d ", i);
  }
}
