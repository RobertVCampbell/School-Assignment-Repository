#include <iostream>
using namespace std;

struct node {
	int data;
	node * next;
};

node *head = NULL;
node *current = NULL;
node *temp = NULL;

void add(int d) {
	temp = new node();
	temp->data = d;
	temp->next = NULL;

	if (head == NULL) {
	//first node will be added to the list
		head = temp;
		current = temp;
	}

	else {
		current = head;
		while(current->next!=NULL){
			current = current->next;
		}
		current->next = temp;
		current = temp;
	}
}

void print() {
	temp = head;
	while (temp != NULL) {
		cout << temp->data << endl;
		temp = temp->next;
	}
}

void deleteNode(int d) {
	temp = head;
	current = head;
	while (temp->next != NULL) {
		if (temp->data == d && temp == head) {
			head = head->next;
			current = head;
			temp = head;
			break;
		}
		else if (temp->data == d && temp != head) {
			current->next = temp->next;
			current = head;
			temp = head;
			break;

		}
		else {
			current = temp;
			temp = temp->next;
		}
	}
}


int main() {

	add(1);
	add(2);
	add(3);
	add(4);
	print();

	cout << "-------------" << endl;

	add(5);
	print();

	cout << "------------" << endl;

	deleteNode(3);
	print();
	cout << "-------------" << endl;

	deleteNode(1);
	print();
	cout << "-------------" << endl;


	system("pause");
	return 0;
}

