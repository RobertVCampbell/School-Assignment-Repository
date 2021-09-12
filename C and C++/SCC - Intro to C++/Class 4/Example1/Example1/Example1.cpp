// Example1.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>

using namespace std;
int _tmain(int argc, _TCHAR* argv[])
{
	//Declare variables
	//Only need a single variable that is an int.
	int num;

	//Prompt for and store and integer
	cout << "Enter an integer: ";
	cin >> num;
	cout << endl;

	//test to see if the number is between 0 and 10, and display the appropriate message
	if(num >= 0 && num <= 10){
		cout << num << " is between 0 and 10" << endl;
	}//End of if
	else {
		cout << num << " is not between 0 and 10" << endl;
	}//End of if else(num)


	system("pause");//Stop the console from closing
	return 0;
}//End of main

