
public class Person {
	private String first = "";
	private String middle = "";
	private String last = "";
	
	
	//Constructor functions, default sets empty Strings
	//iterations to receive first; first & last; first, middle, and last
	//A duplication constructor which will take another Person object and store it's values
	public Person(){
		first = "";
		middle = "";
		last = "";
	}
	
	public Person(String firstName){
		first = firstName;
	}
	
	public Person(String firstName, String lastName){
		first = firstName;
		last = lastName;
	}
	
	public Person(String firstName, String middleName, String lastName){
		first = firstName;
		middle = middleName;
		last = lastName;
	}
	
	public Person(Person dup){
		makeCopy(dup);
	}
	//- - - - - - - - - - - - - - - - - - - End of constructors - - - - - - - - - - - - - - - - - - - - 
	
	
	//Methods to store the objects name
	//iterated for first, middle, and last
	void setFirst(String firstName){
		first = firstName;
	}
	
	void setMiddle(String middleName){
		middle = middleName;
	}
	
	void setLast(String lastName){
		last = lastName;
	}
	//- - - - - - - - - - - - - - End of set methods - - - - - - - - - - - - - - 
	
	
	//Methods to return the private Strings in the object
	//iterated for each individual name, and one to concatenate
	String getName(){
		String name = new String(first + " " + middle + " " + last);
		return name;
	}
	
	String getFirst(){
		return first;
	}
	
	String getMiddle(){
		return middle;
	}
	
	String getLast(){
		return last;
	}
	//- - - - - - - - - - - - - - End of get methods - - - - - - - - - - - - - - 
	
	
	
	//Boolean series checking if an entered string is equal to the stored name
	//Iterated for first, middle, and last name
	boolean firstCheck(String testName){
		return testName.equals(first);		
	}
	
	boolean middleCheck(String testName){
		return testName.equals(middle);		
	}
	
	boolean lastCheck(String testName){
		return testName.equals(last);		
	}
	//- - - - - - - - - - - - - - End of Check methods - - - - - - - - - - - - - - 
	
	
	//Check to see if the first name is the same,
	//If it is, check the middle, and if that is check last
	//if it falls out anywhere, return false, if it makes it through return true
	boolean equals(Person check){
		if(first.equals(check.getFirst())){
			if(middle.equals(check.getMiddle())){
				if(last.equals(check.getLast())){
					return true;
				}
			}
		}
		return false;
	}//- - - - - - - - - - - - - - End of equals() - - - - - - - - - - - - - - 
	
	
	//Function to copy the full name from a passed Person object
	void makeCopy(Person copy){
		first = copy.getFirst();
		middle = copy.getMiddle();
		last = copy.getLast();
	}//- - - - - - - - - - - - - - End of makeCopy() - - - - - - - - - - - - - - 
	
	

}/*- - - - - - - - - - - - - - - - - - - - - - - - - - - -  End of Class - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
