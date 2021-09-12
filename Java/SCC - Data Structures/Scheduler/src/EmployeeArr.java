/*Created by:	Robert Campbell
 *Created on:	02/16/17
 *Purpose:		To handle an array of Employee objects
 *					+ Sort in alphabetic order
 *						- First name
 *						- Last name
 *					+ Sort by hours scheduled
 *					+ Sort by priority flag*/

public class EmployeeArr {
	
	private Employee[] roster;
	private Employee temp;
	private int first, last;
	private int numElems;
	//private int priStart, priEnd;
	private int max;
	
	public EmployeeArr(int m){
		max = m;
		roster = new Employee[max];  
		first = 0;
		last = -1;
		numElems = 0;
		//priStart = 0;
		//priEnd = -1;				
	}//End of constructor
	
	//insert a new Employee into roster
	public void insert(String f, String l){
		if(isFull()){
			System.out.println("roster is full");
			return;}
		if(++last == max){
			last = 0;}//Increment last, and handle wrap-around
		roster[last] = new Employee(f , l);
		numElems += 1;
	}//End of insert()
	
	public void deleteLast(){
		if(isEmpty()){
			System.out.println("roster is empty");
			return;}
		if(--last < 0){
			last = max - 1;}//Decrement last and deal w/ wrap around
		numElems -= 1;}//Decrement the number of elements
	
	public void deleteFirst(){
		if(isEmpty()){
			System.out.println("roster is empty");
			return;}
		if(++first > max - 1){
			first = 0;}//Increment first and deal w/ wrap around
		numElems -= 1;}//Decrement the number of elements
	
	public boolean isEmpty(){
		if(numElems == 0)
			return true;
		return false;}//Test to see if there are any Elements in the table
	
	public boolean isFull(){
		if(numElems == max)
			return true;
		return false;}//Test to see if the array has reached it's max size
	
	public void sortFAlpha(){
		int index, o, loop, prior;
		for(o = 1; o < numElems - 1; o++){
			
			//Set the loop counter to equal which iteration the for loop is on
			loop = o;
			
			//Set the test index to start at the object being tested
			//Logic to handle wrap around
			if(o + first > max)
				index = (o + first) - max;
			else
				index = o + first;
			
			//Set the prior index to test position -1
			//Logic to handle wrap around
			if(index - 1 <0)
				prior = max;
			else
				prior = index - 1;
			
			//Pull out the object to test
			temp = roster[index];
			
			//if it is not on the last object and the first name is earlier in the alphabet
			while(loop > 0 && roster[prior].getFirst().compareToIgnoreCase(temp.getFirst()) > 0){
				//shift all elements left one item
				roster[index] = roster[prior];
				
				//Set test index to index - 1
				index = prior;
				//Set prior to the new index - 1
				//Logic to handle wrap around
				if(index - 1 <0)
					prior = max;
				else
					prior = index - 1;

				//Decrement the loop variable
				--loop;
				
			}//End of while
			
			//Set the test element to it's appropriate position
			roster[index] = temp;
			
		}//end of for
		
	}//End of sortFAlpha()
	
	
	
	
	
}//End of class
