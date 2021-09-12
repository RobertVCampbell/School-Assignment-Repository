// Campbell_Review.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>

using namespace std;


int main()
{
	//Declarations
	double avg;
	int numbers[10];
	int temp;

	cout << "Please enter 10 whole numbers when prompted." << endl;

	for(int i = 0; i < 10; i++){
		cout << "\nPlease enter the " << (i+1) << " number: ";
		cin >> temp;
		numbers[i] = temp;
		avg += temp;
	}//End of input for loop

	
	//display the array
	for(int i = 0; i < 10; i++){
		cout << numbers[i];
	}//End of display for loop


	return 0;
}//end of main

