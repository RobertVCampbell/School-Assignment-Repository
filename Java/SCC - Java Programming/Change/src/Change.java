

import java.util.*;

public class Change {

	static Scanner console = new Scanner(System.in);
	
	//Creating constants for each type of coin (penny's would be redundant)
	static final int HALFDOLLAR = 50;
	static final int QUARTER = 25;
	static final int DIME = 10;
	static final int NICKLE = 5;
	
	public static void main(String[] args) {
		//Declare variables
		int change;
		
		/*Enter value*/
		System.out.print("Enter the change in cents: ");
		change = console.nextInt();
		System.out.println();
		
		System.out.println("The change you entered is: " + change);
		
		/*Start outputting the coins that can add up to the entered value
		 * Output the amount of a type of coin with value / constant
		 * "value = value % constant" will updates the value to remove the previously
		 * calculated number of coins*/
		System.out.println("The number of half dollars is: " + (change / HALFDOLLAR));
		change = change % HALFDOLLAR;
		
		System.out.println("The number of quarters is: " + (change / QUARTER));
		change = change % QUARTER;
		
		System.out.println("The number of dimes is:" + (change / DIME));
		change = change % DIME;
		
		System.out.println("The number of nickles is:" + (change / NICKLE));
		change = change % NICKLE;
		
		System.out.println("The number of pennies is:" + change);
	

	}//End of Main

}//End of Class
