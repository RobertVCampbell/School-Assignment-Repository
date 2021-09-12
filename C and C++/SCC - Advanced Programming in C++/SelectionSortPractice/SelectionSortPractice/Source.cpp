#include <iostream>
using namespace std;

int arr[6] = {2,7,4,1,5,3};
//int size = 6;

//int search = 5;


int main() {
	int size = 6;
	int temp, t;


	for (int i = 0; i < size; i++) {
		t = i;
		

		for (int j = i; j < size; j++) {
			if (arr[t] > arr[j])
				t = j;		
		}

		temp = arr[i];
		arr[i] = arr[t];
		arr[t] = temp;
	}

	for (int i = 0; i < size; i++)
		cout << arr[i] << ", ";

	cout << endl;


	system("pause");
	return 0;
}