import java.util.Scanner;
public class Driver{
	
	public static void printMenu(){

		System.out.println("1. Search by first name");
		System.out.println("2. Search by last name");
		System.out.println("3. Search by phone number");
		System.out.println("4. Load new phone book");
		System.out.println("5. Exit");

	}
	
	public static int menuSelect(){

		Scanner scanner = new Scanner(System.in);
		int sel = scanner.nextInt();
		return sel;
		
	}
	
	public static void searchFirst(PhoneBook book){
		Scanner s = new Scanner(System.in);
		System.out.println("Enter the first name: ");
		String first = s.nextLine();		

		System.out.println();

		Person[] match = book.searchByFirst(first);
		if (match.length == 0)
		{
		   System.out.println("No matches found");
		}

		for (int i = 0; i < match.length; i++)
		{
			System.out.println(match[i]); 
		}		
		System.out.println();

	}
	
	public static void searchLast(PhoneBook book){
		Scanner s = new Scanner(System.in);
		System.out.println("Enter the last name: ");
		String last = s.nextLine();		
		System.out.println();
		Person[] match = book.searchByLast(last);
		if (match.length == 0)
		{
		   System.out.println("No matches found");
		}

		for (int i = 0; i < match.length; i++)
		{
			System.out.println(match[i]); 
		}		
		System.out.println();		
	}
	
	public static void searchNum(PhoneBook book){
		Scanner s = new Scanner(System.in);
		System.out.println("Enter the phone number: ");
		String num = s.nextLine();
		System.out.println();
		
		Person[] match = book.searchByNum(num);
		if (match.length == 0)
		{
		   System.out.println("No matches found");
		}

		for (int i = 0; i < match.length; i++)
		{
			System.out.println(match[i]); 
		}
		System.out.println();		
	}
	
	public static PhoneBook load(){
		Scanner s = new Scanner(System.in);
		System.out.println("Enter the filename: ");
		String file = s.nextLine();
		
		PhoneBook book = new PhoneBook(file);
		
		return book;
		
	}
	
	
	
	public static void main(String []args){
		PhoneBook book = new PhoneBook("phoneNumbers.csv");
		
		boolean quit = false;
		
		while(!quit)
		{
			printMenu();
			int sel = menuSelect();
			switch(sel)
			{
				case 1:
					searchFirst(book);
					break;
				case 2:
					searchLast(book);
					break;
				case 3:
					searchNum(book);
					break;
				case 4:
					book = load();
					break;
				case 5:
					quit = true;
					break;

			}
			
			
		}
		
		
	}
	
}