/* Campbell_Robert_MidTerm_Pt-II_Program.cpp : Defines the entry point for the console application.
Created by: Robert Campbell
Created on: 10/03/2016
Purpose: Mid-term program
			- Accept a numeric grade from user
			- Identify the corresponding letter grade
			- Output the letter grade to the user
*/

#include "stdafx.h"
#include <iostream>
#include <string>

using namespace std;

int main()
{
	//Declare Variables
	int grade;
	string letter;
	char extra = ' ';

	//Ask for and store grade from user
	cout << "Please enter a numeric grade between 0 and 100: ";
	cin >> grade;
	cout << endl;

	//Added an extra credit portion because values greater than 100 were not accounted for
	//Check if grade is allowed extra credit
	if(grade > 100){
		while(extra == ' '){
			cout << "Was the grade allowed extra credit? ('Y'/'N'): ";
			cin >> extra;
			cout << endl;

			if(extra == 'Y' || extra == 'y'){
				break;
			}//End Yes if
			else if(extra == 'N' || extra == 'n'){
				cout << "Error.\nIf there is no extra credit, enter a value less than 100." << endl;
				system("pause");	
				return 1;
			}//End No if
			else{
				cout << "Please enter a valid response." << endl;
				extra = ' ';
			}//End else
		}//end of while
	}//end of extra credit if


	//Using if statements, evaluate the letter grade
	if(grade > 100){
		letter = "A+";
	}
	
	else if(grade >=93){
		letter = "A";
	}

	else if(grade >= 85){
		letter = "B";
	}

	else if(grade >= 75){
		letter = "C";
	}

	else if(grade >= 65){
		letter = "D";
	}

	else if(grade >= 0){
		letter = "F";
	}

	else{
		cout << "Error.\nProvide a number greater than 0." << endl;
		system("pause");
		return 1;
	}//End of grade evaluation ifs

	//Output the letter grade
	cout << "The letter grade is: " << letter << endl;

	system("pause");
	return 0;
}//End of main

