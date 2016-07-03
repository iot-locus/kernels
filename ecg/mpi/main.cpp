#include <stdio.h>
#include "fft.h"

#define SIZE 640

#define samplingrate 100
#define windowsize 8 //should be floor(samplingrate * 571 /1000)
#define filtervalue 4

//#define DUMP

#ifdef DUMP
#include "mpi.h"
#include <m5op.h>
#endif

#ifndef DUMP
#include <mpi/mpi.h>
#endif

#define TAG 0

complex *pSignal;

using namespace std;
#define NUM 16

//#define inputfile

int* peak_pos_all;
float* peak_val_all;

int numprocs, myid;
MPI_Status status;
MPI_Request request;

void init(complex* signal, int id)
{
    char filename[256] = {"input"};
    int fname_length = 4;

    filename[fname_length + 1] = '\0';

    FILE *fp = fopen(filename, "r");
    if(fp == NULL)
    {
        printf("\ncannot open file \"%s\".\n", filename);
        return;
    }

    float data;

#ifdef inputfile
    for(int i=0; i<SIZE*id; ++i)
    {
        fscanf(fp, "%f", &data);
    }
#endif

    for(int i=0; i<SIZE; ++i)
    {
#ifndef inputfile
        signal[i] = (((SIZE*id+i) % 10)+0.1) / 11.0;
#endif

#ifdef inputfile
        fscanf(fp, "%f", &data);
        signal[i] = data;
#endif
    }

    fclose(fp);
}

void filter(complex* signal)
{
    for(int i=0; i<SIZE*5/samplingrate; ++i)
    {
        signal[i] = 0;
    }

    for(int i=SIZE-SIZE*5/samplingrate; i<SIZE; ++i)
    {
        signal[i] = 0;
    }
}

void window(int *peak_position, float *peak_value, complex *signal)
{
    float max = 0;
    for(int i=0; i<SIZE/windowsize; ++i)
    {
        max = 0;
        peak_position[i] = i*windowsize + windowsize/2;
        for(int w=i*windowsize; w<(i+1)*windowsize; ++w)
        {
            if(signal[w].re() > max)
            {
                max = signal[w].re();
                peak_position[i] = w;
                peak_value[i] = max;
            }
        }
    }
}

void master(int id)
{
    //Apply FFT
    CFFT::Forward(pSignal, SIZE);

    //Filter transformed result
    filter(pSignal);

    //Inverse FFT
    CFFT::Inverse(pSignal, SIZE);

    //Detect peaks
    int* peak_pos = new int[SIZE/windowsize];
    float* peak_val = new float[SIZE/windowsize];
    window(peak_pos, peak_val, pSignal);

    //Transfer position data
    if(id == 0)
    {
        for(int x=0; x<SIZE/windowsize; ++x)
        {
            peak_pos_all[x] = peak_pos[x];
        }
        for(int x=1; x<NUM; ++x)
        {
            MPI_Recv(&peak_pos_all[x*(SIZE/windowsize)], SIZE/windowsize, MPI_INT, x, 0, MPI_COMM_WORLD, &status);
        }
    }
    else
    {
        MPI_Send(peak_pos, SIZE/windowsize, MPI_INT, 0, 0, MPI_COMM_WORLD);
    }

    //Transfer value data
    if(id == 0)
    {
        for(int x=0; x<SIZE/windowsize; ++x)
        {
            peak_val_all[x] = peak_val[x];
        }
        for(int x=1; x<NUM; ++x)
        {
            MPI_Recv(&peak_val_all[x*(SIZE/windowsize)], SIZE/windowsize, MPI_FLOAT, x, 0, MPI_COMM_WORLD, &status);
        }
    }
    else
    {
        MPI_Send(peak_val, SIZE/windowsize, MPI_FLOAT, 0, 0, MPI_COMM_WORLD);
    }
}

int main(int argc, char **argv)
{
    MPI_Init(&argc, &argv);/* MPI programs start with MPI_Init; all 'N' processes exist thereafter */
    MPI_Comm_size(MPI_COMM_WORLD, &numprocs);/* find out how big the SPMD world is */
    MPI_Comm_rank(MPI_COMM_WORLD, &myid);/* and this process' rank is */

    //Allocate memory for signal data
    pSignal = new complex[SIZE];
    peak_pos_all = new int[NUM*SIZE/windowsize];
    peak_val_all = new float[NUM*SIZE/windowsize];

    //Fill signal array with data
    init(pSignal, myid);

    if(myid == NUM-1)
    {
        cout<<"================= ECG R peak detection=============="<<endl;
    }

    MPI_Barrier(MPI_COMM_WORLD);

    if(myid == 0)
    {
#ifdef DUMP
        m5_dump_stats(0, 0);
        m5_reset_stats(0, 0);
#endif
    }

    //For different MPI processes
    master(myid);

    if(myid == 0)
    {
#ifdef DUMP
        m5_dump_stats(0, 0);
        m5_reset_stats(0, 0);
#endif
    }

    MPI_Barrier(MPI_COMM_WORLD);

/*
    if(myid == 0){
        for(int i=0; i<NUM*SIZE/windowsize; ++i)
        {
            if(peak_val_all[i] > filtervalue || peak_val_all[i] < -filtervalue)
                peak_val_all[i] = 0;
            printf("[%d]=%.2f; ", i, peak_val_all[i]);
        }
        printf("\n");
    }
*/

    MPI_Barrier(MPI_COMM_WORLD);
    MPI_Finalize();

    return 0;
}
