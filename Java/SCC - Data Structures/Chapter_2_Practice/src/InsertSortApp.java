//Copied from Data Structures and Algorithms 2nd Edition
//P. 101 fig 3.3
/*Homework Project:
	To the insertSort.java program (Listing 3.3), add a method called noDups() that
	removes duplicates from a previously sorted array without disrupting the order.
	(You can use the insertionSort() method to sort the data, or you can simply
	use main() to insert the data in sorted order.) One can imagine schemes in
	which all the items from the place where a duplicate was discovered to the end
	of the array would be shifted down one space every time a duplicate was
	discovered, but this would lead to slow O(N2) time, at least when there were a
	lot of duplicates. In your algorithm, make sure no item is moved more than
	once, no matter how many duplicates there are. This will give you an algorithm
	with O(N) time.
	
	Changes added by: Robert Campbell
		- Added duplicate insert lines in main()
		- Changes to ArrayIns class
		 + 
	*/

class InsertSortApp{
	public static void main(String[] args){
		int maxSize = 100; // array size
		
		ArrayIns arr; // reference to array
		
		arr = new ArrayIns(maxSize); // create the array
		
		arr.insert(77); // insert 10 items
		arr.insert(99);
		arr.insert(44);
		arr.insert(55);
		arr.insert(55);
		arr.insert(55);
		arr.insert(22);
		arr.insert(88);
		arr.insert(77);
		arr.insert(11);
		arr.insert(00);
		arr.insert(66);
		arr.insert(33);
		arr.insert(55);
		arr.display(); // display items
		
		arr.insertionSort(); // insertion-sort them
		
		arr.display(); // display them again
	} // end main()
} // end class InsertSortApp
////////////////////////////////////////////////////////////////