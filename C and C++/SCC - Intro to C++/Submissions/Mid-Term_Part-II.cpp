/*
Created by: Robert Campbell
Created on: 10/03/2016
Purpose:	Free response portion of mid-term
				-Take provided code that is improperly formatted and correct it
*/

//Commented out because it was not part of the scramble
//#include "stdafx.h"

#include <iostream>
#include <string>

using namespace std;

int main(){
	//Variable Declaration
	int num;
	double height;
	string name;

	cout << "Enter an integer: " ;
	cin >> num;
	cout << endl;

	cout << "Enter the first name: " ;
	cin >> name;
	cout << endl;

	cout << "Enter the height: " ;
	cin >> height;
	cout << endl;

	cout << "Name: " << name << endl;
	//Commented out because it is redundant, replaced with the line below it (currently 37)
	//cout << "Name: " << name << endl;
	cout << "Number: " << num << endl;
	cout << "Height: " << height << endl;

	//Commented out because it was not part of the scramble
	//system("pause");
	return 0;
}//End of main