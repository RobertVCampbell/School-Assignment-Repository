/*Created by: Robert Campbell
  Created on: 09/27/2017
  Purpose: To create and test an inherited class
	The parent class is to be named PersonType
		- Has variables: (firstName, lastName, age)
		- Has functions: (print, setName, setAge, getFirstName, getLastName)
		- Has constructors: (default, 3 parameter [string string int])
	The child class is to be named DoctorType
		- Has variable: (specialty)
		- Has manipulator and accessor functions
		- Has constructors: (default, 4 parameter [string string int string])
	Source file will test the objects and functions
*/


#include <iostream>
#include <string>
#include "DoctorType.h"


using namespace std;

int main() {

	DoctorType d1;
	d1.print();
	cout << endl;

	DoctorType d2("Some", "Name", 35, "Specialty");
	d2.print();

	cout << endl << d2.getAge() << endl;
	cout << d2.getFName() << endl;
	cout << d2.getLName() << endl << endl;

	cout << "New name and age for d1, but not d2" << endl << endl;

	d1.setSpecialty("Specialized");
	d1.setName("John", "Smith");
	d1.setAge(68);
	
	d1.print();
	cout << endl;

	d2.print();
	cout << endl;


	system("pause");
	return 0;
}