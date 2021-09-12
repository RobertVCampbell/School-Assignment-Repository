#include "SLinkedList.h"
#include <iostream>
#include <stdexcept>
using namespace std;

int main() {

  SLinkedList<int> mylist;
  SLinkedList<int> myOtherList;

  if (mylist.empty())
   cout << "list is empty" << endl;

  mylist.addFront(10);
  mylist.addFront(15);
  cout << "Front: " <<  mylist.front() << endl;  //should be 15
  cout << "Back: " << mylist.back() << endl; //Should be 10

  myOtherList = mylist;
  myOtherList.addFront(3);

  mylist.printlist();

  mylist.removeFront();
  cout << mylist.front() << endl; //should be 10

}
