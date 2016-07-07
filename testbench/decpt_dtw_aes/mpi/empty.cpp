#include <stdlib.h>
#include <iostream>
#include <vector>

#define DUMP

#ifdef DUMP
#include "mpi.h"
#include <m5op.h>
#endif

#ifndef DUMP
#include <mpi/mpi.h>
#endif

#define TAG 0
using namespace std;

//#define SIZE 513
//#define SIZE 1025
#define SIZE 101
#define NUM 10

int S[SIZE];
//int *S;
int T[SIZE];
//int *T;
int DTW[SIZE+1][(SIZE-1)/NUM+2];

int numprocs, myid;
MPI_Status status;
MPI_Request request;

int minimum(int a, int b, int c)
{
	int min = 65536;
	if(a<b)
	{
		min = a;	
	}else{
		min = b;	
	}
	if(min>c)
	{
		min = c;
	}
	return min;
}

int minimum(int a, int b)
{
	int min = 65536;
	if(a<b)
	{
		min = a;	
	}else{
		min = b;	
	}
	return min;
}

int maximum(int a, int b, int c)
{
	int max = 0;
	if(a<b)
	{
		max = b;	
	}else{
		max = a;	
	}
	if(max<c)
	{
		max = c;
	}
	return max;
}

int maximum(int a, int b)
{
	int max = 0;
	if(a<b)
	{
		max = b;	
	}else{
		max = a;	
	}
	return max;
}

int absolute(int v)
{
    if(v<0)
    {
        v = -v;    
    }
    return v;
}

void output()
{
	for(int i=SIZE;i<SIZE+1;++i)
	{
        cout<<"["<<i<<"] ";
		for(int j=(SIZE-1)/NUM;j<(SIZE-1)/NUM+2;++j)
		{
            cout<<DTW[i][j]<<"\t";
		}
		cout<<endl;
	}
}

void get_data(int len, int **sa, int **ta)
{
    char filename_std[256] = {"input_dtw/input_std"};
    char filename_smp[256] = {"input_dtw/input_smp"};
    int base_fname_length = 18;

//    char rank_str[20];
//    sprintf(rank_str, "%d", rank);

//    for(i = 0; rank_str[i] != '\0'; i++)
//        filename[base_fname_length + i] = rank_str[i];
    filename_std[base_fname_length + 1] = '\0';

    FILE *fp = fopen(filename_std, "r");
    if(fp == NULL)
    {
        printf("\ncannot open file \"%s\".\n", filename_std);
        exit(1);
    }

    int *data = (int*)malloc(sizeof(int) * len);
    int length = len;
    int *p = data;
    float t = 0;
    float ign = 0;
    while (len--) {
        fscanf(fp, "%f,%f", &t, &ign);
        *p = (int)t;
//        printf("core %d std value read = %d\n", rank, *p);
        //scanf("%f", p);
        //scanf("%" DATA_FMT, p);
        p++;
    }
    fclose(fp);
    *sa = data;

    fp = fopen(filename_smp, "r");
    if(fp == NULL)
    {
        printf("\ncannot open file \"%s\".\n", filename_smp);
        exit(1);
    }
    len = length;
    data = (int*)malloc(sizeof(int) * len);
    p = data;
    t = 0;
    ign = 0;
    while (len--) {
        fscanf(fp, "%f,%f", &t, &ign);
        *p = (int)t;
        //scanf("%f", p);
        //scanf("%" DATA_FMT, p);
//        printf("core %d smp value read = %d\n", rank, *p);
        p++;
    }
    fclose(fp);
    *ta = data;
}

void initialize(int id)
{
	int temp_s[SIZE];// = {1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7};
	for(int i=0;i<SIZE;++i)
	{
		temp_s[i] = i+1;	
	}
//	if(myid == 0)
//		cout <<"S:\t";
	for(int i=0;i<SIZE;++i)
	{
		S[i] = temp_s[i];	
//		if(myid == 0)
//			cout << temp_s[i] << "\t";
	}
	int temp_t[SIZE];// = {2,3,4,5,6,7,8,9,11,3,4,5,6,7,8,9,10};
	for(int i=0; i<SIZE; ++i)
	{
		temp_t[i] = i+3;	
	}
//	if(myid == 0)
//		cout <<"\nT:\t";
	for(int j=0;j<SIZE;++j)
	{
		T[j] = temp_t[j];	
//		if(myid == 0)
//			cout << temp_t[j] << "\t";
	}

//    get_data(SIZE, &S, &T);
	if(id == 0)
	{
		for(int i=1; i<SIZE+1; ++i)
		{
				DTW[i][0] = 65536;
				DTW[i][1] = 65536;
		}
		cout << "\n-------------------------------------------------------" << endl;
	}

    int j = ((SIZE-1)/NUM) * (id%NUM) + 1;
    for(int x=1; x<(SIZE-1)/NUM+2; ++x)
    {
        DTW[0][x] = 65536; 
    }
    if(j == 1)
    {
        DTW[0][0] = 0;
        DTW[1][0] = 65536;
    }else{
        DTW[0][0] = 65536;
        DTW[1][0] = absolute(S[0] - T[j-2]);
    }
    for(int x=1; x<(SIZE-1)/NUM+2; ++x)
    {
        DTW[1][x] = absolute(S[0] - T[j+x-2]);
    }
    
}

void DTWVariation(int id, int base)
{
	int cost[(SIZE-1)/NUM];
	int j = ((SIZE-1)/NUM) * id + 1;
    int tmp[2];

    //m5_opt_set_send(id+1, 1, MPI_INT);

    for(int i=1; i<SIZE; ++i)
    {
        for(int x=0; x<(SIZE-1)/NUM; ++x)
        {
            cost[x] = absolute(S[i]-T[j+x]);    
        }

//        if(((i-1)%20) == 0)
//            MPI_Barrier(MPI_COMM_WORLD);
        if(id != 0)
        {
            MPI_Recv(&DTW[i+1][0], 2, MPI_INT, id-1 + base, 0, MPI_COMM_WORLD, &status);
        }
        else
        {
            MPI_Recv(tmp, 2, MPI_INT, id-1 + base, 0, MPI_COMM_WORLD, &status);
        }

        int x;
        for(x=0; x<(SIZE-1)/NUM; ++x)
        {
            DTW[i+1][x+2] = cost[x] + minimum(DTW[i-1][x+1], DTW[i][x+1], DTW[i][x]);
        }

        /*
        DTW[i+1][x+2] = cost[x] + minimum(DTW[i-1][x+1], DTW[i][x+1], DTW[i][x]);
        m5_opt_send();
        ++x;
        DTW[i+1][x+2] = cost[x] + minimum(DTW[i-1][x+1], DTW[i][x+1], DTW[i][x]);
        m5_opt_send();
        */

        if(id != NUM-1)
        {
            MPI_Send(&DTW[i+1][(SIZE-1)/NUM], 2, MPI_INT, id+1 + base, 0, MPI_COMM_WORLD);
        }
        if(((i-1)%20) == 0)
            MPI_Barrier(MPI_COMM_WORLD);
    }
}

int main(int argc, char **argv)
{
	MPI_Init(&argc, &argv);/* MPI programs start with MPI_Init; all 'N' processes exist thereafter */
	MPI_Comm_size(MPI_COMM_WORLD, &numprocs);/* find out how big the SPMD world is */
	MPI_Comm_rank(MPI_COMM_WORLD, &myid);/* and this process' rank is */
    int base = 6;
	initialize(myid - base);

	if(myid == base)
	{
        cout<<"================= DTW variation=============="<<endl;
    }
    else
    {
        cout<<"core id = "<<myid<<" inited for dtw..."<<endl;    
    }
	MPI_Barrier(MPI_COMM_WORLD);

	if(myid == 0)
	{
#ifdef DUMP
		m5_dump_stats(0, 0);
		m5_reset_stats(0, 0);
#endif
	}

//	MPI_Barrier(MPI_COMM_WORLD);

	DTWVariation(myid-base, base);

	if(myid == numprocs-1)
	{
#ifdef DUMP
		m5_dump_stats(0, 0);
		m5_reset_stats(0, 0);
#endif
	}

//	MPI_Barrier(MPI_COMM_WORLD);
    
	if(myid == numprocs-1){
		cout << "-------------------- focus the last column ---------------------" << endl;
		output();
	}

//	MPI_Barrier(MPI_COMM_WORLD);
	return 0;
}
