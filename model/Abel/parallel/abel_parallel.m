% model for N=2M

clc;
clear all
n=2;
C1=32000;   %32000/16=2000  stream2
C2=256000;   %256000/16=16000  stream2
C3=20*10^6;   %20M/16  =1.25M    stream2
C1_all=C1*n;   %32000/16=2000  stream2
C2_all=C2*n;   %256000/16=16000  stream2
C3_all=C3*2;   %20M/16  =1.25M    stream2
N1=C1/24;
N2=C2/24;
N3=C3/24;
N1_all=C1_all/24
N2_all=C2_all/24
N3_all=C3_all/24


BL1=44*10^9;   
BL2=36.8*10^9;    
BL3=27.3*10^9;    
BM=16.0*10^9;

N=200000; 
zhongpin=2.6*10^9; 
 F=4*zhongpin;
 F_all=F*n;
 
 BL1_all=44.8*2*10^9;    % 44.8*2      44.8*4      43.4*8     40.7*16
 BL2_all=36.5*2*10^9;    % 36.5*2      36.5*4      35.2*8     34.4*16 
 BL3_all= 26.8*2*10^9;    % 26.8*2      26.8*4      25.8*8     23.8*16    
 BM_all= 15.0*2*10^9;         % 15.0*2      15.0*4        83         115   (slurm-1007195.out  3124217)    
                                                      
                                                      %83  slurm-964216.out  3124217
 
 
 
 
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
     
  
 
 
  