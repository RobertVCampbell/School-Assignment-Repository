// Homework4part2.cpp : Defines the entry point for the console application.
/*Name:		    Robert Campbell
  Date Created: 09/19/2016
  Purpose:      - Prompt for 3 numbers
				- Output the numbers in ascending order
*/

#include "stdafx.h"
#include <iostream>

using namespace std;


int _tmain(int argc, _TCHAR* argv[])
{
	//Declare variables
	//3 int variables
	int num1, num2, num3;

	//Prompt for, and store, 3 integers
	cout << "Enter 3 numbers, separated by spaces: ";
	cin >> num1 >> num2 >> num3;
	cout << endl;


	//Test for which number is largest, then use an inner if to place and output the last two numbers
	//If numbers fall through to the final else, they are all equivilent
	if (num1 > num2 && num1 > num3){
		if (num2 > num3){
			cout << "In ascending order: " << num3 << ", " << num2 << ", " << num1 << endl; 
		}
		else if (num3 > num2){
			cout << "In ascending order: " << num2 << ", " << num3 << ", " << num1 << endl; 
		}
		else{
			cout << num2 << " and " << num3 << " are equal." << endl;
			cout << "In ascending order: " << num2 << ", " << num3 << ", " << num1 << endl; 
		}
	}//End of num1 if


	else if(num2 > num1 && num2 > num3) {
		if (num1 > num3){
			cout << "In ascending order: " << num3 << ", " << num1 << ", " << num2 << endl; 
		}
		else if (num3 > num1){
			cout << "In ascending order: " << num1 << ", " << num3 << ", " << num2 << endl; 
		}
		else{
			cout << num1 << " and " << num3 << " are equal." << endl;
			cout << "In ascending order: " << num3 << ", " << num1 << ", " << num2 << endl; 
		}
	}//End of num2 else if


	else if(num3 > num1 && num3 > num2) {
		if (num1 > num2){
			cout << "In ascending order: " << num2 << ", " << num1 << ", " << num3 << endl; 
		}
		else if (num2 > num1){
			cout << "In ascending order: " << num1 << ", " << num2 << ", " << num3 << endl; 
		}
		else{
			cout << num1 << " and " << num2 << " are equal." << endl;
			cout << "In ascending order: " << num1 << ", " << num2 << ", " << num3 << endl; 
		}
	}//End of num3 elseif


	else{
		cout << num1 << ", " << num2 << ", and " << num3 << " are all equivilent." << endl;
	}//End of if else

	system("pause");//Stops terminal from closing
	return 0;
}//End of main

