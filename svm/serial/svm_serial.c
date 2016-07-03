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

#define MAT_DIM 4
#define NUM_THREADS 4
#define NUM_INPUTS 50

typedef float data_t;

data_t input_vec[MAT_DIM];
int NUM_EL[NUM_THREADS]; //= {0,0,0,0}; //Function to store the total number of SV read
int MAX_EL = 800; //Max is set as 800 since we have only 764 currently


float GLOB_SUM = 0;

data_t ***SV; //Support Vector

//This function is used to get the SV from the corresponding file
void get_data(int rank, data_t** SV)
{ 
	char filename[256] = {"model_"};
        int base_fname_length = 6, i, j;
        char rank_str[20];
	int curr_index = 0;
	int ret_val;

        sprintf(rank_str, "%d", rank%4);   //modulo 4 to use the 4 files

        for(i = 0; rank_str[i] != '\0'; i++)
                filename[base_fname_length + i] = rank_str[i];

        filename[base_fname_length + i] = '\0';

        FILE *fp = fopen(filename, "r");

        while (fscanf(fp, "%f", &SV[curr_index][0]) != EOF) {

		for(j = 1; j < MAT_DIM+1; j++)
	                ret_val = fscanf(fp, "%f", &SV[curr_index][j]);

		if(ret_val <= 0)
			printf("error reading file\n");

		curr_index++;
        }

	NUM_EL[rank] = curr_index;

        fclose(fp);
}

void get_input()
{
	char filename[256] = {"input"};
	int curr_index = 0;

        FILE *fp = fopen(filename, "r");

        while (fscanf(fp, "%f", &input_vec[curr_index]) != EOF) {
		curr_index++;
        }

        fclose(fp);
}

float compute_svm_sum(int rank, float gamma, data_t *** SV)
{
	int i, j;
	float sum = 0;
	for(i = 0; i < NUM_EL[rank]; i++)
	{
		float dot_prod = 0;
		for(j = 1; j < MAT_DIM +1; j++)
			dot_prod += (input_vec[j-1] - SV[rank%4][i][j]) * (input_vec[j-1] - SV[rank%4][i][j]);
		sum += SV[rank%4][i][0] * exp(-gamma*dot_prod);
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

void thread_function(int id)
{
	float gamma = 0.25;
	float rho = -0.495266;
	GLOB_SUM += compute_svm_sum(id, gamma, SV);

	//if(id==NUM_THREADS-1){
		GLOB_SUM -= rho;
		printf("gloabl sum = %f\n", GLOB_SUM);
		if(GLOB_SUM > 0)
			printf("CLASS is 1\n");
		else
			printf("CLASS is 0\n");
		GLOB_SUM = 0;
	//}
}

int main(int argc, char *argv[])
{
    int rank;
    int n_ranks;
	int i;
	int j;

	get_input();

	SV = (data_t***)malloc(NUM_THREADS*sizeof(data_t**));
	for (j = 0; j < NUM_THREADS; ++j)
	{
		SV[j] = (data_t**)malloc(MAX_EL*sizeof(data_t*));
		for(i=0; i<MAX_EL; i++)
			SV[j][i] = (data_t*)malloc((MAT_DIM+1)*sizeof(data_t));
	}

	for (i = 0; i < NUM_THREADS; ++i)
	{
		get_data(i, SV[i]);
	}

    //Start threads
    int thread_id;

	#ifdef DUMP
		m5_dump_stats(0, 0);
		m5_reset_stats(0, 0);
	#endif

    for (i = 0; i < NUM_INPUTS; ++i)
    {
        //for(thread_id=0; thread_id < NUM_THREADS; thread_id++){
            thread_function(0);
        //}

    }

	#ifdef DUMP
		m5_dump_stats(0, 0);
		m5_reset_stats(0, 0);
	#endif


  	for (i = 0; i < NUM_THREADS; ++i)
  	{
		free_data(SV[i]);
  	}
  	free(SV);


        return 0;
}
