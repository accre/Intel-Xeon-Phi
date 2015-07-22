/*
 * This example was provided at the Intel Xeon Phi workshop
 * at Supercomputing 2014 in New Orleans, LA, hosted by Texas 
 * Advanced Computing Center (TACC) staff.
*/

#include <stdio.h>
#include <omp.h>

int main(){
double sum; int i,n, nt;

   n=2000000000;
   sum=0.0e0;

   #pragma omp parallel for reduction(+:sum)
   for(i=1;i<=n;i++){
      sum = sum + i;
   }
   #pragma omp parallel
   {
      #pragma omp single
      nt = omp_get_num_threads();
   }

   #ifdef __MIC__
      printf("Hello MIC reduction %f threads: %d\n",sum,nt);
   #else
      printf("Hello CPU reduction %f threads: %d\n",sum,nt);
   #endif
}
