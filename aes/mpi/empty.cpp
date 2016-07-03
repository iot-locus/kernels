#include <mpi.h>
#include<m5op.h>

int main(int argc, char *argv[])
{
    int rank;
    int size;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    int value = 0;

    MPI_Barrier(MPI_COMM_WORLD);

    if(rank != size -1)
        MPI_Send(&value, 1, MPI_INT, rank + 1, 0, MPI_COMM_WORLD);

    if(rank >6)
        MPI_Recv(&value, 1, MPI_INT, rank - 1, 0, MPI_COMM_WORLD, 0);

    for(int n = 0; n < 1000; n++)
    {
        if(n%7 == 0)
            MPI_Barrier(MPI_COMM_WORLD);
    }

    MPI_Barrier(MPI_COMM_WORLD);

    MPI_Finalize();

    return 0;
}
