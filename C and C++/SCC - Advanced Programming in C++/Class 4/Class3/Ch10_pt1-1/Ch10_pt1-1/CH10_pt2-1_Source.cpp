/*Created by: Robert Campbell
  Created on: 09/06/2017
  Purpose: Create a calculator program that creates a calculator object
	- Calculator class
		+ Read input
		+ Perform calculations
		+ Output results
	- Main
		+ Tests the functions of the calculator object

*/

#include <iostream>
#include <string>
#include "Calculator.h"

using namespace std;

int main(){
	Calculator calc;
	bool quit = false;
	string confirm;

	while(!quit){
		calc.readInput();
		cout << "Would you like to quit? (Yes/No): ";
		cin >> confirm;
		

		if(confirm[0] == 'Y' || confirm[0] == 'y'){
			quit = true;}
	}


	system("pause");
	return 0;
};