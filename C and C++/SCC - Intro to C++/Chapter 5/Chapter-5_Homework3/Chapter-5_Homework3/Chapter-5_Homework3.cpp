// Chapter-5_Homework3.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
  
  
#include <iostream>
#include <iomanip>

using namespace std;
 
int main()
{
	int firstNum, secondNum;
	int sumEven = 0;
	int sumSquareOdd = 0;

	char chCounter;

	int counter;

		//Part a
	cout << "Enter two numbers." << endl;
	cout << "First number must be less than "
		 << "the second number you enter" << endl;
	cout << "Enter numbers: " << flush;
	cin >> firstNum >> secondNum;
	cout << endl;

		//Part b
	if (firstNum % 2 == 0)
		counter = firstNum + 1;
	else
		counter = firstNum;

	cout << "Odd integers between " << firstNum << " and "
		 << secondNum << " are: " << endl;

	do
	{
		cout << counter << " ";
		counter = counter + 2;
	}
	while (counter <= secondNum);

	cout << endl;

		//Part c
	if (firstNum % 2 == 0)
		counter = firstNum;
	else
		counter = firstNum + 1;

	do
	{
		sumEven = sumEven + counter;
		counter = counter + 2;
	}
	while (counter <= secondNum);

	cout << "Sum of even integers between " << firstNum << " and "
		 << secondNum << " = " << sumEven << endl;

		//Part d
	cout << "Number    Square of Number" << endl;
	counter = 1;
	do
	{
		cout << setw(4) << counter << setw(18) 
             << counter * counter << endl;
		counter++;
	}
	while (counter <= 10);

	cout << endl;
	
		//Part e
	if (firstNum % 2 == 0)
		counter = firstNum + 1;
	else
		counter = firstNum;

	do
	{
		sumSquareOdd = sumSquareOdd + counter * counter;
		counter = counter + 2;
	}
	while (counter <= secondNum);

	cout << "Sum of the squares of odd integers between " 
         << firstNum << " and " << secondNum << " = " 
         << sumSquareOdd << endl;

		//Part f
	cout << "Upper case letters are: ";

	chCounter = 'A';
	do
	{
		cout << chCounter << " ";
		chCounter++;
	}
	while (chCounter <= 'Z');
	cout << endl;

	system("pause");

	return 0;
	
}
