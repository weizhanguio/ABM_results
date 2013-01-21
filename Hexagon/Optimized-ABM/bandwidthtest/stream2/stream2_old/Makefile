CC=cc
CFLAGS= -O2 

FF=ftn
FFLAGS= -O2 

app: stream2_new.f
	$(CC) $(CFLAGS)  -c mysecond.c -h msgs -h vector2
	$(FF) $(FFLAGS) -c  stream2_new.f  -O vector2 -h msgs  
	$(FF) $(FFLAGS)  stream2_new.o mysecond.o -o app  -O vector2   -h msgs

clean:
	rm -f app  *.o    *.e*  *.o* 
