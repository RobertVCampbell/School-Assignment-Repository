/*Suppose the run0time of a  serial problem is given by Tserial = n2,
where the units of the run-time are in microseconds. Suppose that a
parallelization of this program has run-time Tparallel=(n2/p)+log2(p).
Write a program that finds the speedups and efficiencies of this
program for various values of n and p. Run your program with
n=10, 20, 40, ..., 320, and p=1, 2, 4, ..., 128. */

#include <iostream>
#include <math.h>
using namespace std;
 
int main()
{
    /* int n(0);
    cin>>n;
    long val=factorial(n);
    cout<<val;
    cin.get(); */
    int Tserial = 0;
    int Tparallel = 0;

    for(int n = 10; n < 321 ; n+=10){
        Tserial = n * n;
        cout << n << ":\nSerial length: " << Tserial << "ms\nParallel: ";

        for(int p = 1; p < 129; p++){
            Tparallel = (Tserial / p) * log2(p);
            cout << Tparallel << "ms";
            if(p != 128) cout << ", ";

        }

        cout << endl << endl;


    }
    return 0;
}
 
