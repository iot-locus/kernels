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
#include <math.h>
#include <float.h>
#include <pthread.h>
#include <unistd.h>

#define DUMP

#ifdef DUMP
#include<m5op.h>
#endif

#define num_threads 16

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
int NI = 128;
int NJ = 128;
int NUM_THREADS = 16;

//Global thread list
pthread_t thread[num_threads];
pthread_barrier_t barr; //barrier

//Data input
DATA_TYPE* A; //Input image
DATA_TYPE* B; //Output Image

//Convole input array A with a 3X3 matrix whose value is hardcoded inside this function
//Write the output to variable B
void calc_conv2D(int id)
{
    //printf("\ncore %d step 3\n", id);
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
                        /*int inp_index = i;
                        if(id == 0 && i == i_end -1 && j == j_start)
                                printf("%f %f %f %f %f %f %f %f %f\n",A[(inp_index - 1)*NJ + (j - 1)],A[(inp_index + 0)*NJ + (j - 1)],
                                         A[(inp_index + 1)*NJ + (j - 1)], A[(inp_index - 1)*NJ + (j + 0)], A[(inp_index + 0)*NJ + (j + 0)],
                                        A[(inp_index + 1)*NJ + (j + 0)], A[(inp_index - 1)*NJ + (j + 1)], A[(inp_index + 0)*NJ + (j + 1)],
                                        A[(inp_index + 1)*NJ + (j + 1)]);*/

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
	char filename[256] = {"/home/vanchi/input_2dconv/pthrd_"};
	int base_fname_length = 32;

	char rank_str[20];
	sprintf(rank_str, "%d", k);

	for(i = 0; rank_str[i] != '\0'; i++)
		filename[base_fname_length + i] = rank_str[i];
	filename[base_fname_length + i] = '\0';
    //printf("\ncore %d step 2.5\n", k);
	FILE *fp = fopen(filename, "r");

    //printf("\ncore %d step 2.6 finished open the file\n", k);
    if(fp == NULL)
    {
        printf("\ncannot open the file %s\n", filename);
    }
	//printf("NI = %d NJ = %d\n", NI, NJ);
	for (i = 0; i < num_rows; ++i)
	{
		for (j = 0; j < NJ; ++j)
		{
			fscanf(fp, "%f", &A[ (k*num_rows + i)*NJ + j]);
			//printf("%lf", A[ (k*num_rows + i)*NJ + j]);
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


//function to print contents of the input array
void printToFile(DATA_TYPE* A)
{
        int i, j;
	FILE *fp = fopen("/home/vanchi/input_2dconv/output", "w");
        for (i = 0; i < NI; ++i)
        {
                for (j = 0; j < NJ; ++j)
                {
                        fprintf(fp,"%f ", A[i*NJ + j]);
                }
                fprintf(fp,"\n");
        }
	fclose(fp);
}
void * thread_function(void * thread_id)
{
	//Get id, gives warning but whatevski
	int *id = (int*)thread_id;
	int temp = *id;

	init(temp);

	pthread_barrier_wait(&barr);
	if(temp == 0)
	{
#ifdef DUMP
        m5_dump_stats(0, 0);
        m5_reset_stats(0, 0);
#endif
	}

	calc_conv2D(temp);

	pthread_barrier_wait(&barr);
        if(temp == 0)
        {
#ifdef DUMP
        m5_dump_stats(0, 0);
        m5_reset_stats(0, 0);
#endif
        }

        //if(temp == 0)
	//	printf("done convolution %d\n", temp);
}

void compute_using_pthreads()
{
	pthread_barrier_init(&barr, NULL, NUM_THREADS);

        //Start threads
        int thread_id[num_threads];
        int x;
        for(x=0; x < NUM_THREADS-1; ++x)
        {
            thread_id[x] = x;
            pthread_create( &thread[x], NULL, thread_function, (void*) (thread_id+x));
        }

       thread_id[x] = x;
       thread_function((void*) (thread_id + x));
}

int main(/*int argc, char *argv[]*/)
{
	//int argc = 7;
	//char *argv[] = {"", "-i", "256", "-j", "256", "-t", "16"};

	//get image size and number of threads
	//get_options(argc, argv);

	//Allocate array
	A = (DATA_TYPE*)malloc(NI*NJ*sizeof(DATA_TYPE));
	B = (DATA_TYPE*)malloc(NI*NJ*sizeof(DATA_TYPE));

	compute_using_pthreads();

	//printToFile(B);
	//printf("done with printing to file\n");
	
	//free memory
	free(A);
	free(B);
	
	return 0;
}
