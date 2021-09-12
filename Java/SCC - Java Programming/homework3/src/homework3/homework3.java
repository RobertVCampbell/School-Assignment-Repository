package homework3;
/*Name: 			Robert Campbell
 *Last modified:	09/16/2016
 *Purpose:			Complete the project on P246 #16
 *Details:			Write a program that prompts user for:
 *						Length & width in inches
 *						Type of frame
 *						Frame color
 *						Ask if crowns are wanted and then how many
 *					Output the total cost  
 * */

import java.io.*;

//Import java.util for Scanner
import java.util.*;

public class homework3 {

	//Declaring Constants:
	//The cost for different types of options for a frame
	static final double COLOR_RATE = 0.10;
	static final double R_FRAME_RATE = 0.15;
	static final double F_FRAME_RATE = 0.25;
	static final double CARDBOARD_RATE = 0.02;
	static final double GLASS_RATE = 0.07;
	static final double CROWN_RATE = 0.35;
	
	//The thickness of the frame is a constant 1" regardless of frame type
	static final double THICKNESS = 1;
	
	//Initialize Scanner for keyboard inputs
	static Scanner console = new Scanner(System.in);
	
	public static void main(String[] args) {
		//Declare variables
		String color = " ";
		char frameType, crownChoice;
		double length, width = 0;
		int crownNumber;
		double price = 0.0;
		
		
		//Prompt for length and width (first requirement)
		System.out.print("Enter the length of the frame, in inches: ");
		length = console.nextDouble();
		System.out.println("");
		
		//While loop to catch invalid numbers
		while(length <= 0){
			System.out.println("Please enter a valid length (must be larger than 0): ");
			length = console.nextDouble();
			System.out.println("");
		}//End of while
		
		System.out.print("Enter the width of the frame, in inches: ");
		width = console.nextDouble();
		System.out.println("");
		
		
		//While loop to catch invalid numbers
		while(width <= 0){
			System.out.println("Please enter a valid width (must be larger than 0): ");
			width = console.nextDouble();
			System.out.println("");
		}//End of while
		
		
		/*If the 1" thickness is taken into account for the frames, then two additional lines are needed:
		 * length += 2 * THICKNESS;
		 * width += 2 * THICKNESS;
		 * This change affects all of the later calculations, and thus the price.
		 * This change assumes the customer is providing the size of the image that needs framed rather than
		 * 		the specific size of the frame. This accounts for the thickness of the frame on both sides
		 * 		of the image.
		*/
		
		
		//Prompt for frame type and store as a variable
		System.out.print("Enter the frame type (Regular or Fancy): ");
		frameType = console.next().charAt(0);
		System.out.println("");
		
		
		//Switch to determine the frametype and appropriate price
		do{
		switch(frameType){
		
			case 'r': case 'R':
				price = price + R_FRAME_RATE * ((2 * length) + (2 * width));
				break;
				
			case 'f': case 'F':
				price = price + F_FRAME_RATE * ((2 * length) + (2 * width));
				break;
				
			default:
				System.out.print("Please enter a valid frame type {Regular or Fancy): ");
				frameType = console.next().charAt(0);
				System.out.println("");				
		}//End of switch(frameType)
		}
		while(price == 0);//End of do while(price)
		
		
		//Prompt for the color from the user (part 3)
		System.out.print("Enter the color of the frame:");
		color = console.next();
		System.out.println("");
		
		
		//Test if a color has been entered
		while(color == " "){
			System.out.print("Please enter a color: ");
			color = console.next();
			System.out.println("");
		}//End of while(color)
		
		
		//Test to see if the color is white and adds the appropriate fee
		switch(color){
			
			case "White": case "white":
				break;
			
			default:
				price = price + COLOR_RATE * ((2 * length) + (2 * width));
				break;
		}//End of case(color)
		
		
		
		//Prompt to if the user would like crowns (part 4)
		do{
			System.out.print("Would you like to add crowns? (Yes or No): ");
			crownChoice = console.next().charAt(0);
			System.out.println("");
		
		
			switch(crownChoice){
				case 'y': case 'Y':
					do{
					System.out.print("How many crowns would you like? (must be at least 0): ");
					crownNumber = console.nextInt();
					}
					while(crownNumber < 0);//End of do while(crownNumber)
					price = price + (crownNumber * CROWN_RATE);
					break;
				
				case 'n': case 'N':
					break;
					
				default:
					System.out.println("Please enter a response.");
			
			}//End of switch(crownChoice)
		}
		while(crownChoice != 'y' && crownChoice != 'Y' && crownChoice != 'n' && crownChoice != 'N');
		//End of do while(crownChoice)
		
		//Finish calculating the total
		//Only missing the backing and glass, both rely on the area (length * width)
		price = price + ((length * width) * (GLASS_RATE)) + ((length * width) * (CARDBOARD_RATE));
		
		//Output the total price
		System.out.printf("The total price of your %s frame is $%.2f.%nThank you for your business", color, price);
		
		
		/* several pictures of different sizes
		 White is the base color, any color can be ordered
		 Assume all frames are 1" thick
		 Cost of coloring is $0.10 / in
		 Cost of regular frame is $0.15 / in
		 Cost of a fancy frame is $0.25 / in
		 Cost of putting cardboard behind a picture is $0.02 / in^2
		 Cost of putting glass on top is $0.07 / in^2
		 Optional corner crowns $0.35 / crown (4 on a standard frame)
		*/

	}//End of Main

}//End of Class
