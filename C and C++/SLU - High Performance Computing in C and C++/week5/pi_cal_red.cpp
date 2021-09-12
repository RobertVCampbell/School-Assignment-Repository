#include <iostream>
#include <iomanip>
#include <omp.h>
#include <cmath>

using namespace std;

void pi_calc(int num_threads){
   double start, end;

   //int num_threads = omp_get_num_threads();

   start = omp_get_wtime();
   long n = 500000000;
   double sum = 0;
   double h = 2.0 / n;

   #pragma omp parallel for reduction(+:sum) \
                               schedule(static)
   for (int i=0; i<n; i++)
   {
       double x = -1 + (i+0.5)*h;
       sum += sqrt(1 - x*x)*h;
   }
   float pi = sum*2.0;
   end = omp_get_wtime();

   cout << "  " << setw(8) << "N"
        << "  " << setw(18) << "Pi"
        << "  " << setw(18) << "Numer of threads"
        << "  " << setw(30) << "Elapsed wall clock time (sec)" << "\n";
   cout << "  " << setw(8) << n
        << "  " << setw(18) << pi
        << "  " << setw(18) << num_threads
        << "  " << setw(30) << end-start << "\n";
}

int main(int argc, char **argv)
{
   omp_set_num_threads(1);
   pi_calc(1);
   omp_set_num_threads(2);
   pi_calc(2);
   omp_set_num_threads(4);
   pi_calc(4);
   omp_set_num_threads(6);
   pi_calc(6);
   omp_set_num_threads(8);
   pi_calc(8);
   omp_set_num_threads(10);
   pi_calc(10);



   return 0;

}
