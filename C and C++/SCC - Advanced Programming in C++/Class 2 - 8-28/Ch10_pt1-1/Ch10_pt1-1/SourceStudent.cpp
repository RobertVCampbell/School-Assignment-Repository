/*Name: Robert Campbell
  Date Created: 08/28/2017
  Purpose: Practice creating and managing objects by:
		- Defining a class file
			+ Controlling access to members and methods
			+ Creating mutator and accessor methods
		- Importing the class file into a source file
			+ Create multiple instances of an object
			+ Manipulate the members of the objects via mutators
			+ Access the members via accessors
		- Use main() to test the class file and its methods
*/

#include <iostream>
#include <string>
#include "Student.h"

using namespace std;

int main(){
	
	//Variable to hold and insert test values
	string name;
	int id;
	double e,m,s;

	Student s1;
	Student s2(123, "Jerry Mandering", 700.0, 80.0, 72.5);
	
	s1.showData();
	s2.showData();

	cout << "\n\nPlease enter the correct info for student 1." << endl;

	//Testing different ways, using std, to pull the name while including the whitespace
	//getline(from, to) seems to be the best way
	cout << "\nStudent name: ";
	getline(cin,name);// >> noskipws >> name;
	cout << endl;

	cout << "Student ID#: ";
	cin >> id;

	cout << "\nEnglish grade: ";
	cin >> e;

	cout << "\nMath grade: ";
	cin >> m;

	cout << "\nScience grade: ";
	cin >> s;
	cout << endl;

	s1.takeData(id, name, e, m, s);

	cout << "\nInformation updated.\n" << endl;

	s1.showData();
	s2.showData();



	system("pause");
	return 0;
};//End of main