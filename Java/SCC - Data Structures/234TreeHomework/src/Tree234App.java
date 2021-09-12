import java.util.*;

class Tree234App
	{
	static Scanner console = new Scanner(System.in);
	
	public static void main(String[] args){
		long value;
		Tree234 theTree = new Tree234();
		theTree.insert(50);
		theTree.insert(40);
		theTree.insert(60);
		theTree.insert(30);
		theTree.insert(70);
		theTree.insert(5);
		theTree.insert(4);
		theTree.insert(6);
		theTree.insert(3);
		theTree.insert(7);
		theTree.insert(78);
		theTree.insert(48);
		theTree.insert(67);
		theTree.insert(37);
		theTree.insert(77);
		theTree.insert(500);
		theTree.insert(400);
		theTree.insert(600);
		theTree.insert(300);
		theTree.insert(700);
		while(true)
			{
			System.out.print("Enter first letter of ");
			System.out.print("show, insert, or find: ");
			char choice = console.next().charAt(0);
			switch(choice)
				{
				case 's':
					theTree.displayTree();
					break;
				case 'i':
					System.out.print("Enter value to insert: ");
					value = console.nextInt();
					theTree.insert(value);
					break;
				case 'f':
					System.out.print("Enter value to find: ");
					value = console.nextInt();
					int found = theTree.find(value);
					if(found != -1)
						System.out.println("Found "+value);
					else
						System.out.println("Could not find "+value);
					break;
				default:
					System.out.print("Invalid entry\n");
				} // end switch
			} // end while
		} // end main()
	} // end class Tree234App