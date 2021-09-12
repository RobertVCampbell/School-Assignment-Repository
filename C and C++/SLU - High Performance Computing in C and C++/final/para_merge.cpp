#include<iostream>
#include <cstdlib>
#include <stdlib.h>
#include <stdio.h>
#include <omp.h>
#include <iomanip>
#include <array>

#define SEED 35791246

using namespace std;

int p = 1;

void swapping(int &a, int &b) {     //swap the content of a and b
   int temp;
   temp = a;
   a = b;
   b = temp;
}
void display(int *array, int size) {
   for(int i = 0; i<size; i++)
      cout << array[i] << " ";
   cout << endl;
}
void merge(int *array, int l, int m, int r) {
   int i, j, k, nl, nr;
   //size of left and right sub-arrays
   nl = m-l+1; nr = r-m;
   int larr[nl], rarr[nr];
   //fill left and right sub-arrays
   for(i = 0; i<nl; i++)
      larr[i] = array[l+i];
   for(j = 0; j<nr; j++)
      rarr[j] = array[m+1+j];
   i = 0; j = 0; k = l;
   //marge temp arrays to real array
   while(i < nl && j<nr) {
      if(larr[i] <= rarr[j]) {
         array[k] = larr[i];
         i++;
      }else{
         array[k] = rarr[j];
         j++;
      }
      k++;
   }
   while(i<nl) {       //extra element in left array
      array[k] = larr[i];
      i++; k++;
   }
   while(j<nr) {     //extra element in right array
      array[k] = rarr[j];
      j++; k++;
   }
}
void mergeSort(int *array, int l, int r, int x) {
   int m;  
   if(l < r) {
      x*=2;
      m = l+(r-l)/2;
      // Sort first and second arrays
      #pragma omp parallel if (x<=p)
      {
	#pragma omp single
	{
		#pragma omp task shared(array)
			{mergeSort(array, l, m, x);}
		#pragma omp task shared(array)
			{mergeSort(array, m+1, r, x);}
	}
      }
      merge(array, l, m, r);
   }
}
int main() {
   int n = 1000000;
   int arr[n];     //create an array with given number of elements
   double start,end;

   srand(SEED);

   omp_set_nested(1);
   omp_set_dynamic(0);
 cout << "  " << setw(8) << "N"
         << "  " << setw(18) << "Number of threads"
         << "  " << setw(30) << "Elapsed wall clock time (sec)" << "\n";

   for(p=1; p<9; p*=2){
	   // Set the appropriate number of threads
	   omp_set_num_threads(p);
	   // Initialize the array for this iteration
	   for (int i = 0; i<n; i++) arr[i] = rand()%1000;  
	   start = omp_get_wtime();
	   mergeSort(arr, 0, n-1,1);     //(n-1) for last index
	   end = omp_get_wtime();
	   // Output the results

	   cout << "  " << setw(8) << n
      		   << "  " << setw(18) << p
      		   << "  " << setw(30) << end-start << "\n";

   }// end 8 proc for loop 


}
