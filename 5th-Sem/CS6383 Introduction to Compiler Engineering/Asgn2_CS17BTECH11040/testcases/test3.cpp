#include <stdio.h>
int main() {
  int a = 0;
  for (int i = 100; i >= 0; i -= 1) {
    a += i;
    printf("%d ", i);
  }
  for (int i = -23; i >= -874; i -= 5) {
    a += i;
    printf("%d ", i);
  }
  for (int i = 100; i <= 1110; i++) {
    a += i;
    printf("%d ", i);
  }
  for (int i = 23; i < 874; i += 5) {
    a += i;
    printf("%d ", i);
  }
  for (int j = 0; j < 10; j++) {
    for (unsigned int i = 0; i < 10; ++i) {
      printf("%d ", j);
    }
  }
}
