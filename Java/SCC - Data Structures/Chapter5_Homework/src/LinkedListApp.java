import java.util.*;

public class LinkedListApp {
	static Scanner console = new Scanner(System.in);
	
	public static void main(String[] args){
		LinkList list = new LinkList();
		int value = 0;
		int priValue = 0;
		boolean cont = true;
		
		for(int i = 0; i < 10; i++){
			int ran = (int)(java.lang.Math.random() * 100 * 101);
			ran %= 2;
			//If a random number is even, then make the value priority
			if(ran == 0){
				priValue = (int)(java.lang.Math.random() * i * 99);
				list.insertPri((long)(priValue));
			}//end if
			
			//if it is odd, it will insert a non-priority value
			else{
				value = (int)(java.lang.Math.random() * i * 99);
				list.insert((long)(value));
			}//end else
		}//end for
		
		while(cont){
		System.out.print("Please enter the first letter of\n"
				+ "[s]how, [i]nsert, [r]emove, or [e]xit: ");
		char choice = console.next().charAt(0);
		System.out.println("");
		
		
		switch(choice){
			case 's':
			case 'S':
				list.display();
				break;
			
			case 'i':
			case 'I':
				System.out.print("Is this value priority?\n"
						+ "Enter the first letter of [y]es or [n]o:  ");
				char priority = console.next().charAt(0);
				System.out.println("");
				
				if(priority == 'y' || priority == 'Y'){
					System.out.print("Please enter the priority value: ");
					priValue = console.nextInt();
					System.out.println("");
					list.insertPri((long)(priValue));
				}
				else if(priority == 'n' || priority == 'N'){
					System.out.print("Please enter the value: ");
					value = console.nextInt();
					System.out.println("");
					list.insert((long)(value));
				}
				else
					System.out.println("INVALID INPUT");
				break;
			
			case 'r':
			case 'R':
				list.remove();
				break;
				
			case 'e':
			case 'E':
				cont = false;
				break;
				
			default:
				System.out.println("INVALID INPUT");
		}//End switch
		}//End while
		
		
	}

}
