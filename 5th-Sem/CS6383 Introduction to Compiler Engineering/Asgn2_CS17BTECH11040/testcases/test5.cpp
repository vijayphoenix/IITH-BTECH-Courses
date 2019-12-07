#include <stdio.h>
int main() {
  int a = 0;
  for (int i = 10; i >= 0; i--) {
    for (int j = 0; j < 10; j++) {
      printf("i = %d, j = %d ", i, j);
    }
    printf("\n");
  }

  for (int i = 10; i >= 0; i--) {
    int j = 0;
    while (j < 10) {
      printf("i = %d, j = %d ", i, j);
      j++;
    }
    printf("\n");
  }

  int j = 0;
  while (j < 10) {
    for (int i = 10; i >= 0; i--) {
      printf("i = %d, j = %d ", i, j);
    }
    j++;
  }
  printf("\n");

  int i = 10;
  while (i > 0) {
    int j = 0;
    while (j < 10) {
      printf("i = %d, j = %d ", i, j);
      j++;
    }
    printf("\n");
    i--;
  }
}
