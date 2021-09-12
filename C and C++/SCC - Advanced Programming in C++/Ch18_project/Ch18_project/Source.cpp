#include <iostream>
using namespace std;

int arr[5];


void create() {
	cout << "Please enter 5 integers: " << endl;
	for (int i = 0; i < 5; i++) {
		cout << "Integer number " << i + 1 << ":";
		cin >> arr[i];
	}
}

void sort() {
	int count;
	int temp;

	do {
		for (int i = 0; i < 5; i++) {
			if (arr[i] > arr[i + 1]) {
				temp = arr[i];
				arr[i] = arr[i + 1];
				arr[i + 1] = temp;
				count += 1;
			}		
		}
	} while (count != 0);

	cout << "\n-----Sort complete-----" << endl << endl;
}

void search() {
	int search;
	cout << "\nPlease enter a number to search for: ";
	cin << search;


}


int main() {


	system("pause");
	return 0;
}