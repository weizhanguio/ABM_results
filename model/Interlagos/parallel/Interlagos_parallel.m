% model for N=2M

clc;
clear all
C1=16000;    %16000/16=1000  stream2
C2=2*10^6;     %2M/16  =125000    stream2
C3=6*10^6;   %6M/16  = 375000    stream2
n=16
C1_all=C1*n;   
C2_all=C2*n;    
C3_all=C3*2;   
N1=C1/24;
N2=C2/24;
N3=C3/24;
N1_all=C1_all/24;
N2_all=C2_all/24;
N3_all=C3_all/24;


 BL1_all=16*21.5*10^9;     % 2*25.2    4*25.2      8*25.4      16*21.5
 BL2_all=16*18.8*10^9;     % 2*20.6    4*20.6      8*20.6      16*18.8 
 BL3_all=16*9.2*10^9;      % 2*9.6     4*9.6       8*9.4       16*9.2
 BM_all=71.8 *10^9;       % 2*7.5     4*7.5       8*6.8        71.8 
 N=200000;                                                   %71.8 app.o894662  2000000
 zhongpin=2.3*10^9;
 
 N1_all=N1*n;
 N2_all=N2*n
 N3_all=N3*4
 
 
 F=8*zhongpin;
 F_all=F*n;
 mpi=N1_all*(N1_all+1)*max(2/F_all,10/BL1_all) ...,
    + max( (N2_all-N1_all)*(N2_all+N1_all+1)* max(2/F_all,10/BL1_all),12*N1_all*(N2_all-N1_all)/BL1_all+6*(1+N2_all-N1_all)*(N2_all-N1_all)/BL2_all) ...,
     +max( (N3_all-N2_all)*(N3_all+N2_all+1)* max(2/F_all,10/BL1_all),12*N2_all*(N3_all-N2_all)/BL2_all+6*(1+N3_all-N2_all)*(N3_all-N2_all)/BL3_all) ...,
     +max(  (N-N3_all)*(N+N3_all+1)*max(2/F_all,10/BL1_all),12*N3_all*(N-N3_all)/BL3_all+6*(1+N-N3_all)*(N-N3_all)/BM_all )
 
openmp=N1_all*(N1_all+1)*max(2/F_all,10/BL1_all) ...,
     +(   (N2_all-N1_all)*(N2_all+N1_all+1)* max(2/F_all,max(10/BL1_all,6/BL2_all))  ) ...,
     +(   (N3_all-N2_all)*(N3_all+N2_all+1)*max(2/F_all,max(10/BL1_all,6/BL3_all)) ) ...,
     +((N-N3_all)*(N+N3_all+1)*max(2/F_all,max(10/BL1_all,6/BM_all)) )
 
  
 
mpi=N1_all*(N1_all+1)*max(2/F_all,10/BL1_all) ...,
    + max( (N2_all-N1_all)*(N2_all+N1_all+1)* max(2/F_all,10/BL1_all),12*N1_all*(N2_all-N1_all)/BL1_all+6*(1+N2_all-N1_all)*(N2_all-N1_all)/BL2_all) ...,
     +max( (N-N2_all)*(N+N2_all+1)* max(2/F_all,10/BL1_all),12*N2_all*(N-N2_all)/BL2_all+6*(1+N-N2_all)*(N-N2_all)/BL3_all) 
   
 openmp=N1_all*(N1_all+1)*max(2/F_all,10/BL1_all) ...,
     +(   (N2_all-N1_all)*(N2_all+N1_all+1)* max(2/F_all,max(10/BL1_all,6/BL2_all))  ) ...,
     +(  (N-N2_all)*(N+N2_all+1)*max(2/F_all,max(10/BL1_all,6/BL3_all)) ) 
     
  
 mpi=N1_all*(N1_all+1)*max(2/F_all,10/BL1_all) ...,
    + max( (N-N1_all)*(N+N1_all+1)* max(2/F_all,10/BL1_all),12*N1_all*(N-N1_all)/BL1_all+6*(1+N-N1_all)*(N-N1_all)/BL2_all) 
      
 openmp=N1_all*(N1_all+1)*max(2/F_all,10/BL1_all) ...,
     +(   (N-N1_all)*(N+N1_all+1)* max(2/F_all,max(10/BL1_all,6/BL2_all))  ) ...,
      
  
 
 
  