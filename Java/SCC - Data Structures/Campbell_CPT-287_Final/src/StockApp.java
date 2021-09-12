import java.io.*;
import java.util.*;


public class StockApp {
	static Scanner console = new Scanner(System.in);
	static int MAX = 1000;

	public static void main(String[] args) {
		Item anItem;
		//Order anOrder;
		String model = "";
		String customer = "";
		
		int index, quantity;
		double  cost, price;
		boolean cont = true;
		char ans;
		
		
		ItemTable stock = new ItemTable(MAX);
		
		anItem = new Item("abc123", "Mother Board 4 bit", 49.99, 59.99, 5);
		stock.insert(anItem);
		anItem = new Item("jkl123", "Mother Board 32 bit", 79.99, 89.99, 4);
		stock.insert(anItem);
		
		
		stock.insObj("MATC","abc123", 4, 239.96);
		stock.insObj("SCC","abc123",2,119.98);
		stock.insObj("MCW","jkl123",2,119.98);
		
		System.out.println("This program can tracks warehouse inventory and sales.");
		while(cont){
			String description = "";
			System.out.print("Please enter the first letter of [a]dd, [f]ind, [e]xit or [d]isplay all: ");
			ans = console.next().charAt(0);
			System.out.println("");
			
			switch(ans){
				case 'A':
				case 'a':
					System.out.print("Please enter the model number you would like to add (3 letters followed by 3 numbers): ");
					model = console.next();
					System.out.println("");
					index = stock.findItem(model);
					if(index == -1)
					{	System.out.println("This model number is currently not in our database, please follow the prompts to add it.");
						System.out.print("Please enter a short description [e.g. '4 BIT MOTHER BOARD']: ");
						description = console.nextLine();
						
						System.out.println("Please enter the cost to purchase our stock: ");
						cost = console.nextDouble();
						
						System.out.print("Please enter the price the stock is listed for: ");
						price = console.nextDouble();
						
						System.out.print("Please enter how many we have in stock: ");
						quantity = console.nextInt();
						
						System.out.println("Thank you. Adding stock.");
						
						stock.insert(new Item(model, description, cost, price, quantity));
						
						stock.search(model);						
						}
					else{
						System.out.println("Looks like this model is on file. Let's add a new order: ");
						System.out.print("Please enter the customer id [e.g. 'MATC']: ");
						customer = console.next();
						System.out.print("Please enter the quantity ordered: ");
						quantity = console.nextInt();
						System.out.print("Please enter the total cost of the order: ");
						cost = console.nextDouble();
						
						System.out.println("Thank you. Creating order record.");
						
						stock.insObj(customer, model, quantity, cost);
						
					}
					break;
					
				case 'f':
				case 'F':
					System.out.print("Please enter the model number that you would like records for [3 letters, 3 numbers]: ");
					model = console.next();
					stock.search(model);
					break;
					
				case 'd':
				case 'D':
					stock.display();
					break;
					
				case 'e':
				case 'E':
					cont = false;
					break;
				
				default:
					System.out.println("That is not a valid entry.");
			}
			
		}
		

	}

}
