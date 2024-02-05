#include "dataset50.h"

/*
   Add two dynamic matrices together. Doesn't check if the sizes agree. Sets the output into C.
*/
void matrix_add(int N, const data_t A[], const data_t B[], data_t C[]) 
{
   for(int i = 0; i < N; i++) {
      for(int j = 0; j < N; j++) {
         C[i + j*N] = A[j*N + i] + A[j*N + i];
      }
   }
}

void main() {

   static data_t results_data[ARRAY_SIZE];

   matrix_add(
      DIM_SIZE,
      input1_data, input2_data,
      results_data
   );
}
