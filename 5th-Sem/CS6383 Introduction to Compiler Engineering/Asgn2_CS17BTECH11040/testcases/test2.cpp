#include <stdio.h>
int main() {
  int a = 0;
  for (int i = 10; i >= 0; i -= 1) {
    a += i;
    printf("%d ", i);
  }
  for (int i = -20; i >= -85; i -= 7) {
    a += i;
    printf("%d ", i);
  }
}
