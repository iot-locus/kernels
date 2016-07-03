#include <stdio.h>
#include <stdlib.h>
#include <m5op.h>
#define default_num_cores 16
#define MPI_COMM_WORLD 0
#define MPI_Comm 0
#define MPI_STATUS_IGNORE 0
#define MPI_Datatype int
#define MPI_Op int
#define MPI_MAX 1
#define MPI_MIN 2
#define MPI_SUM 3
#define MPI_DOUBLE sizeof(double)
#define MPI_FLOAT sizeof(float)
#define MPI_INT sizeof(int)
#define MPI_Status int
#define MPI_Request int

#define MPI_Barrier(COMM) m5_barrier()

#define Default_send_reg 1
#define Default_recv_reg 2
#define m5_opt_send() asm(".word   0xee5c0110")
#define m5_opt_recv() asm(".word   0xee5d0110": "=r" (*buff) : )
#define m5_opt_set_send() asm(".word   0xee5e0110")
#define m5_opt_set_recv() asm(".word   0xee5f0110")

int myRank = 9999;

uint8_t* mpi_buff[default_num_cores];

int MPI_Init(int*args, char***argv)
{
    int i = 0;
    for(i=0; i<default_num_cores; ++i)
    {
        mpi_buff[i] = (uint8_t*)malloc(1000);
        m5_mpi_init(i, mpi_buff[i]);
    }
    return 0;
}

int MPI_Comm_size(int arg, int *numprocs)
{
	*numprocs = default_num_cores;
	return 0;
}

int MPI_Comm_rank(int arg, int *myid)
{
	if(myRank == 9999)
	{
		*myid = m5_asgn();
		myRank = *myid;
	}
	else
	{
		*myid = myRank;
	}
	return 0;
}

inline void MPI_Send(int* buff, int totalcount, int unitsize, 
                int dest_coreID, int TAG, int arg) __attribute__((always_inline));

inline void MPI_Send(int* buff, int totalcount, int unitsize, 
                int dest_coreID, int TAG, int arg)
{
/*    asm(
        "LOOP_SEND:  ldr     r2, [r0]\n\t"
                ".word  0xee5c0110\n\t"
                "add    r0, r0, #4\n\t"
                "subs   r1, r1, #1\n\t"
                "bne    LOOP_SEND\n\t"
    );
*/

    dest_coreID = (dest_coreID << 6 ) | 0xf0000000;
    int* dest = (int*)dest_coreID;
//    int tmp;
    __asm__ __volatile__(
                    "1:\n\tldr\tr8, [%[buff]]\n"
                    "\tstr\tr8, %[dest]\n"
                    "\tadd\t%[buff], %[buff], #4\n"
                    "\tsubs\t%[totalcount], %[totalcount], #1\n"
                    "\tbne\t1b"
                    :[dest]"=m"(*dest), [buff]"+r"(buff), [totalcount]"+r"(totalcount)
                    ://[value]"r"(*buff)//[tmp]"r"(tmp)//, "r"(totalcount)
                    :"memory","cc"
    );

}

inline void MPI_Recv(int* buff, int totalcount, int unitsize, int src_coreID, int TAG, int arg, int* stat) __attribute__((always_inline));

inline void MPI_Recv(int* buff, int totalcount, int unitsize, int src_coreID, int TAG, int arg, int* stat)
{

    src_coreID = (src_coreID << 6 ) | 0xf0000000;
    int* src = (int*)src_coreID;
    while(totalcount){
        __asm__ __volatile__(
                    "\tldr\tr8, %[src]\n"
                    "\tstr\tr8, [%[buff]]\n"
                    "\tadd\t%[buff], %[buff], #4\n"
                    "\tsub\t%[totalcount], %[totalcount], #1\n"
//                    "       cmp    %[totalcount], #0\n"
//                    "       bne     2b"
                    :[buff]"+r"(buff), [totalcount]"+r"(totalcount)
                    :[src]"m"(*src)//[tmp]"r"(tmp)//, "r"(totalcount)
                    :"memory", "cc"
        );
    }
/*
    asm(
        "LOOP_RECV:  .word   0xee5d0110\n\t"
                "str    r2, [r0]\n\t"
                "add    r0, r0, #4\n\t"
                "subs   r1, r1, #1\n\t"
                "bne    LOOP_RECV\n\t"
    );
*/
    /*
    m5_opt_set_recv();
	while(totalcount > 0)
	{
        m5_opt_recv();
        // *buff = (int)(mpi_buff[src_coreID][m5_recv_index(src_coreID)]);
        //std::memcpy(buff, mpi_buff[src_coreID]+m5_recv_index(src_coreID), sizeof(unitsize));
        //asm(    "ldr %0, [r1]"
        //    : "=r" (*buff) :
        //);
		++buff;
		--totalcount;
	}
    */
//	return 0;
}

#define MPI_Irecv(buf, count, datatype, source, tag, comm, request) MPI_Recv(buf, count, datatype, source, tag, comm, request)

int MPI_Bcast(int* buf, int totalcount, int unitsize, int root, int arg) __attribute__((always_inline)); 
/*int MPI_Bcast(int* buf, int totalcount, int unitsize, int root, int arg) 
{
    int i = 0;
    while(i < totalcount) 
    {
        if (myRank == root) 
        {
            for(int dest = 0; dest<default_num_cores; ++dest)
            {
                if(dest!=root)
                    MPI_Send(buf+i, 1, unitsize, dest, 0, arg); 
            }
        } else {
            MPI_Recv(buf+i, 1, unitsize, root, 0, arg, 0);
        }
        ++i;
    }
	return 0;
}
*/

int MPI_Scatter(int* send_buf, int send_totalcount, int send_unitsize,
            int* recv_buf, int recv_totalcount, int recv_unitsize,
            int root, int COMM)
{
	int world_rank;
        MPI_Comm_rank(COMM, &world_rank);
        int world_size;
        MPI_Comm_size(COMM, &world_size);

        if (world_rank == root)
        {
                // If I am the root process, send our data to everyone
                int i;
                for (i = 0; i < world_size; i++)
                {
                        if (i != root)
                        {
                                MPI_Send(send_buf+i*(send_totalcount), send_totalcount, send_unitsize, i, 0, 0);
                        }
                }
		int temp = 0;
		while (recv_totalcount>0)
		{
			*(recv_buf+temp) = *(send_buf+root+temp);
			++temp;
			--recv_totalcount;
			
		}
        } else
        {
                // If we are receiver processes, receive the data from the root
                MPI_Recv(recv_buf, recv_totalcount, recv_unitsize, root, 0, 0, 0);
        }
	return 0;
}

int MPI_Gather(int* send_buf, int send_totalcount, int send_unitsize,
           int* recv_buf, int recv_totalcount, int recv_unitsize,
           int root, int COMM)
{
	int world_rank;
        MPI_Comm_rank(COMM, &world_rank);
        int world_size;
        MPI_Comm_size(COMM, &world_size);

        if (world_rank == root) 
        {  
                // If I am the root process, receive data from everyone else
                int i;
                for (i = 0; i < world_size; i++)
                {
                        if (i != root)
                        {
                                MPI_Recv(recv_buf+i*(recv_totalcount), recv_totalcount, recv_unitsize, i, 0, 0, 0);
                        }
                }
                int temp = 0;
                while (recv_totalcount>0)
                {
                        *(recv_buf+temp) = *(send_buf+root+temp);
                        ++temp;
                        --recv_totalcount;
                }
        } 
	else
        {
                // If we are sender processes, send the data to the root
		MPI_Send(send_buf, send_totalcount, send_unitsize, root, 0, 0);
        }
	return 0;
}

int MPI_Wait(MPI_Request *request, MPI_Status *status)
{
	return 0;	
}

int MPI_Reduce(int *send_buf, int *recv_buf, int total_count, MPI_Datatype datatype, MPI_Op op, int root, int COMM)
{
    //printf("\nMPI_Reduce(int) on core %d is called\n", myRank);
	int temp_count = total_count;

	if (myRank == root)
	{
		// If I am the root process, receive data from everyone else
		int i;
		int temp_buf[default_num_cores];
		while(temp_count > 0)
		{
			temp_buf[root] = *(send_buf+total_count-temp_count);
			for (i = 0; i < default_num_cores; i++)
			{
				if (i != root)
				{
						MPI_Recv(temp_buf+i, 1, datatype, i, 0, 0, 0);
				}
			}
			recv_buf[total_count - temp_count] = temp_buf[0];
			for( i=1; i< default_num_cores; ++i)
			{
				if(op == MPI_MAX)
				{
					if(temp_buf[i] > recv_buf[total_count-temp_count])
					{
						recv_buf[total_count-temp_count] = temp_buf[i];	
					}
				}
				else if(op == MPI_MIN)
				{
					if(temp_buf[i] < recv_buf[total_count-temp_count])
					{
						recv_buf[total_count-temp_count] = temp_buf[i];	
					}
				}
				else if(op == MPI_SUM)
				{
					recv_buf[total_count-temp_count] += temp_buf[i];	
				}
			}
			--temp_count;
		}
	}
	else
	{
		temp_count = total_count;
		while(temp_count)
		{				
			// If we are sender processes, send the data to the root
			MPI_Send(send_buf+(total_count-temp_count), 1, datatype, root, 0, 0);
			--temp_count;
		}
	}
	return 0;
}

int MPI_Allreduce(int *send_buf, int *recv_buf, int total_count, MPI_Datatype datatype, MPI_Op op, int COMM)
{
	int world_rank;
	MPI_Comm_rank(COMM, &world_rank);
	int world_size;
	MPI_Comm_size(COMM, &world_size);
	int temp_count = total_count;

	int root = 0;
	if (world_rank == root)
	{
		// If I am the root process, receive data from everyone else
		int temp_buf[default_num_cores];
		int i;
		while(temp_count > 0)
		{
			temp_buf[root] = *(send_buf+total_count-temp_count);
			for (i = 0; i < world_size; i++)
			{
				if (i != root)
				{
					MPI_Recv(temp_buf+i, 1, datatype, i, 0, 0, 0);
				}
			}
			recv_buf[total_count - temp_count] = temp_buf[0];
			for( i=1; i< world_size; ++i)
			{
				if(op == MPI_MAX)
				{
					if(temp_buf[i] > recv_buf[total_count-temp_count])
					{
						recv_buf[total_count-temp_count] = temp_buf[i];	
					}
				}
				else if(op == MPI_MIN)
				{
					if(temp_buf[i] < recv_buf[total_count-temp_count])
					{
						recv_buf[total_count-temp_count] = temp_buf[i];	
					}
				}
				else if(op == MPI_SUM)
				{
					recv_buf[total_count-temp_count] += temp_buf[i];	
				}
			}
			for( i=0; i<world_size; ++i)
			{
				if(i!=root)
				{
					MPI_Send(recv_buf+(total_count-temp_count), 1, datatype, i, 0, 0);
				}
			}
			--temp_count;
		}
	}
	else
	{
		temp_count = total_count;
		while(temp_count)
		{				
			// If we are sender processes, send the data to the root
			MPI_Send(send_buf+(total_count-temp_count), 1, datatype, root, 0, 0);
			MPI_Recv(recv_buf+(total_count-temp_count), 1, datatype, root, 0, 0, 0);
			--temp_count;
		}
	}
	return 0;
}

int MPI_Alltoall(int *send_buf, int sendcount, MPI_Datatype sendtype, int *recv_buf, int recvcount, MPI_Datatype recvtype, int COMM)
{
	int world_rank;
	MPI_Comm_rank(COMM, &world_rank);
	int world_size;
	MPI_Comm_size(COMM, &world_size);

	//Send our data to everyone
	int i;

//tancheng: set Barrier here to gurantee the correct value:
MPI_Barrier(COMM);

	for (i = 0; i < world_size; i++)
	{
		if (i != world_rank)
		{
			MPI_Send(send_buf+i*sendcount, sendcount, sendtype, i, 5, 0);
		}
	}
	int temp = 0;
	while (recvcount-temp>0)
	{
		recv_buf[world_rank*recvcount+temp] = send_buf[world_rank*sendcount+temp];
		++temp;
	}
	for(i=0; i<world_size; ++i)
	{
		if(i != world_rank)
		{
			//Receive the data from the root
			MPI_Recv(recv_buf+i*recvcount, recvcount, recvtype, i, 5, 0, 0);
		}
	}
MPI_Barrier(COMM);
	return 0;
}

int MPI_Alltoallv(int *send_buf, int*sendcount, int*send_displ, MPI_Datatype sendtype, int *recv_buf, int*recvcount, int*recv_displ, MPI_Datatype recvtype, int COMM)
{
	int world_rank;
	MPI_Comm_rank(COMM, &world_rank);
	int world_size;
	MPI_Comm_size(COMM, &world_size);

	//Send our data to everyone
	int i;
MPI_Barrier(COMM);
	for (i = 0; i < world_size; i++)
	{
		if (i != world_rank)
		{
			MPI_Send(send_buf+send_displ[i], sendcount[i], sendtype, i, 2, 0);
		}
	}
	int temp = 0;
	while (recvcount[world_rank]-temp>0)
	{
		*(recv_buf+recv_displ[world_rank]+temp) = *(send_buf+send_displ[world_rank]+temp);
		++temp;
	}
	for(i=0; i<world_size; ++i)
	{
		if(i != world_rank)
		{
			//Receive the data from the other
			MPI_Recv(recv_buf+recv_displ[i], recvcount[i], recvtype, i, 2, 0, 0);
		}
	}
	return 0;
}

int MPI_Finalize()
{
	return 0;
}

