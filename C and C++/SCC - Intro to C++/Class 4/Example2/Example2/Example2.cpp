// Example2.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>

using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
	//declare variables
	int num1, num2;

	//Prompt for and store two integers
	cout << "Enter any two integers, separated by spaces: " ;
	cin >> num1 >> num2;
	cout << endl;

	if(num1 > num2){
		cout << "The larger number is: " << num1 << endl;
	}//End if
	else if(num2 > num1) {
		cout << "The larger number is: " << num2 << endl;
	}//End else if
	else{
		cout << "The numbers are equivilent: " << num1 << endl;
	}//End if, elseif, else

	system("pause");

	return 0;
}

