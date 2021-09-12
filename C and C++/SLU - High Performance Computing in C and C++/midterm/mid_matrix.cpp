#include <iostream>
#include <iomanip>
#include <omp.h>

using namespace std;

int const n = 1000;
double A[n][n];
double B[n][n];
double C[n][n];

void valid(){
	double tA[4][4];
	double tB[4][4];
	double tC[4][4];

	//initialize the matrices
	for(int i = 0; i <4; i++){
		for(int j = 0; j < 4; j++){
			tA[i][j] = 1.0;
		}
	}

	for(int i = 0; i <4; i++){
                 for(int j = 0; j < 4; j++){
                         tB[i][j] = 2.0;
                 }
         }

	for(int i = 0; i <4; i++){
                 for(int j = 0; j < 4; j++){
                         tC[i][j] = 0.0;
                 }
         }

	
	// Calculate C
	for(int i = 0; i <4; i++){
                  for(int j = 0; j < 4; j++){
                        for(int k = 0; k < 4; k++){
				tC[i][j] += tA[i][k] * tB[k][j];	
			}
                  }
          }


	cout << "\nValidate Mode:\n\nC[4][4]:" << endl << endl;
	for(int i = 0; i <4; i++){
                 for(int j = 0; j < 4; j++){
                         cout << tC[i][j] << "  ";
                 }
		cout << endl;
         }
	return;
}


// C gets reset a lot, so it gets its own function
void rst_C(){
	for(int i = 0; i <n; i++){
                 for(int j = 0; j < n; j++){
                         C[i][j] = 0.0;
                 }
         }

}

void stat(){
	double start, end;
	cout << "\nStatic Schedule:\n";
	cout << "  " << setw(18) << "Numer of threads"
            << "  " << setw(30) << "Elapsed wall clock time (sec)" << "\n";

	for(int x = 1; x < 32; x*=2){
		omp_set_num_threads(x);
		start = omp_get_wtime();
		#pragma omp parallel for schedule(static)
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

void stat_10(){
        double start, end;
        cout << "\nStatic_10 Schedule:\n";
        cout << "  " << setw(18) << "Numer of threads"
            << "  " << setw(30) << "Elapsed wall clock time (sec)" << "\n";

        for(int x = 1; x < 32; x*=2){
                omp_set_num_threads(x);
                start = omp_get_wtime();
                #pragma omp parallel for schedule(static,10)
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

void dyn(){
        double start, end;
        cout << "\nDynamic Schedule:\n";
        cout << "  " << setw(18) << "Numer of threads"
            << "  " << setw(30) << "Elapsed wall clock time (sec)" << "\n";

        for(int x = 1; x < 32; x*=2){
                omp_set_num_threads(x);
                start = omp_get_wtime();
                #pragma omp parallel for schedule(dynamic)
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

void dyn_10(){
        double start, end;
        cout << "\nDynamic_10 Schedule:\n";
        cout << "  " << setw(18) << "Numer of threads"
            << "  " << setw(30) << "Elapsed wall clock time (sec)" << "\n";

        for(int x = 1; x < 32; x*=2){
                omp_set_num_threads(x);
                start = omp_get_wtime();
                #pragma omp parallel for schedule(dynamic, 10)
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
	valid();
	
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
	stat();
	stat_10();
	dyn();
	dyn_10();


	return 0;
}
