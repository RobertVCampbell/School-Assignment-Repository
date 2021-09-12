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
#include <cmath>

using namespace std;

class Calculator{
	private:
		double val1, val2, result;
		
		void getResult(){
			cout << "The result is: " << result << endl << endl;
		}

	public:

		//Default constructor
		Calculator(){
		}


		void readInput(){
			string choice;
			bool complete = false;

			while(!complete){
				cout << "What operation would you like to perform (Add, Subtract, Multiply, Divide):";
				cin >> choice;
				cout << endl << endl;
				

				cout << "Please enter the first value: ";
				cin >> val1;

				cout << "Please enter the second value: ";
				cin >> val2;

				switch(choice[0]){
					case 'a':
					case 'A':
						add();
						complete = true;
						break;
					case 's':
					case 'S':
						subtract();
						complete = true;
						break;
					case 'm':
					case 'M':
						multiply();
						complete = true;
						break;
					case 'd':
					case 'D':
						divide();
						complete = true;
						break;
					default:
						cout << "Please enter a valid operation." << endl << endl;
				}
			}//end while

		
		}

		void add(){
			result = val1 + val2;
			getResult();
		}

		void subtract(){
			result = val1 - val2;
			getResult();
		}

		void multiply(){
			result = val1 * val2;
			getResult();
		}

		void divide(){
			result = val1/val2;
			getResult();
		}

};