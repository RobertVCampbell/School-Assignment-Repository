import java.util.*;


public class RomanToDecimal {
	
	static Scanner console = new Scanner(System.in);

	public static void main(String[] args) {
		
		Roman roman = new Roman();
		Roman romanTest = new Roman("MCIX");
		
		String romanString;
		
		System.out.print("Enter a roman numeral: ");
		romanString = console.nextLine();
		System.out.println();
		
		roman.setRoman(romanString);
		System.out.print("The equivalent of the Roman Numeral " + romanString + " is " );
		roman.printDecimal();
		
		romanTest.printRoman();
		romanTest.printDecimal();
		
	}

}
