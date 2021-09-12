import java.util.*;

public class Multiplication {
	static Scanner console = new Scanner(System.in);
	public static void main(String[] args) {
		int x,y,z;
		boolean cont = true;
		
		while(cont){
			System.out.println("Please enter two integers separated by a space: ");
			x = console.nextInt();
			y = console.nextInt();
			z = mult(x,y);
			System.out.println(x + " * " + y + " = " + z);
			System.out.println("Would you like to multiply more numbers? Yes or No?");
			char choice = console.next().charAt(0);
			switch(choice){
				case 'n':
				case 'N':
					cont = false;
					break;
				case 'y':
				case 'Y':
				default:
					cont = true;
					break;
			}
		}//end while
		
		
		
	}
	
	static public int mult(int a, int b){
		if(b > 1){
			return a + mult(a, b-1 );			
		}//end if
		return a;
	}

}
