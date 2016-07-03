/**
 * 2DConvolution.cu: This file is part of the PolyBench/GPU 1.0 test suite.
 *
 *
 * Contact: Scott Grauer-Gray <sgrauerg@gmail.com>
 * Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://www.cse.ohio-state.edu/~pouchet/software/polybench/GPU
 */

#define DUMP

#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>
#include <math.h>
#include <float.h>
#include <unistd.h>
#include <string.h>

#ifdef DUMP
#include<m5op.h>
#endif
//#include "mpi.h"
//#else
#include "mpi.h"
//#endif

/* Can switch DATA_TYPE between float and double */
typedef float DATA_TYPE;

/* Problem size */
int NI = 128;
int NJ = 128;
int NUM_THREADS = 16;
int thread_id;

//Data input
DATA_TYPE* A; //Input image
DATA_TYPE* B; //Output Image

//Convole input array A with a 3X3 matrix whose value is hardcoded inside this function
//Write the output to variable B
void calc_conv2D(int id)
{
        int i, j;
        DATA_TYPE c11, c12, c13, c21, c22, c23, c31, c32, c33;
        int i_start = 0, i_end = (NI / NUM_THREADS);
        int j_start = 1, j_end = NJ - 1;
        int inp_index;

	if(id == 0)
		i_start++;
	if(id == NUM_THREADS - 1)
		i_end--;

        c11 = +0.2;  c21 = +0.5;  c31 = -0.8;
        c12 = -0.3;  c22 = +0.6;  c32 = -0.9;
        c13 = +0.4;  c23 = +0.7;  c33 = +0.10;

        for (i = i_start; i < i_end; ++i)
        {
                for (j = j_start; j < j_end; ++j)
                {
                        inp_index = i + 1;
			/*if(i == i_end -1 && id == 0 && j == j_start)
				printf("%f %f %f %f %f %f %f %f %f\n\n",A[(inp_index - 1)*NJ + (j - 1)],A[(inp_index + 0)*NJ + (j - 1)],
					 A[(inp_index + 1)*NJ + (j - 1)], A[(inp_index - 1)*NJ + (j + 0)], A[(inp_index + 0)*NJ + (j + 0)],
					A[(inp_index + 1)*NJ + (j + 0)], A[(inp_index - 1)*NJ + (j + 1)], A[(inp_index + 0)*NJ + (j + 1)],
					A[(inp_index + 1)*NJ + (j + 1)]);*/

                        B[i*NJ + j] = c11 * A[(inp_index - 1)*NJ + (j - 1)]  +  c12 * A[(inp_index + 0)*NJ + (j - 1)]  +  c13 * A[(inp_index + 1)*NJ + (j - 1)]
                                + c21 * A[(inp_index - 1)*NJ + (j + 0)]  +  c22 * A[(inp_index + 0)*NJ + (j + 0)]  +  c23 * A[(inp_index + 1)*NJ + (j + 0)]
                                + c31 * A[(inp_index - 1)*NJ + (j + 1)]  +  c32 * A[(inp_index + 0)*NJ + (j + 1)]  +  c33 * A[(inp_index + 1)*NJ + (j + 1)];
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
	int i_start = 0, i_end = num_rows + 2;
	char filename[256] = {"/home/vanchi/input_2dconv/input_"};// input_2dconv/input_"};
	int base_fname_length = 32;

	int max_index = -1;
	int min_index = 111111;

	int CONST_MIN_INDEX = min_index;

	char rank_str[20];
	sprintf(rank_str, "%d", k);

	for(i = 0; rank_str[i] != '\0'; i++)
		filename[base_fname_length + i] = rank_str[i];
	filename[base_fname_length + i] = '\0';
	FILE *fp = fopen(filename, "r");

	if(fp == NULL)
	{
		printf("\ncannot open file %s\n", filename);    
	}

	if(k == 0)
		i_start++;
	if(k == NUM_THREADS - 1)
		i_end--;

	//printf("before for loop\n");

	for (i = i_start; i < i_end; ++i)
	{
		for (j = 0; j < NJ; ++j)
		{
			if(fscanf(fp, "%f", &A[ i*NJ + j]) != 1)
			{
				//printf("not able to read from fle tid %d . quitting i %d j %d index %d\n",k,i,j,i*NJ + j);
				fclose(fp);
				exit(0);
			}

			if(max_index < i*NJ + j)
				max_index = i*NJ + j;	
			if(min_index > i*NJ + j)
				min_index = i*NJ + j;

                        /*int inp_index = i;
                        if(i == i_end -1 && k == 0 && j < 2)
                                printf("%f %f %f %f %f %f %f %f %f\n\n",A[(inp_index - 1)*NJ + (j - 1)],A[(inp_index + 0)*NJ + (j - 1)],
                                         A[(inp_index + 1)*NJ + (j - 1)], A[(inp_index - 1)*NJ + (j + 0)], A[(inp_index + 0)*NJ + (j + 0)],
                                        A[(inp_index + 1)*NJ + (j + 0)], A[(inp_index - 1)*NJ + (j + 1)], A[(inp_index + 0)*NJ + (j + 1)],
                                        A[(inp_index + 1)*NJ + (j + 1)]);
			*/
			//printf("done reading %d:%f\n",k, A[ i*NJ + j]);
		}
	}

	fclose(fp);

	if(max_index > CONST_MIN_INDEX)
	{
		printf("PANIC CHANGE THE min_index value harcoded in the code\n");
		exit(0);
	}

	//printf("file reading done in thread %d max_index %d min_index %d i_start %d i_end %d NJ %d\n",k,max_index, min_index, i_start, i_end, NJ);
}

//function to print contents of the input array
void print(DATA_TYPE* A, int id)
{
	int i, j;

	for (i = 0; i < NI/NUM_THREADS+2; ++i)
	{
		printf("%d:::", id);
		for (j = 0; j < NJ; ++j)
		{
			printf("%f ", A[i*NJ + j]);
		}
		printf("\n");
	}
}

//function to print contents of the input array
void write_to_file(DATA_TYPE* A, int id)
{
	int i, j;

	char filename[256] = {"/home/vanchi/input_2dconv/output_"};
	int base_fname_length = 33;

	char rank_str[20];
	sprintf(rank_str, "%d", id);

	for(i = 0; rank_str[i] != '\0'; i++)
		filename[base_fname_length + i] = rank_str[i];
	filename[base_fname_length + i] = '\0';
	FILE *fp = fopen(filename, "w");

	for (i = 0; i < NI/NUM_THREADS; ++i)
	{
		for (j = 0; j < NJ; ++j)
		{
			fprintf(fp, "%f ", A[i*NJ + j]);
		}
		fprintf(fp,"\n");
	}
	fclose(fp);
}

void compute_using_mpi()
{	
	//MPI_Comm_size(MPI_COMM_WORLD, &NUM_THREADS);
	int NUM_R_PER_THREAD = NI/NUM_THREADS;

        //if(thread_id == 0)
        //        printf("Allocating memory\n");

	//Allocate array
	A = (DATA_TYPE*)malloc( (NUM_R_PER_THREAD+2)*NJ*sizeof(DATA_TYPE) );
	B = (DATA_TYPE*)malloc(  NUM_R_PER_THREAD*NJ*sizeof(DATA_TYPE));

        //if(thread_id == 0)
        //        printf("Doing memset\n");

	memset(A, 0x0, (NUM_R_PER_THREAD+2)*NJ*sizeof(DATA_TYPE));
	memset(B, 0x0, (NUM_R_PER_THREAD)*NJ*sizeof(DATA_TYPE));

        if(thread_id == 0)
                printf("Calling init\n");

	init(thread_id);

	//write_to_file(A, thread_id);

	MPI_Barrier(MPI_COMM_WORLD);
        if(thread_id == 0)
        {
#ifdef DUMP
        m5_dump_stats(0, 0);
        m5_reset_stats(0, 0);
#endif
        }

	//printf("calling thread_func id %d\n",thread_id);
	calc_conv2D(thread_id);
	//printf("done thread_func id %d\n",thread_id);

	MPI_Barrier(MPI_COMM_WORLD);
        if(thread_id == 0)
        {
#ifdef DUMP
        m5_dump_stats(0, 0);
        m5_reset_stats(0, 0);
#endif
        }

	//write_to_file(B, thread_id);

	//free memory
	//free(A);
	//free(B);
}

int main(int argc, char *argv[])
{
	//char *args[] = {"", "-i", "256", "-j", "256", "-t", "16"};
	//argc = 7;
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &thread_id);
	//get image size and number of threads
	//get_options(argc, args);

	//if(thread_id == 0)
	//	printf("Calling compute_using_mpi\n");

	compute_using_mpi();

	MPI_Finalize();	
	return 0;
}
