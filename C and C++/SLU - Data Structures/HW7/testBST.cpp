//#include "BinaryTree.h"
#include "BinarySearchTree.h"
#include <iostream>
using namespace std;

int main() {

  BinarySearchTree<int> mytree;
  
  mytree.insert(10);
  mytree.insert(5);
  mytree.insert(15);

  mytree.draw("BStree",0,true);
 
  mytree.insert(21);
  mytree.insert(35);
  mytree.insert(42);
  
  mytree.draw("BStree", 0, true);

  mytree.insert(11);
  mytree.insert(7);
  mytree.insert(29);
  
  mytree.draw("BStree", 0, true);  

  //test functions
  if (mytree.find(11)) 
    cout << "Successfully found 11" << endl;
  else
    cout << "Error: 11 was not found" << endl;
  if (mytree.find(35))    
    cout << "Successfully found 35" << endl;
  else
    cout << "Error: 35 was not found" << endl;

  if (mytree.find(101)) 
    cout << "Error: found 101 in tree" << endl;
  else 
    cout << "Successful did not find 101 in tree" << endl;
  
  //need to test remove!
  
  //make tree big
  mytree.insert(13);
  mytree.insert(19);
  mytree.insert(82);
  mytree.insert(3);
  mytree.insert(6);
  mytree.insert(4);
  mytree.insert(12);
  mytree.insert(15);
  mytree.insert(25);
  mytree.insert(41);
  
  mytree.draw("BStree", 0, true);

  mytree.remove(12);
  cout << "Test remove leaf by removing '12'" << endl;
  mytree.draw("BStree", 0, true);  

  mytree.remove(3);
  cout << "Test remove node with only right child by removing '3'" << endl;
  mytree.draw("BStree", 0, true);
  
  mytree.remove(6);
  cout << "Test remove node with only left child by removing '6'" << endl;
  mytree.draw("BStree", 0, true);
  
  mytree.remove(13);
  cout << "Test remove node with both left and right of height 0 by removing '13'" << endl;
  mytree.draw("BStree", 0, true);
  
  mytree.remove(35);
  cout << "Test remove node with left and right subtrees by removing '35'" << endl;
  mytree.draw("BStree", 0, true);
  
  
  
}
