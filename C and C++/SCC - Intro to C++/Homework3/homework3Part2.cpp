// homework3Part2.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
//Part A) Include fstream, string, and iomanip in the program
#include <fstream>
#include <string>
#include <iomanip>

using namespace std;
int main()
{
	//Part B) Declare inFile to be an ifstream variable and outFile to be an ofstream variable
	ifstream inFile;
	ofstream outFile;

	//Part C) the program will read data from the file inData.txt and write output to the file
	//		  outData.txt. Write statements to open both of these files, associate inFile with
	//		  inData.txt and associate outFile with outData.txt
	inFile.open("inData.txt");
	outFile.open("outData.txt");

	//Formatting:
	outFile << fixed << showpoint;
	outFile << setprecision(2);


	//Declare variables
	string firstName, lastName, dept;
	double salary, bonus, taxes, paycheck, distance, travelTime, avgSpd, coffeePrice, coffeeTotal;
	int coffeeSold;

	
	//Part D) Read in and output
	inFile >> firstName >> lastName >> dept;
	outFile << "Name: " << firstName << lastName << ", Department: " << dept << endl;

	inFile >> salary >> bonus >> taxes;
	paycheck = salary + (salary * (bonus / 100.00)) - (salary * (taxes / 100.00));
	outFile << "Montly Gross Salary: $" << salary << ", Monthly Bonus: " << bonus << "%, Taxes: " << taxes << "%\n" << "Paycheck: $" << paycheck << "\n" << endl;

	inFile >> distance >> travelTime;
	avgSpd = distance / travelTime;
	outFile << "Distance Traveled: " << distance << " miles, Travelling Time: " << travelTime << " hours\nAverage Speed: " << avgSpd << " miles per hour\n" << endl;

	inFile >> coffeeSold >> coffeePrice;
	coffeeTotal = coffeeSold * coffeePrice;
	outFile << "Number of Coffee Cups Sold: " << coffeeSold << ", Cost: $" << coffeePrice << " per cup\nSales Amount = $" << coffeeTotal << endl;

	//Part e) Close the in and out files
	inFile.close();
	outFile.close();



	system("pause");
	return 0;
}//End of main

