/*
 * Created by: Robert Campbell
 * Created on: 11/01/2016
 * Purpose: Create a program to test the person class
*/

import java.util.*;

public class Chatper8_Homework {

	static Scanner console = new Scanner(System.in);
	
	public static void main(String[] args) {
		final Person named = new Person("Robert");
		final Person namedLast = new Person("Not", "Robert");
		final Person namedMiddle = new Person("Some","Third","Name");
		final Person namedCopy = new Person(namedMiddle);
		
		//Check the equals function and the copy constructor/function
		if(namedCopy.equals(namedMiddle))
			System.out.println("Copy complete");
		else
			System.out.println("Not a copy");
		
		//Check the get functions
		System.out.println(named.getFirst());
		System.out.println(named.getMiddle());
		System.out.println(named.getLast());
		System.out.println(namedCopy.getName());
		
		//Check the set functions
		named.setFirst("Not");
		named.setLast("Robert");
		named.setMiddle("new");
		System.out.println(named.getName());
		
		
		//Test each of the name checks
		if(named.firstCheck(namedLast.getFirst()))
			System.out.println("First Name is now same");
		else
			System.out.println("First names are different");
		
		if(named.middleCheck(namedLast.getMiddle()))
			System.out.println("Middle names are the same");
		else
			System.out.println("Middle names are different.");
		
		if(named.lastCheck(namedLast.getLast()))
			System.out.println("Last names are the same");
		else
			System.out.println("Last names are different.");
		
		
		//Check the full name constructor
		System.out.println(namedMiddle.getName());
		
		
		

	}//- - - - - - - - - - - - - - End of Main - - - - - - - - - - - - - - 

}//- - - - - - - - - - - - - - - - - - - - - - - - - - - - End of Class - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
