CC=icc
CFLAGS= -O2 

FF=ifort
FFLAGS= -O2

app: stream2.f
	$(CC) $(CFLAGS)  -c mysecond.c -vec-report2 
	$(FF) $(FFLAGS) -c stream2.f  -vec_report2 
	$(FF) $(FFLAGS)  stream2.o mysecond.o -o app -vec_report2 

clean:
	rm -f app  *.o    *.e*  *.o*   *.out 
