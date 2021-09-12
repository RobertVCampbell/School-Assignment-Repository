/*Created by: Robert Campbell
  Created on: 11/20/2017
  Purpose: Create a linked list that accepts integers from a user, sorts, stores, and displays them in ascending (least to greatest) order*/

#include <iostream>
#include <string>
using namespace std;


struct node {
	int data;

	node *next;
};

node *head;
node *current;
node *temp;
node *previous;



//Recursive loop to check the if the new data is less than
void tryNext(node *x, node *y, node *z, int i) {
	if (x->data <= y->data) {
		x->next = y;
		z->next = x;

		cout << "Value '" << x->data << "' was added after '" << i << "' loops." << endl << endl;
		return;
	}
	else if (x->data > y->data && y->next == NULL)
	{
		y->next = x;
		cout << "Value '" << x->data << "' was added at the end of the list after '" << i << "' loops." << endl << endl;
		return;
	}
	else{
		z = y;
		y = y->next;
		tryNext(x, y, z, i+1);
		return;
	}
	
}

void startState() {
	current = head;
	previous = head;
}

void addNumber() {
	int d;


	cout << "Please enter the positive integer that you would like to add: ";
	cin >> d;
	cout << endl;

	if (d < 0) {
		cout << "Invalid input" << endl << endl;
		return;
	}

	temp = new node();
	temp->data = d;

	if (head == NULL) {
		head = temp;
		current = temp;
		previous = temp;
		cout << "Added the first value: " << head->data << endl << endl;
	}

	else if (temp->data < head->data) {
		temp->next = head;
		head = temp;

		cout << "Added new first value: " << head->data << endl << endl;
		return;
	}

	else if (head->next == NULL) {
		head->next = temp;
		cout << "Added second value: " << head->next->data << endl << endl;
	}

	else {
		current = head->next;
		previous = head;

		tryNext(temp, current, previous, 0);

	}

	startState();
}

void print(int i){
	if (current == NULL) {
		cout << "No values found at position " << i << "." << endl << endl;
	}
	else {
		cout << i << ": " << current->data << endl;
		current = current->next;
		print(i + 1);
	}
	startState();

}





int main() {
	bool cont = true;
	string in;
	


	cout << "This program will store and sort positive integers in ascending order.";

	do {
		cout << "\nWould you like to [Add] a number, [Display] the list, or [Exit] the program? ";
		cin >> in;
		cout << endl;

		switch (in[0]) {
		case 'a':
		case 'A':
			addNumber();
			break;

		case'd':
		case'D':
			print(1);
			break;

		case'e':
		case'E':
			cont = false;
			break;

		default:
			break;

		}



	} while (cont);



	system("pause");
	return 0;
}
