/*Create a program to accept 10 values and store them in an int array
  Display the array
  Calculate the average
  Determine the minimum and maximum
  Switch the array values at the first and last index positions
  Display the new array
  
  Extra endl's are for whitespace for readability
  Mostly just using this to refresh myself on c++ syntax*/
#include <iostream>

using namespace std;


int main()
{
	//Declarations
	double avg = 0;
	int numbers[10];
	int temp = 0;
	int min;
	int max;

	cout << "Please enter 10 whole numbers when prompted." << endl;

	for(int i = 0; i < 10; i++){
		cout << "\nPlease enter the " << (i+1) << " number: ";
		cin >> temp;
		numbers[i] = temp;
		avg += temp;
	}//End of input for loop
	cout << endl;
	cout << endl;

	//display the array
	for(int i = 0; i < 10; i++){
		cout << numbers[i] << ", ";
	}//End for
	cout << endl;
	cout << endl;



	//Calculate and display average
	avg = avg / 10;
	cout << "The average value is: " << avg << endl;
	cout << endl;

	//Determine the smallest and largest numbers
	//Preset with the leftmost value to test each
	min = numbers[0];
	max = numbers[0];

	for(int i = 1; i < 10; i++){
		if(min >= numbers[i])
			min = numbers[i];
	}

	for(int i = 1; i < 10; i++){
		if(max <= numbers[i])
			max = numbers[i];
	}

	//Display Minimum and maximum
	cout << "\nThe smallest value is: " << min << endl;
	cout << "\nThe largest value is: " << max << endl;
	cout << endl;


	//Swap first and last values in the array
	temp = numbers[0];
	numbers[0] = numbers[9];
	numbers[9] = temp;

	//Display the new array
	cout << "The new array is: " << endl;
	for(int i = 0; i < 10; i++)
		cout << numbers[i] << ", ";
	cout << endl;
	cout << endl;


	system("pause");
	return 0;
}//end of main

