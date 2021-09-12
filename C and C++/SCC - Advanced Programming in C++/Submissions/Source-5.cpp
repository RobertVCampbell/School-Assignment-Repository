#include <iostream>
using namespace std;

int arr[5];


void sort() {
	int count;
	int temp;

	do {
		count = 0;
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

void create() {
	cout << "Please enter 5 integers: " << endl;
	for (int i = 0; i < 5; i++) {
		cout << "Integer number " << i + 1 << ": ";
		cin >> arr[i];
	}
	sort();
}



void search() {
	int search;
	cout << "\nPlease enter a number to search for: ";
	cin >> search;

	int high = 5;
	int low = 0;
	int mid;
	int count = 0;

	do {
		mid = (low + high) / 2;

		if (arr[mid] == search) {
			cout << "Pass " << ++count << " complete" << endl;
			cout << "Search term " << search << " found at position " << mid << endl;
			break;
		}

		else if (search < arr[mid]) {
			high = mid - 1;
			cout << "Pass " << ++count << " complete" << endl;
		}
		else if (search > arr[mid]) {
			low = mid + 1;
			cout << "Pass " << ++count << " complete" << endl;
		}


	} while (low <= high);

	if (low > high) {
		cout << search << " not found." << endl;
	}

}


int main() {
	create();
	search();


	system("pause");
	return 0;
}