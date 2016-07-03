/**
 * 2DConvolution.cu: This file is part of the PolyBench/GPU 1.0 test suite.
 *
 *
 * Contact: Scott Grauer-Gray <sgrauerg@gmail.com>
 * Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://www.cse.ohio-state.edu/~pouchet/software/polybench/GPU
 */
#define _XOPEN_SOURCE 600 //FO BARRIERS
#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>
#include <math.h>
#include <float.h>
#include <pthread.h>
#include <unistd.h>


/*
#include <unistd.h>
#include <stdio.h>
#include <sys/time.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <pthread.h>
#include <float.h>
*/
//#include "polybenchUtilFuncts.h"

/* Can switch DATA_TYPE between float and double */
typedef float DATA_TYPE;

/* Problem size */
int NI = 16;
int NJ = 16;
int NUM_THREADS = 16;

//Global thread list
pthread_t *thread;
pthread_barrier_t barr; //barrier

//Data input
DATA_TYPE* A; //Input image
DATA_TYPE* B; //Output Image

//Convole input array A with a 3X3 matrix whose value is hardcoded inside this function
//Write the output to variable B
void calc_conv2D(int id)
{
	int i, j;
	DATA_TYPE c11, c12, c13, c21, c22, c23, c31, c32, c33;
	int i_start = i_start = (NI / NUM_THREADS) * id;
	int i_end = (NI / NUM_THREADS) * (id + 1);
	int j_start = 1, j_end = NJ - 1;

	c11 = +0.2;  c21 = +0.5;  c31 = -0.8;
	c12 = -0.3;  c22 = +0.6;  c32 = -0.9;
	c13 = +0.4;  c23 = +0.7;  c33 = +0.10;

	if(id == 0)
		i_start = 1;

	if(id == NUM_THREADS - 1)
		i_end = NI - 1;

        for (i = i_start; i < i_end; ++i)
        {
                for (j = j_start; j < j_end; ++j)
                {
			B[i*NJ + j] = c11 * A[(i - 1)*NJ + (j - 1)]  +  c12 * A[(i + 0)*NJ + (j - 1)]  +  c13 * A[(i + 1)*NJ + (j - 1)]
				+ c21 * A[(i - 1)*NJ + (j + 0)]  +  c22 * A[(i + 0)*NJ + (j + 0)]  +  c23 * A[(i + 1)*NJ + (j + 0)] 
				+ c31 * A[(i - 1)*NJ + (j + 1)]  +  c32 * A[(i + 0)*NJ + (j + 1)]  +  c33 * A[(i + 1)*NJ + (j + 1)];
		}
	}
}

/**
 * Get the command line arguments and change global variables.
 * We currently send 20 elements each for four cores
 * We can have 10 buckets for now
 */

void get_options(int argc, char **argv)
{
        int op;
        while ((op = getopt(argc, argv, "hi:j:t:")) != -1) {
                switch (op) {
                        case 'i':
                                NI = atoi(optarg);
                                break;
                        case 'j':
                                NJ = atoi(optarg);
                                break;
                        case 't':
				NUM_THREADS = atoi(optarg);
				break;
                        default:
				printf("wrond argument passed %s\n", optarg);
				break;
                }
        }
}

//function to initialize the input array by reading from the input files
void init(int k)
{
	int i, j, num_rows;
	num_rows = NI / NUM_THREADS;
	char filename[256] = {"input_"};
	int base_fname_length = 6;

	char rank_str[20];
	sprintf(rank_str, "%d", k);

	for(i = 0; rank_str[i] != '\0'; i++)
		filename[base_fname_length + i] = rank_str[i];
	filename[base_fname_length + i] = '\0';
	FILE *fp = fopen(filename, "r");

	for (i = 0; i < num_rows; ++i)
	{
		for (j = 0; j < NJ; ++j)
		{
			fscanf(fp, "%f", &A[ (k*num_rows + i)*NJ + j]);
		}
	}

	fclose(fp);
}

//function to print contents of the input array
void print(DATA_TYPE* A)
{
        int i, j;

	for (i = 0; i < NI; ++i)
	{
		for (j = 0; j < NJ; ++j)
		{
			printf("%f ", A[i*NJ + j]);
		}
		printf("\n");
	}
}

void * thread_function(void * thread_id)
{
        //Get id, gives warning but whatevski
        int id = (int)thread_id, i;

	init(id);
	pthread_barrier_wait(&barr);

	calc_conv2D(id);	
}

void compute_using_pthreads()
{
	thread = malloc(sizeof(pthread_t) * NUM_THREADS);
	pthread_barrier_init(&barr, NULL, NUM_THREADS);

        //Start threads
        int thread_id;
        for(thread_id=0; thread_id < NUM_THREADS; thread_id++)
        {
                pthread_create( &thread[thread_id], NULL, thread_function, (void*) thread_id);
        }

        for(thread_id=0; thread_id < NUM_THREADS; thread_id++)
        {
                pthread_join(thread[thread_id], NULL);
        }

}

int main(int argc, char *argv[])
{
	double t_start, t_end;

	//get image size and number of threads
	get_options(argc, argv);
	
	//Allocate array
	A = (DATA_TYPE*)malloc(NI*NJ*sizeof(DATA_TYPE));
	B = (DATA_TYPE*)malloc(NI*NJ*sizeof(DATA_TYPE));

	compute_using_pthreads();

	//start timer and run convolution algorithm
	//t_start = rtclock();
	//conv2D();
	//t_end = rtclock();
	//fprintf(stdout, "CPU Runtime: %0.6lfs\n", t_end - t_start);//);

	//print the array contents if it is neccessary
	//print(A);
	//print(B);
	
	//free memory
	free(A);
	free(B);
	
	return 0;
}
