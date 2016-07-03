/**
 * 2DConvolution.cu: This file is part of the PolyBench/GPU 1.0 test suite.
 *
 *
 * Contact: Scott Grauer-Gray <sgrauerg@gmail.com>
 * Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://www.cse.ohio-state.edu/~pouchet/software/polybench/GPU
 */

#include <unistd.h>
#include <stdio.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>

//#include "polybenchUtilFuncts.h"

//define the error threshold for the results "not matching"
#define PERCENT_DIFF_ERROR_THRESHOLD 0.05

/* Problem size */
int NI = 16;
int NJ = 16;
int NUM_THREADS = 16;

/* Can switch DATA_TYPE between float and double */
typedef float DATA_TYPE;

//Convole input array A with a 3X3 matrix whose value is hardcoded inside this function
//Write the output to variable B
void conv2D(DATA_TYPE* A, DATA_TYPE* B)
{
	int i, j;
	DATA_TYPE c11, c12, c13, c21, c22, c23, c31, c32, c33;

	c11 = +0.2;  c21 = +0.5;  c31 = -0.8;
	c12 = -0.3;  c22 = +0.6;  c32 = -0.9;
	c13 = +0.4;  c23 = +0.7;  c33 = +0.10;


	for (i = 1; i < NI - 1; ++i) // 0
	{
		for (j = 1; j < NJ - 1; ++j) // 1
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
void init(DATA_TYPE* A)
{
	int i, j, k, num_rows;

	num_rows = NI / NUM_THREADS;
	for(k = 0; k < NUM_THREADS; k++)
	{
		char filename[256] = {"input_"};
		//char filename[256] = {"/home/vanchi/iotsrjkvr/RandomGenerator/2dconv/input_"};
		int base_fname_length = 6, i;

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

int main(int argc, char *argv[])
{
	//double t_start, t_end;

	DATA_TYPE* A;
	DATA_TYPE* B;  

	//get image size and number of threads
	get_options(argc, argv);
	
	//Allocate array
	A = (DATA_TYPE*)malloc(NI*NJ*sizeof(DATA_TYPE));
	B = (DATA_TYPE*)malloc(NI*NJ*sizeof(DATA_TYPE));

	//initialize the arrays
	init(A);
	
	//start timer and run convolution algorithm
	//t_start = rtclock();
	conv2D(A, B);
	//t_end = rtclock();
	//fprintf(stdout, "CPU Runtime: %0.6lfs\n", t_end - t_start);//);

	//print the array contents if it is neccessary
	//print(B);
	
	//free memory
	free(A);
	free(B);
	
	return 0;
}
