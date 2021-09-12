#include <iostream>
#include <iomanip>
#include <omp.h>

using namespace std;

int const n = 1000;
double A[n][n];
double B[n][n];
double C[n][n];

void rst_C(){
	for(int i = 0; i <n; i++){
                 for(int j = 0; j < n; j++){
                         C[i][j] = 0.0;
                 }
         }

}


void coll(){
        double start, end;
        cout << "\nCollapse:\n";
        cout << "  " << setw(18) << "Numer of threads"
            << "  " << setw(30) << "Elapsed wall clock time (sec)" << "\n";

        for(int x = 1; x < 32; x*=2){
                omp_set_num_threads(x);
                start = omp_get_wtime();
                #pragma omp parallel for collapse(3)
                for(int i = 0; i <n; i++){
                        for(int j = 0; j < n; j++){
                                for(int k = 0; k < n; k++){
                                        C[i][j] += A[i][k] * B[k][j];
                                }
                        }
                }
                end = omp_get_wtime();
                cout << "  " << setw(18) << x
                    << "  " << setw(30) << end-start << "\n";

                rst_C();
        }
        return;
}



int main(int argc, char **argv){
	
	// Initialize run matrices
        for(int i = 0; i < n; i++){
               for(int j = 0; j < n; j++){
                       A[i][j] = 1.0;
               }
        }
        for(int i = 0; i <n; i++){
                for(int j = 0; j < n; j++){
                        B[i][j] = 1.0;
                }
        }
      	rst_C();

	cout << "\n\nRun Mode:\n"<< endl;
	coll();
	return 0;
}
