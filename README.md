# iot-kernels-locus
A set of representative kernels in iot domain, used for evaluation of LOCUS architecture [1].

| Category        | Kernel           | Communication pattern  |
| ------------- |:-------------:| -----:|
| Pattern maching| DTW | pipelined |
| Navigation      | A Star      |   scatter-gather |
| Health monitoring | ECG R-peaks detection   |    scatter-gather |
| Encrytion | AES encrypt   |    pipelined |
| Encrytion | AES decrypt   |    pipelined |
| Image processing | Histogram   |    scatter-gather |
| Image processing | 2D convolution   |    none |
| Machine learning | SVM   |    scatter-gather |
| Compression | DWT   |    none |

The DTW (Dynamic Time Warping) is an algorithm for measuring similarity between two temporal sequences which may vary in speed. DTW has been applied to temporal sequences of video, audio, and graphics data — indeed, any data which can be turned into a linear sequence can be analyzed with DTW. A well known application has been automatic speech recognition, to cope with different speaking speeds. Other applications include speaker recognition and online signature recognition. Also it is seen that it can be used in partial shape matching application [2]. A specific variant of parallel DTW enabling higher parallelism [3] is implemented here. A star search algorithm is typically used as a navigation kernel and we implement a parallel version [4]. Personal health monitoring systems can offer a cost-effective healthcare solution and the electrocardiogram delineation is a typical and essential application in this domain. We implement a simple parallel R-peak detection kernel [5] for our evaluation. Encryption/Decryption is another frequently used kernel in wearables for secure data communications. Image processing is increasingly applied in wearable devices, especially augmented reality glasses. Kernels like 2D Convolution and Histogram are used in such scenarios for sharpening, smoothening and enhancing images. Note that the 2D Convolution is implementated based on the one in polybench benchmark [6]. As wearable devices have limited storage, sensor data needs to be compressed before storage. We use the Haar transform variant of Discrete Wavelet Transform for compressing sensor data. Note that this kernel is simplified as 1-dimension fasion based on the implementation in the rodinia benchmark [7]. We also implement a Support Vector Machine (SVM) kernel as wearable devices are extensively used for classifying patterns based on sensor data. All the workloads are manually parallelized both for pthread and MPI standard. We define pipeline communication pattern as one where a core receives data from a previous core before processing (i.e., producer-consumer relationship). In scatter-gather communication pattern, one core works as the master to launch processing tasks onto the other cores, then collect the data from them at the end. The 2D Convolution and Haar transform kernels do not have communications between threads. The input data for all the kernels are included inside the source code or generated during initialization. We also provide the seperate input file for a part of them.

# Compilation

The compilation command is written up as a bash file locating inside each kernel's folder. For instance, the MPI version of DTW can be compiled as executable for x86 architecture simulated in gem5 using [compile_gem5.sh] (https://github.com/tancheng/iot-kernels-locus/blob/master/dtw/pthread/compile_gem5.sh); for LOCUS (ARM ISA-based) using [compile_gem5.sh](https://github.com/tancheng/iot-kernels-locus/blob/master/dtw/mpi/compile_gem5.sh); for x86 architecture with standard MPI using [compile.sh](https://github.com/tancheng/iot-kernels-locus/blob/master/dtw/mpi/compile.sh)

# Usage

LMPI library is used to perform the communication among different processes in each kernel. The LMPI API is consistent with the Message Passing Interface (MPI) standard like MPICH, which means the application developped using MPICH can also run on our architecture (LOCUS) by just replacing the header file. The LMPI API implementation can be found [here] (https://github.com/tancheng/iot-kernels-locus/blob/master/lib/mpi.h).

# Citation

If you use this kernel suit or the LOCUS architecture in your work, we would appreciate if you cite the LOCUS paper:

    @inproceedings{cheng2016locus,
      author    = {Tan, Cheng and Kulkarni, Aditi and Venkataramani, Vanchinathan and Karunaratne, Manupa and Mitra, Tulika and Peh, Li-Shiuan},
      title     = {LOCUS: Low-Power Customizable Many-Core Architecture for Wearables},
      booktitle = {Compilers, Architecture and Synthesis for Embedded Systems (CASES), 2016 International Conference on},
      year      = {2016},
      organization={IEEE}
    }

# References

[1] Cheng Tan and et al. `LOCUS: Low-Power Customizable Many-Core Architecture for Wearables.` In International Conference on Compilers, Architecture and Synthesis for Embedded Systems (CASES), 2016.

[2] https://en.wikipedia.org/wiki/Dynamic_time_warping

[3] M. Muller. `Dynamic time warping in information retrieval for music and motion`, 2007.

[4] Cvetanovic, Z., and C. Nofsinger. `Parallel Astar search on message-passing architectures.` System Sciences, 1990., Proceedings of the Twenty-Third Annual Hawaii International Conference on. Vol. 1. IEEE, 1990.

[5] http://www.librow.com/cases/case-2

[6] Pouchet, Louis-Noël. `Polybench: The polyhedral benchmark suite.` (2012)
http://www.cs.ucla.edu/pouchet/software/polybench

[7] http://www.cs.virginia.edu/~skadron/wiki/rodinia/index.php/Rodinia:Accelerating_Compute-Intensive_Applications_with_Accelerators
