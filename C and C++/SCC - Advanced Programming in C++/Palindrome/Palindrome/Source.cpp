/*Created by: Robert Campbell
  Created on: 11/8/2017
  Purpose: Create a program that can verify if a user's input is a palindrom using a stack
		-	Use a stack to test the opposite of the input
		-	Use exception handling (try/catch) to handle any errors
		*/
#include <iostream>
#include <string>
#include <iomanip>

using namespace std;

int top = -1;
int bottom = -1;
string word;
char opposite[100];

bool isFull() {
	if (top + 1 == (100))
		return true;
	else
		return false;
}
bool isEmpty() {
	if (top == -1 || bottom == -1)
		return true;
	else
		return false;
}



char peek() {
	if (isEmpty())
		return '1';
	else
		return opposite[top];
}


void push(char y) {
	if (isEmpty()) {
		top = 0;
		bottom = 0;
		opposite[top] = y;
		return;
	}
	else if (isFull()) {
		cout << "Stack is full." << endl;
		return;
	}
	else
	{
		opposite[++top] = y;
		return;
	}
}


void pop() {
	if (isEmpty()) {
		cout << "The stack is empty." << endl;
		return;
	}
	else if (top == bottom) {
		bottom = -1;
		top = -1;
		return;
	}
	else {
		--top;
		return;
	}
}

bool test() {
	if (!isEmpty()) {
		int i = 0;
		while (!isEmpty()) {
			i;
			if (word[i] == opposite[i]) {
				cout << word[i] << ", " << opposite[i] << endl;
				pop();
			}
			else {
				cout << "\n" << word << " is not a palindrome." << endl;
				return false;
			}

			return true;
		}
	}
	else
		return false;

}



int main() {

	bool t;
	
	try {
		cout << "Please enter a word or phrase you think may be a palindrome: ";
		cin >> word;
		if (cin.fail()) {
			throw 1;
		}
		cout << endl << endl;
	}

	catch (int x) {
		if (x == 1)
		{
			t = true;
			while (t) {
				cin.clear();
				cin.ignore();
				cout << "Input failed, please try entering a different word or phrase: ";
				getline(cin, word);
				t = cin.fail();

			}
		}
	}

	
	
	for (int i = 0; i < word.length(); i++) {
		push(word[i]);
	}

	t = test();

	cout << "It is " << t << " that " << word << " is a palindrome.\n\n";


	system("pause");
	return 0;
}