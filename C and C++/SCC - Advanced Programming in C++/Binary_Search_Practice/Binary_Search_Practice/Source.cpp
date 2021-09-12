#include <iostream>

using namespace std;

int main() {

	int arr[10] = { 1,2,3,4,5,6,7,8,9,10 };
	int low = 0;
	int high = 9;

	int mid;

	int search = 17;

	while (low <= high) {
		mid = (low + high) / 2;

		if (arr[mid] == search) {
			cout << "Value " << search << " found at position " << mid << endl;
			break;
		}

		else if (arr[mid] < search) {
			low = mid + 1;
		}

		else
			high = mid - 1;
	}

	cout << "Search complete" << endl;

		system("pause");
		return 0;

}