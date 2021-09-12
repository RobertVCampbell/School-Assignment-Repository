/*Created by: Robert Campbell
  Created on: 11/1/17
  Purpose: To create a program demonstrating the basics of the abstract datatype "Queue"
		- Must have an "enqueue" function (enQ())
		- Must have a "dequeue" function  (dQ())
		- Must have an "isFull" function
		- Must have an "isEmpty" function
*/
#include <iostream>
#include <string>

using namespace std;

const int MAX = 12;
int q[MAX];
int front = -1;
int rear = -1;

bool isfull() {
	return ((rear+1)%MAX == front);
}

bool isempty() {
	return (rear == -1 || front == -1);
}

void enQ(int x) {
	if (isempty()) {
		front++;
		q[++rear] = x;
	}
	else if (!isfull()) {
		rear = (rear + 1) % MAX;
		q[rear] = x;}
	else {
		cout << "\nThe queue is full." << endl;
		return;
	}
}

void dQ() {
	if (isempty()) {
		cout << "\nThe queue is empty." << endl;
		return;
	}
	else if (front == rear) {
		cout << "\nThe last value in the queue is: " << q[front] << endl;
		front = -1;
		rear = -1;
	}
	else
		front = (front + 1) % MAX;
}

void testOut() {
	cout << endl << "The current value of front: " << front << endl << endl;
	cout << "The current value of rear: " << rear << endl << endl;
	cout << "The value at the front of the queue: " << q[front] << endl << endl;
	return;
}


int main() {
	testOut();
	enQ(10);
	
	testOut();
	enQ(1);
	
	testOut();
	enQ(5);
	
	testOut();
	enQ(13);
	
	testOut();
	enQ(12);
	
	testOut();
	enQ(22);
	
	testOut();
	enQ(643);
	
	testOut();
	enQ(1);
	
	testOut();
	enQ(8);
	
	testOut();
	enQ(72);
	
	testOut();
	enQ(9);
	
	testOut();
	dQ();

	testOut();
	enQ(3);
	
	testOut();
	enQ(4);
	
	testOut();
	enQ(1);

	testOut();
	dQ();
	
	testOut();
	enQ(18);

	testOut();
	dQ();

	testOut();
	dQ();
	dQ();
	dQ();
	dQ();
	dQ();
	dQ();
	dQ();
	dQ();
	dQ();
	dQ();
	dQ();
	dQ();



	testOut();







	system("pause");
	return 0;
}