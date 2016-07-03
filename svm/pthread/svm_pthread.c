#define _XOPEN_SOURCE 600

#include <float.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>


// IF targeted at arm include DUMP
#ifdef __arm__
#define DUMP
#endif

#ifdef DUMP
#include <m5op.h>
#endif

#include <pthread.h>
#include <sys/time.h>
#include <assert.h>

#define INPUT_SIZE 50
#define MAT_DIM 4
#define NUM_THREADS 4

typedef float data_t;

data_t input_vec[MAT_DIM];
data_t ***SV; //Support Vector
int NUM_EL[NUM_THREADS];// = {0,0,0,0}; //Function to store the total number of SV read
int MAX_EL = 800; //Max is set as 800 since we have only 764 currently

pthread_t thread[NUM_THREADS - 1];
pthread_barrier_t barr;
pthread_mutex_t lock;

float GLOB_SUM = 0;

//THis function is used to get the SV from the corresponding file
void get_data(int rank, data_t** SV)
{ 
	char filename[256] = {"input_svm/model_"};
    int base_fname_length = 16, i, j;
    char rank_str[20];
	int curr_index = 0;
	int ret_val;

        sprintf(rank_str, "%d", rank);

        for(i = 0; rank_str[i] != '\0'; i++)
                filename[base_fname_length + i] = rank_str[i];

        filename[base_fname_length + i] = '\0';

        FILE *fp = fopen(filename, "r");
        assert(fp);


        while (fscanf(fp, "%f", &SV[curr_index][0]) != EOF) {

		for(j = 1; j < MAT_DIM+1; j++)
	                ret_val = fscanf(fp, "%f", &SV[curr_index][j]);

		if(ret_val <= 0)
			printf("error reading file\n");

		curr_index++;
        if(curr_index == 100)
            break;
        }

	NUM_EL[rank] = curr_index/NUM_THREADS;

        fclose(fp);
        //printf("Filename of Rank %d is %s num_el %d\n",rank, filename, NUM_EL[rank]);
}

void get_input()
{
	char filename[256] = {"input_svm/input"};
	int curr_index = 0;

        FILE *fp = fopen(filename, "r");
        assert(fp);

        while (fscanf(fp, "%f", &input_vec[curr_index]) != EOF) {
		curr_index++;
        }

        fclose(fp);
        //printf("val0 %f val1 %f val2 %f val3 %f\n", input_vec[0], input_vec[1],input_vec[2],input_vec[3]);
}

float compute_svm_sum(int rank, float gamma, data_t ** SV)
{
	int i, j;
	float sum = 0;
	for(i = 0; i < NUM_EL[rank]; i++)
	{
		float dot_prod = 0;
		for(j = 1; j < MAT_DIM +1; j++)
			dot_prod += (input_vec[j-1] - SV[i][j]) * (input_vec[j-1] - SV[i][j]);
		sum += SV[i][0] * exp(-gamma*dot_prod);
	}
	return sum;
}

void free_data(data_t **SV)
{
	int i = 0;
	for(i=0; i<MAX_EL; i++)
		free(SV[i]);
	free(SV);
}

void* thread_function(void* thread_id)
{
	int id = (int)thread_id;
	float sum;
	int i;
	float gamma = 0.25;
	float rho = -0.495266;

	// if(id == 0)
		// get_input();
	for (i = 0; i < INPUT_SIZE; ++i) {
		pthread_barrier_wait(&barr);

		//printf("threadId : %d, compute starting...\n",id);
		sum = compute_svm_sum(id, gamma, SV[id%4]);
		//printf("threadId : %d, compute done.\n",id);

		//printf("ID %d SUM %f\n", id, sum);
		pthread_mutex_lock(&lock);
			GLOB_SUM += sum;
			//printf("ID %d GLOB_SUM %f\n", id, GLOB_SUM);
		pthread_mutex_unlock(&lock);

		pthread_barrier_wait(&barr);
		//printf("threadId : %d, barrier done.\n",id);

		if(id==0){
		 	pthread_mutex_lock(&lock);
		 	GLOB_SUM -= rho;
		 	pthread_mutex_unlock(&lock);
			// printf("gloabl sum = %f\n", GLOB_SUM);
			// if(1 > 0)
			// 	printf("CLASS is 1\n");
			// else
			// 	printf("CLASS is 0\n");
		 	//GLOB_SUM = 0;

		}
	}


}

int main(int argc, char *argv[])
{
        int rank;
        int n_ranks;

	get_input();

	int i;
	int j;
	SV = (data_t***)malloc(4*sizeof(data_t**));

	for (i = 0; i < 4; ++i)
	{
		SV[i] = (data_t**)malloc(MAX_EL*sizeof(data_t*));
		for(j=0; j<MAX_EL; j++)
			SV[i][j] = (data_t*)malloc((MAT_DIM+1)*sizeof(data_t));
	}

    pthread_mutex_init(&lock, NULL);

	//printf("getting data.....\n");
	for (i=0; i<4; i++){
		get_data(i%4, SV[i%4]);
	}
	//printf("getting data done.\n");

	#ifdef DUMP
		m5_dump_stats(0, 0);
		m5_reset_stats(0, 0);
	#endif

        pthread_barrier_init(&barr, NULL, NUM_THREADS);
        //thread = malloc(sizeof(pthread_t) * (NUM_THREADS - 1));

        //Start threads
        int thread_id;
        for(thread_id=0; thread_id < NUM_THREADS - 1; thread_id++)
        {
            pthread_create( &thread[thread_id], NULL, thread_function, (void*) thread_id);
        }
        thread_function((void*) (thread_id));

		#ifdef DUMP
			m5_dump_stats(0, 0);
			m5_reset_stats(0, 0);
		#endif


	// GLOB_SUM -= rho;
	// printf("gloabl sum = %f\n", GLOB_SUM);
	// if(GLOB_SUM > 0)
	// 	printf("CLASS is 1\n");
	// else
	// 	printf("CLASS is 0\n");

	// #ifdef DUMP
	// 	m5_dump_stats(0, 0);
	// 	m5_reset_stats(0, 0);
	// #endif

		for (i = 0; i < 4; ++i)
		{
			free_data(SV[i]);
		}
    	free(SV);
    return 0;
}
