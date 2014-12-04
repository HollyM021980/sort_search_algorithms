#include <stdio.h>

// Compile: gcc sorting.c
// Run: a.out

void bubble_srt(int unsortedArray[], int arraySize) {

  int temp;
  for(int i = 0; i < arraySize; i++) {
    for(int j = 0; j < (arraySize - 1); j++) {
      if(unsortedArray[j] > unsortedArray[j + 1]) {
        temp = unsortedArray[j];
        unsortedArray[j] = unsortedArray[j + 1];
        unsortedArray[j + 1] = temp;
      }
    }
  }
}

int main(void) {

  int array[8] = {12, 9, 4, 120, 1, 3, 10};
  int ARRAYSIZE = sizeof(array);
  printf("Array Size: ");
  printf("%d", ARRAYSIZE);
   printf("Before the sort:\n");     // Show results after the sort
   for(int i = 0; i < ARRAYSIZE; i++)
      printf("%d ", array[i]);
   printf("\n");

  bubble_srt(array, sizeof(array));

   printf("Before the sort:\n");     // Show results after the sort
   for(int i = 0; i < ARRAYSIZE; i++)
      printf("%d ", array[i]);
   printf("\n");

  return 0;
}
