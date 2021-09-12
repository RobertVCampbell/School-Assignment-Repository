// classExample1.cpp : Defines the entry point for the console application.
//Create a program to calculate the avg test score
//Given the students name and 5 test score
//Output the name, test scores, and the avg score to a file
//

#include "stdafx.h"
#include <iostream>
#include <fstream>
#include <iomanip>
#include <string>

using namespace std;
int main()
{
	//Declare variables

	//Input and output file variables
	ifstream inFile; 
	ofstream outFile; 

	//Numeric variables, all doubles
	double test1;
	double test2;
	double test3;
	double test4;
	double test5, avg;

	//String variables, student name
	string firstName;
	string lastName;

	//Declare the names of the input and output files
	inFile.open("test.txt");
	outFile.open("testAvg.out");

	outFile << fixed << showpoint;
	outFile << setprecision(2);

	//Provide feedback to the user that the data is processing
	cout << "Processing data..." << endl;

	//Store the first and last name from the file into the string variables firstName and lastName
	//This assumes that the first things in the file are the first and last name separated by a space
	inFile >> firstName >> lastName;

	//Writes the output to the outFile
	//Formated with Student name: firstName lastName
	outFile << "Student name: " << firstName << " " << lastName << endl;

	//Import the test scores and store them in the relevant variables
	inFile >> test1 >> test2 >> test3 >> test4 >> test5;

	//Write the output to the outFile
	//Formated with "Test scores:      %%%%      %%%%..."
	//	where %%%% represents the score and the whitespace is made of 6 spaces
	outFile << "Test scores:" << setw(6) << test1 << setw(6) << test2 << setw(6)
		<< test3 << setw(6) << test4 << setw(6) << test5 << endl;
	
	//Calculate the average (mean)
	avg = (test1 + test2 + test3 + test4 + test5) / 5.0;

	//Write to the outFile
	outFile << "Average Test Score:" << setw(6) << avg << endl;

	//Close the input and the output file
	inFile.close();
	outFile.close();

	//Provide the user feedback that processing is complete
	cout << "Process complete." << endl;


		//Accept input via console (this does not meet the program requirements and will be commented out)
		/*cout << "Enter the students first name: ";
		cin >> firstName;
		cout << "\nEnter the student's last name: ";
		cin >> lastName;

		cout << "\nThe student's name is " + firstName + " " + lastName << endl;*/

	system ("pause"); //Pause the system to keep the window open until the user presses enter



	return 0;
}//End of main

