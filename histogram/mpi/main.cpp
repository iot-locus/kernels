#define DUMP

//#include "common.h"
//#include <float.h>
#include <math.h>

#ifdef DUMP
#include "mpi.h"
#include <m5op.h>
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

/**
 * Sets the data type.
 */
#define DATA_FMT "f"
#define DATA_MAX 999999
#define DATA_MIN 0
typedef int data_t;

int rank;
/**
 * Number of data points to calculate the histogram.
 */
static int DATA_LEN = 2000;

/**
 * The number of buckets in this histogram.
 */
static int BUCKET_LEN = 10;

/**
 * Fetches data from stdin and sets the @data_bounds, ie
 * data_bounds[0] = min(data),
 * data_bounds[1] = max(data).
 */
data_t *get_data(int len, data_t* min, data_t* max, int rank)
{
	char filename[256] = {"input_histogram/input_"};
	int base_fname_length = 22, i;

	char rank_str[20];
	sprintf(rank_str, "%d", rank);

	for(i = 0; rank_str[i] != '\0'; i++)
		filename[base_fname_length + i] = rank_str[i];

	filename[base_fname_length + i] = '\0';
	
	FILE *fp = fopen(filename, "r");
    if(fp == NULL)
    {
        printf("\ncannot open file \"%s\".\n", filename);
        exit(1);
    }

	data_t *data = (data_t*)malloc(sizeof(data_t) * len);
	data_t *p = data;

	while (len--) {
		fscanf(fp, "%d", p);
//        printf("\ntan: p=%d\n", *p);
		//scanf("%f", p);
		//scanf("%" DATA_FMT, p);
		if (*p < *min)
			*min = *p;
		else if (*p > *max)
			*max = *p;
		p++;
	}

	fclose(fp);

	return data;
}

/**
 * Returns a zeroed vector of size @len to cache the partial result of the
 * histogram.
 */
int *get_bucket_cache(int len)
{
	int *cache = (int*)malloc(sizeof(int) * len);
	memset(cache, 0, sizeof(int) * len);
	return cache;
}

/**
 * Calculate the histogram for the local problem given by @local_data and place
 * the result in @bucket_cache.
 */
void histogram(data_t *local_data, int local_data_len, data_t min, data_t max,
		int *bucket_cache, int cache_len)
{
	int dmin = min;
	int delt = max - dmin;
	int i;

	for (i = 0; i < local_data_len; i++) {
		int r = cache_len * (local_data[i] - dmin) / delt;
		int b = r;
        //(int)floor(r);
		if (b == cache_len)
			b--;
		if (b >= 0 && b < cache_len)
			bucket_cache[b]++;
		else
		{
			printf("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRROR on core %d; cache_len=%d; b=%d\n", rank, cache_len, b);
			exit(0);
		}
	}
}

/**
 * Prints the usage string to stderr and exits.
 */
void usage(const char *prog)
{
	fprintf(stderr, "Usage: %s [-h] | [-n DATA SIZE] [-b BUCKET SIZE]\n", prog);
	exit(1);
}

/**
 * Get the command line arguments and change global variables.
 * We currently send 20 elements each for four cores
 * We can have 10 buckets for now
 */
void get_options(int argc, char **argv)
{
	int op;
	while ((op = getopt(argc, argv, "hn:b:")) != -1) {
		switch (op) {
			case 'n':
				DATA_LEN = atoi(optarg);
				break;
			case 'b':
				BUCKET_LEN = atoi(optarg);
				break;
			case 'h':
			default:
				usage(argv[0]);
		}
	}
}

int main(int argc, char *argv[])
{
	int n_ranks;

	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &n_ranks);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	//get_options(argc, argv);

	//int n_elements = DATA_LEN / n_ranks + 1;
	data_t min = DATA_MAX, max = DATA_MIN;

	data_t *datain;
	//data_t dataout[n_elements];
	//int displs[n_ranks];
	//int sendcnts[n_ranks];

	datain = get_data(DATA_LEN, &min, &max, rank);

	//printf("Done reading file on Rank %d\n", rank);

	data_t GLOB_MAX = 0;
	data_t GLOB_MIN = 0;

	min *= -1; //Multiplying by -1 since we can only use MAX reduction

    //printf("\ncore %d ready to reduce max=%f\n", rank, max);

    int *bucket = get_bucket_cache(BUCKET_LEN);

	int *result;
//	if (rank == 0)
	result = get_bucket_cache(BUCKET_LEN);

    GLOB_MAX = max;
    GLOB_MIN = min;


    MPI_Barrier(MPI_COMM_WORLD);

    if(rank == 0)
    {
#ifdef DUMP
        m5_dump_stats(0, 0);
        m5_reset_stats(0, 0);
#endif
    }

	MPI_Reduce(&max, &GLOB_MAX, 1, MPI_INT, MPI_MAX, 0, MPI_COMM_WORLD);
    MPI_Barrier(MPI_COMM_WORLD);
	MPI_Reduce(&min, &GLOB_MIN, 1, MPI_INT, MPI_MAX, 0, MPI_COMM_WORLD);

	GLOB_MIN *= -1; //Getting back the original min value by re-multiplying by -1
//	min *= -1;

//	printf("1: Rank %d GLOBAL MAX is %f GLOB MIN is %f\n", rank, GLOB_MAX, GLOB_MIN);
//	GLOB_MIN = 2; //Getting back the original min value by re-multiplying by -1

//    MPI_Barrier(MPI_COMM_WORLD);
    MPI_Barrier(MPI_COMM_WORLD);
	MPI_Bcast(&GLOB_MAX, 1, MPI_INT, 0, MPI_COMM_WORLD);
    MPI_Barrier(MPI_COMM_WORLD);
	MPI_Bcast(&GLOB_MIN, 1, MPI_INT, 0, MPI_COMM_WORLD);


    //tancheng:
//    GLOB_MAX = 255;
//    GLOB_MIN = 0;

//	if(rank == 0)
//		printf("2: Rank %d GLOBAL MAX is %f GLOB MIN is %f\n", rank, GLOB_MAX, GLOB_MIN);

	int delt = GLOB_MAX - GLOB_MIN;
	int i;
    int r;

	for (i = 0; i < DATA_LEN; i++) {
    	r = BUCKET_LEN * (datain[i] - GLOB_MIN) / delt;
//		int b = (int)floor(r);
		if (r == BUCKET_LEN)
			r--;
		if (r >= 0 && r < BUCKET_LEN)
			bucket[r]++;
		else
		{
			printf("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRROR r=%d\n", r);
			exit(0);
		}
	}

    MPI_Barrier(MPI_COMM_WORLD);
    data_t recved;
    int x;
    for(i = 0; i < n_ranks; ++i)
    {
        if(rank == i && i < n_ranks)
        {
            result[i] = bucket[i];
            for(x = 0; x < n_ranks; ++x)
            {
                if(rank != x)
                {
                    MPI_Recv(&recved, 1, MPI_INT, x, 0, MPI_COMM_WORLD, &n_ranks);
                    result[i] += recved;
                }
            }
        }
        else
        {
            MPI_Send(bucket+i, 1, MPI_INT, i, 0, MPI_COMM_WORLD);
        }
    }

//	MPI_Reduce(bucket, result, BUCKET_LEN, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);

//    MPI_Barrier(MPI_COMM_WORLD);
    if(rank == BUCKET_LEN-1)
    {
#ifdef DUMP
        m5_dump_stats(0, 0);
        m5_reset_stats(0, 0);
#endif
    }

    MPI_Barrier(MPI_COMM_WORLD);

	if (rank == 0) {
        int dmi = GLOB_MIN;
        int del = (GLOB_MAX - dmi);
        printf("len %d\n", BUCKET_LEN);
        printf("min %d\n", dmi);
        printf("del %d\n", del);
    }
    if(rank < BUCKET_LEN)
        printf("result[%d]=%d\n", rank, result[rank]);

	MPI_Finalize();
	return 0;
}
