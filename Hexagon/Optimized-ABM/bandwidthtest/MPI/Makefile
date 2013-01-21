CC=cc
CFLAGS= -O2

FF=ftn
FFLAGS= -O2 

app: stream2_mpi.f
	$(CC) $(CGLAGS) -c mysecond.c
	$(FF) $(FFLAGS) -c stream2_mpi.f -vec_report2
	$(FF) $(FFLAGS)  stream2_mpi.o mysecond.o -o app -vec_report2

clean:
	rm -f app  *.o   *.e*  *.o*
