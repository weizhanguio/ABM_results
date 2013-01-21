% performance models(serial) N=20 000, 40 000, 1M,2M
% N=20 0000 and 40 0000 are located in L3 cache

clc;
clear all
C1=16000;   %16000/16=1000  stream2
C2=2*10^6;     %2M/16  =125000    stream2
C3=6*10^6;   %6M/16  = 375000    stream2
N1=C1/24
N2=C2/24
N3=C3/24
BL1=26.6*10^9;
BL2=20.4*10^9;
BL3=9.8*10^9;
BM=7.6*10^9;   
N=4000000; 

zhongpin=2.3*10^9;
F=8*zhongpin;

%   N =1M or 2M
   baseline=N1*(N1+1)*max(2/F,16/BL1)+(   (N2-N1)*(N2+N1+1)*max(2/F,16/BL2) )+(  (N3-N2)*(N3+N2+1)*max(2/F,16/BL3) )+((N-N3)*(N+N3+1)*max(2/F,16/BM) )
  
 loopfusion=N1*(N1+1)*max(2/F,12/BL1)+(   (N2-N1)*(N2+N1+1)*max(2/F,12/BL2) )+(  (N3-N2)*(N3+N2+1)*max(2/F,12/BL3) )+((N-N3)*(N+N3+1)*max(2/F,12/BM) )
   
   tb=N1*(N1+1)*max(2/F,10/BL1)+(   (N2-N1)*(N2+N1+1)* max(2/F,max(10/BL1,6/BL2))  )+(  (N3-N2)*(N3+N2+1)*max(2/F,max(10/BL1,6/BL3)) )+((N-N3)*(N+N3+1)*max(2/F,max(10/BL1,6/BM)) )

   forwardback=N1*(N1+1)*max(2/F,12/BL1)+( max((N2-N1)*(N2+N1+1)*2/F,24*N1*(N2-N1)/BL1+12*(1+N2-N1)*(N2-N1)/BL2)) ...,
       +( max((N3-N2)*(N3+N2+1)*2/F, 24*N2*(N3-N2)/BL2+12*(1+N3-N2)*(N3-N2)/BL3 ) ) ...,
       + max( (N-N3)*(N+N3+1)*2/F,(24*N3*(N-N3)/BL3+12*(1+N-N3)*(N-N3)/BM))    
   
   
   tbfb=N1*(N1+1)*max(2/F,10/BL1)+  max( (N2-N1)*(N2+N1+1)* max(2/F,10/BL1),12*N1*(N2-N1)/BL1+6*(1+N2-N1)*(N2-N1)/BL2) ...,
       +max(  (N3-N2)*(N3+N2+1)*max(2/F,10/BL1),12*N2*(N3-N2)/BL2+6*(1+N3-N2)*(N3-N2)/BL3) ...,
       +max((N-N3)*(N+N3+1)*max(2/F,10/BL1),12*N3*(N-N3)/BL3+6*(1+N-N3)*(N-N3)/BM )
 




%N=400 000, 200 000   
    baseline=N1*(N1+1)*max(2/F,16/BL1)+(   (N2-N1)*(N2+N1+1)*max(2/F,16/BL2) )+(  (N-N2)*(N+N2+1)*max(2/F,16/BL3) )%+((N-N3)*(N+N3+1)*max(2/F,16/BM) )
  
 loopfusion=N1*(N1+1)*max(2/F,12/BL1)+(   (N2-N1)*(N2+N1+1)*max(2/F,12/BL2) )+(  (N-N2)*(N+N2+1)*max(2/F,12/BL3) )%+((N-N3)*(N+N3+1)*max(2/F,12/BM) )
   
   tb=N1*(N1+1)*max(2/F,10/BL1)+(   (N2-N1)*(N2+N1+1)* max(2/F,max(10/BL1,6/BL2))  )+(  (N-N2)*(N+N2+1)*max(2/F,max(10/BL1,6/BL3)) )%+((N-N3)*(N+N3+1)*max(2/F,max(10/BL1,6/BM)) )

   forwardback=N1*(N1+1)*max(2/F,12/BL1)+( max((N2-N1)*(N2+N1+1)*2/F,24*N1*(N2-N1)/BL1+12*(1+N2-N1)*(N2-N1)/BL2)) ...,
       +( max((N-N2)*(N+N2+1)*2/F, 24*N2*(N-N2)/BL2+12*(1+N-N2)*(N-N2)/BL3 ) ) ...,
       %+ max( (N-N3)*(N+N3+1)*2/F,(24*N3*(N-N3)/BL3+12*(1+N-N3)*(N-N3)/BM))    
   
   
   tbfb=N1*(N1+1)*max(2/F,10/BL1)+  max( (N2-N1)*(N2+N1+1)* max(2/F,10/BL1),12*N1*(N2-N1)/BL1+6*(1+N2-N1)*(N2-N1)/BL2) ...,
       +max(  (N-N2)*(N+N2+1)*max(2/F,10/BL1),12*N2*(N-N2)/BL2+6*(1+N-N2)*(N-N2)/BL3) ...,
       %+max((N-N3)*(N+N3+1)*max(2/F,10/BL1),12*N3*(N-N3)/BL3+6*(1+N-N3)*(N-N3)/BM )
  
  
 
