// Homework4.cpp : Defines the entry point for the console application.
/*Created by:    Robert Campbell
  Date created:  09/19/2016
  Purpose:		- Accept an int from a user
				- Evaluate if the int is < 0 or > 0
				- Output that the number is positive, negative, or zero
*/

#include "stdafx.h"
#include <iostream>

using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
	//Declare Variables
	int num;

	//Prompt for and store a number
	cout << "Please enter a positive or negative integer: " ;
	cin >> num;
	cout << endl;

	//Evaluate if num is positive, negative, or 0
	if (num > 0){
		cout << "You entered the positive number: " << num << endl;
	}
	else if(num < 0) {
		cout << "You entered the negative number: " << num << endl;
	}
	else {
		cout << "The number you entered was zero: " << num << endl;
	}


	system("pause");//Stop the terminal from closing
	return 0;
}//End of main()

