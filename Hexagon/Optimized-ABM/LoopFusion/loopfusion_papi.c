#include <malloc.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <time.h>
#include<papi.h>
#define real double

#define alpha 0.5
#define gamma1 0.88622692
#define gamma2 1.329340388

#define y0 1.0
#define prefix 1.0

#define f(y) (-y)

int main(int nargs, char** args)
{
  real T=5.0, h=0.005, h_alpha;
  int j, k, N,i;
  real *a, *b, *y, c_j;
  real sum_a, sum_b, yp_jp1;
  clock_t start, finish;

  if (nargs>1)
    h = atof(args[1]);

  if (nargs>1)
    T = atof(args[2]);

  N = (int)(T/h+0.5);

  printf("Serial LoopFusion version---------------\n");
  printf("T=%g, h=%g, N=%d\n", T,h,N);

  a = (real*)malloc((N+1)*sizeof(real));
  b = (real*)malloc((N+1)*sizeof(real));
  y = (real*)malloc((N+1)*sizeof(real));

  h_alpha = pow(h,alpha);

  start = clock();

  for (j=N; j>=0; j--) {
    b[j] = (pow(j+1,alpha)-pow(j,alpha))/gamma1;
    a[j] = (pow(j+2,alpha+1)-2.*pow(j+1,alpha+1)+pow(j,alpha+1))/gamma2;
  }

  y[0] = y0;

  int Events[] = {PAPI_L1_TCA,PAPI_L2_TCA,};

int NUM_EVENTS = sizeof(Events)/sizeof(Events[0]);
  long long res_papi[NUM_EVENTS];
  char EventName[128];
  int num_hwcntrs = 0;
  int EventSet = PAPI_NULL;
  int retval;

  retval = PAPI_library_init( PAPI_VER_CURRENT );
  retval = PAPI_create_eventset( &EventSet );

  if (PAPI_add_events( EventSet, Events, NUM_EVENTS) != PAPI_OK){
    printf("PAPI_add_events failed\n");
  }

for (i=0; i<NUM_EVENTS; i++){
    res_papi[i] = 0;
  }


if ( PAPI_start( EventSet ) != PAPI_OK){
    printf("PAPI_read_counters failed\n");
  }




  for (j=0; j<N; j++) {
    sum_b = b[j]*f(y[0]);
    c_j = (pow(j,alpha+1)-(j-alpha)*pow(j+1,alpha))/gamma2;
    sum_a = c_j*f(y[0]);

    for (k=1; k<=j; k++) {
      sum_b += b[j-k]*f(y[k]);
      sum_a += a[j-k]*f(y[k]);
    }

    yp_jp1 = prefix + h_alpha*sum_b;
    y[j+1] = prefix + h_alpha*(sum_a + f(yp_jp1)/gamma2);
  }

if ( PAPI_stop( EventSet, res_papi ) != PAPI_OK){
    printf("PAPI_accum_counters failed\n");
  }

for (i = 0; i<NUM_EVENTS; i++){
    PAPI_event_code_to_name(Events[i], EventName);
    printf("PAPI Event name: %s, value: %lld\n", EventName, res_papi[i]);
  }







  finish=clock();
  printf("y[%d]=%e",N,y[N]);
  printf("    timeusage=%g",(finish-start)/1e6);
  printf("    GFLOPs=%g\n",2.0*N*(N+1)/(finish-start)/1000.0);

  free(a);
  free(b);
  free(y);
         PAPI_shutdown ();
  return 0;
}
