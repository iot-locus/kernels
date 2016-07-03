arm-linux-gnueabi-g++ aes_mpi.c -I ../../lib -I ../../lib/m5 ../../lib/m5/m5op_arm.S --static -o aes
arm-linux-gnueabi-g++ svm_mpi.c -I ../../lib -I ../../lib/m5 ../../lib/m5/m5op_arm.S --static -o a_arm.out
arm-linux-gnueabi-g++ idle.c -I ../../lib -I ../../lib/m5 ../../lib/m5/m5op_arm.S --static -o idle
