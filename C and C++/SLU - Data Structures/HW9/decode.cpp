#include "BinaryTree.h"
#include "BitStreams.h"
#include "VariousExceptions.h"
#include <iostream>
#include <string>
using namespace std;

void create(BinaryTree<int>::Iterator it, InBitStream* infile, BinaryTree<int>& atree){
	//cout << "Recursion level: " << recur << endl;
	int i = infile->read();
	//cout << "read the next input value: " << i << endl;
	//cout << "Iterator is root: " << it.isRoot() << endl;

	if(i==0){
	//	cout << "Creating left child from level " << recur << endl;
		atree.insertAsLeftChild(it,0);
	//	cout<< "Inserted a child node." << endl;	
		create(it.left(),infile, atree);
	//	cout << "Creating right child from level " << recur << endl;
		atree.insertAsRightChild(it,0);
		create(it.right(),infile, atree);
	}//End of 'root' if
	else if(i == 1){
	//	cout << "writing a value" << endl;
		*it = infile->read(9);
	//	cout << "Stored value of " << *it << " at level " << recur << endl;
	}//end of coded tree
return;
}//end of create function


bool decode(BinaryTree<int>::Iterator it, InBitStream* infile, OutBitStream* outfile, BinaryTree<int>& atree){
	bool end;
	if(!it.isLeaf()){
	  int i = infile->read();
	  if(i == 0){
	    //cout << "Left, ";
	    end = decode(it.left(), infile, outfile, atree);
	  }
	  else{
	    //cout << "Right, ";
	    end = decode(it.right(), infile, outfile, atree);
	    
	  }
	  
	}//end of internal node logic
	
	else{
	  if(*it == 256){
	    //cout << "EOM" << endl;
	    return true; //means end of message and it should be the end of file, so exit the recursion
	    }    //leaving this off let the file be written in 8-bit ascii
	  else{
	    //cout << (char)*it << endl;
	    outfile->write(*it, 8);
	    return false;
	  }
	  
	}//end of external node logic
    return end;
}//end of decode function


int main(){
	//int i = 1;
	bool EOM = false;
	BinaryTree<int> tree;
	tree.createRoot(0);
	BinaryTree<int>::Iterator iter = tree.root();
	InBitStream inputfile;
	OutBitStream outputfile;
	string inname;
	string outname;
	
	//cout << "What is the name of the file to read? " << endl;
	cin >> inname;
	//cout << "The file name is: " << inname+".myzip" << endl;
	inputfile.open(inname+".myzip");
	
	//cout << "Iterator is root: " << iter.isRoot() << endl;
	
	//cout<< "What is the name of the file to write?" << endl;
	cin >> outname;
	//cout << "The file name is: " << outname << endl;
	outputfile.open(outname);

	create(iter, &inputfile, tree);
	//tree.draw("Decode", 0, true);
	
	while(!inputfile.eof() && !EOM){
	  //cout << "Writing character: " << i << endl;
	  iter = tree.root();
	  EOM = decode(iter, &inputfile, &outputfile, tree);
	  //i++;
	}
	
	inputfile.close();
	outputfile.close();
	
return 0;
}//end of main
