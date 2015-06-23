/*
 * Copyright (C) 2009-2013 Intel Corporation. All Rights Reserved.
 *
 * The source code contained or described herein and all
 * documents related to the source code ("Material") are owned by 
 * Intel Corporation or its suppliers or licensors. Title to the
 * Material remains with Intel Corporation or its suppliers and
 * licensors. The Material is protected by worldwide copyright
 * laws and treaty provisions.  No part of the Material may be
 * used, copied, reproduced, modified, published, uploaded,
 * posted, transmitted, distributed,  or disclosed in any way
 * except as expressly provided in the license provided with the
 * Materials.  No license under any patent, copyright, trade
 * secret or other intellectual property right is granted to or
 * conferred upon you by disclosure or delivery of the Materials,
 * either expressly, by implication, inducement, estoppel or
 * otherwise, except as expressly provided in the license
 * provided with the Materials. 
 *
 * [DESCRIPTION]
 * Each element of the product matrix c[i][j] is 
 * computed from a unique row and
 * column of the factor matrices, a[i][k] and b[k][j].
 *
 * In the multithreaded implementation, each thread can
 * concurrently compute some submatrix of the product without
 * needing OpenMP data or control synchronization.
 *
 * The algorithm uses OpenMP* to parallelize the outer-most loop,
 * using the "i" row index.
 *
 * Both the outer-most "i" loop and middle "k" loop are manually
 * unrolled by 4.  The inner-most "j" loop iterates one-by-one
 * over the columns of the product and factor matrices.
 *
 * [COMPILE]
 * Use the following compiler options to compile both multi- and 
 * single-threaded versions.
 *
 * Parallel compilation:
 *  You must set the stacksize to an appropriate size; otherwise,
 *  the application will generate a segmentation fault. 
 *  Linux* and OS X*: appropriate ulimit commands are shown for 
 *  bash shell.
 *
 *  Windows*: /Qstd=c99 /Qopenmp /F256000000
 *
 *  Linux*:   ulimit -s unlimited
 *            -std=c99 -openmp
 * 
 *  OS X*:  ulimit -s 64000
 *            -std=c99 -openmp
 *
 * Serial compilation:
 *
 *  Use the same command, but omit the -openmp (Linux and OS X)
 *  or /Qopenmp (Windows) option.
 *
 */

#include <stdio.h>
#include <time.h>
#include <float.h>
#include <math.h>
#ifdef _OPENMP
#include <omp.h>
#endif
#ifndef __cplusplus
#define bool _Bool
#define true 1
#define false 0
#endif

// Matrix size constants
// Be careful to set your shell's stacksize limit to a high value if you
// wish to increase the SIZE.
#define SIZE     4800     // Must be a multiple of 8.
#define M        SIZE/8
#define N        SIZE/4
#define P        SIZE/2
#define NTIMES   5        // product matrix calculations

int main(void)
{
  double a[M][N], b[N][P], c[M][P], walltime;
  bool nthr_checked=false;
  time_t start;

  int i, j, k, l, i1, i2, i3, k1, k2, k3, nthr=1;

  printf("Using time() for wall clock time\n");
  printf("Problem size: c(%d,%d) = a(%d,%d) * b(%d,%d)\n",
         M, P, M, N, N, P);
  printf("Calculating product %d time(s)\n", NTIMES);

  // a is identity matrix
  for (i=0; i<M; i++)
    for (j=0; j<N; j++)
      a[i][j] = 1.0;

  // each column of b is the sequence 1,2,...,N
  for (i=0; i<N; i++)
    for (j=0; j<P; j++)
      b[i][j] = i+1.;

  start = time(NULL);

  for (l=0; l<NTIMES; l++) {
   #pragma omp parallel private(i,j,k)
   {
   #pragma omp single nowait
    if (!nthr_checked) {
#ifdef _OPENMP
      nthr = omp_get_num_threads();
#endif
      printf( "\nWe are using %d thread(s)\n", nthr);
      nthr_checked = true;
    }

    // Initialize product matrix
    #pragma omp for nowait
    for (i=0; i<M; i++)
      for (j=0; j<P; j++)
        c[i][j] = 0.0;

    // Parallelize by row.  The threads don't need to synchronize at
    // loop end, so "nowait" can be used.
    #pragma omp for nowait
    for (i=0; i<M; i++) {
      for (k=0; k<N; k++) {
        // Each element of the product is just the sum 1+2+...+n
        for (j=0; j<P; j++) {
          c[i][j]  += a[i][k]  * b[k][j];
        }
      }
    }
  } // #pragma omp parallel private(i,j,k)
  } // l=0,...NTIMES-1

  walltime = time(NULL) - start;
  printf("\nFinished calculations.\n");
  printf("Matmul kernel wall clock time = %.2f sec\n", walltime);
  printf("Wall clock time/thread = %.2f sec\n", walltime/nthr);
  printf("MFlops = %f\n",
      (double)(NTIMES)*(double)(N*M*2)*(double)(P)/walltime/1.0e6);

  return 0;
}
