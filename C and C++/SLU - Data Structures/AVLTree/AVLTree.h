#include "BinarySearchTree.h"
#include <cmath>
#include <iostream>
using namespace std;

template <typename ItemType>
class AVLTree : public BinarySearchTree<ItemType> {
  
protected:
  
  /** function to set the height correctly **/
  void _setHeight(typename BinaryTree<ItemType>::Iterator position) {
  }//end of _setHeight
  
  bool _isBalanced(typename BinaryTree<ItemType>::Iterator position) {
  }
  
  typename BinaryTree<ItemType>::Iterator _getHigherChild(typename BinaryTree<ItemType>::Iterator position) {
    //get left child's height
    int leftheight = -1;
    if (position.hasLeftChild())
      leftheight = BinaryTree<ItemType>::getAux(position.left());
    //get left child's height
    int rightheight = -1;
    if (position.hasRightChild())
      rightheight = BinaryTree<ItemType>::getAux(position.right()); 
    
    if (leftheight > rightheight)
      return position.left();
    else
      return position.right();
  }
  
public:
  
  void insert(const ItemType& value) {
    //call BinarySearchTree insert to put new node in first
    typename BinaryTree<ItemType>::Iterator it = BinarySearchTree<ItemType>::insert(value);
    
  } //end insert

  void remove(const ItemType& value) {

  //homework?

  } //end remove
  
}; //end AVLTree class
