/*Created by: Robert Campbell
  Created on: 11/13/17
  Purpose:	  Create a stack using Linked Lists
			- Must have peek, push, and pop functions*/

#include <iostream>
using namespace std;

struct node {
	int data;
	node * next;
};

node *head = NULL;
node *current = NULL;
node *temp = NULL;


bool isEmpty() {
	return (head == NULL);
}

void push(int d) {
	temp = new node();
	temp->data = d;
	temp->next = NULL;

	if (isEmpty()) {
		cout << "Stack is being created." << endl;
		head = temp;
		current = temp;
		cout << "Added the value: " << temp->data << endl;
	}
	else {
		temp->next = head;
		head = temp;
		cout << "Added the value: " << temp->data << endl;
	}

}

void peek() {
	if (!isEmpty()) {
		cout << "The top value in the stack is: " << head->data << endl;
	}
	else
		cout << "The stack is empty." << endl;
}


void pop() {
	temp = head;
	current = head;

	if (isEmpty()) {
		cout << "The stack is empty" << endl;
	}

	else {
		cout << "The data being removed is: " << head->data << endl;
		head = head->next;
	}

}



int main() {

	pop();
	peek();

	push(1);
	push(2);
	push(3);
	push(4);

	peek();

	cout << "------------" << endl;

	pop();
	pop();
	push(5);
	push(6);
	pop();

	peek();

	cout << "-----------" << endl;

	push(7);
	pop();
	pop();
	pop();
	pop();
	pop();



	system("pause");
	return 0;
}

