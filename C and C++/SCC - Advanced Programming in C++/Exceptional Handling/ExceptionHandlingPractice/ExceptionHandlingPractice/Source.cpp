#include <iostream>
#include <string>

using namespace std;

int main() {
	/*int val;

	cout << "Enter a positive number: " << endl;
	cin >> val;

	try {
		if (val <= 0) {
			throw (val);
		}
		else {
			cout << "The value entered is: " << val << endl;
		}
	}

	catch(int e){
		cout << "Error: Invalid input\n\" " << e <<" \"" << endl;
	}*/

	int num, den;

	cout << "Enter numerator: ";
	cin >> num;
	cout << endl << "Enter the denominator: ";
	cin >> den;

	//cout << "Result of division: " << num / den << endl;

	try {
		if (den == 0) {
			throw(den);
		}

		else if (den < 0) {
			throw string("invalid input");
		}
		else
			cout << "Result of division is " << num / den << endl;
	}

	catch (int e) {
		cout << "Error: Division by \" " << e << " \" is not allowed" << endl;
	}

	catch (string s) {
		cout << s << endl << "Denominator cannot be a neg value." << endl;
	}

	system("pause");
	return 0;
}