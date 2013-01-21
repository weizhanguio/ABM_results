CC=icc
CFLAGS= -O2

FF=mpif90
FFLAGS= -O2 

app: stream2_mpi.f
	$(CC) $(CGLAGS) -c mysecond.c  
	$(FF) $(FFLAGS) -c stream2_mpi.f  -vec_report2
	$(FF) $(FFLAGS)  stream2_mpi.o mysecond.o -o app

clean:
	rm -f app  *.o   *.o*  
