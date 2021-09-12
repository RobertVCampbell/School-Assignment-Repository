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
double avg = 0;
int numbers[10];
int temp = 0;
int min;
int max;




void createArr() {
	cout << "Please enter 10 whole numbers when prompted." << endl;
	for (int i = 0; i < 10; i++) {
		cout << "\nPlease enter the " << (i + 1) << " number: ";
		cin >> temp;
		numbers[i] = temp;
		avg += temp;
	}//End of input for loop
	cout << endl;
	cout << endl;
}

void displayArr() {
	for (int i = 0; i < 10; i++) {
		cout << numbers[i] << ", ";
	}//End for
	cout << endl;
}

void calcAvg() {
	avg = avg / 10;
	cout << "\nThe average value is: " << avg << endl;
}

void minMax() {
	min = numbers[0];
	max = numbers[0];

	for (int i = 1; i < 10; i++) {
		if (min >= numbers[i])
			min = numbers[i];
	}

	for (int i = 1; i < 10; i++) {
		if (max <= numbers[i])
			max = numbers[i];
	}

	//Display Minimum and maximum
	cout << "\nThe smallest value is: " << min << endl;
	cout << "\nThe largest value is: " << max << endl;
	cout << endl;
}

void swap() {
	cout << "Original array: " << endl;
	displayArr();

	//Change first and last index positions
	temp = numbers[0];
	numbers[0] = numbers[9];
	numbers[9] = temp;

	//Display new array
	cout << "\nNew array: " << endl;
	displayArr();
}


int main()
{
	//Declarations


	createArr();


	//display the array
	displayArr();



	//Calculate and display average
	calcAvg();

	//Determine the smallest and largest numbers
	//Preset with the leftmost value to test each
	minMax();


	//Swap first and last values in the array
	swap();

	system("pause");
	return 0;
}//end of main