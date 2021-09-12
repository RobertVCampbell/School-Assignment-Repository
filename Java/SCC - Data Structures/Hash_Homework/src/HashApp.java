import java.io.*;
import java.util.*;

class HashApp
{
	static Scanner console = new Scanner(System.in);
	
	public static void main(String[] args) throws IOException
	{	
		DataItem aDataItem;
		int aKey, size, n, keysPerCell;
	//get sizes
		System.out.print("Enter size of hash table: ");
		size = console.nextInt();
		System.out.print("Enter initial number of items: ");
		n = console.nextInt();
		keysPerCell = 10;
	//make table
		HashTable theHashTable = new HashTable(size);
		for(int j=0; j<n; j++) // insert data
		{
			aKey = (int)(java.lang.Math.random() *
					keysPerCell * size);
			aDataItem = new DataItem(aKey);
			theHashTable.insert(aDataItem);
		}
		while(true) // interact with user
		{
			System.out.print("Enter first letter of ");
			System.out.print("show, insert, delete, or find: ");
			String choice = console.next();
			switch(choice.charAt(0))
			{
			case 's':
				theHashTable.display();
				break;
			case 'i':
				System.out.print("Enter key value to insert: ");
				aKey = console.nextInt();
				aDataItem = new DataItem(aKey);
				theHashTable.insert(aDataItem);
				break;
			case 'd':
				System.out.print("Enter key value to delete: ");
				aKey = console.nextInt();
				theHashTable.delete(aKey);
				break;
			case 'f':
				System.out.print("Enter key value to find: ");
				aKey = console.nextInt();
				aDataItem = theHashTable.find(aKey);
				if(aDataItem != null)
				{
					System.out.println("Found " + aKey);
				}
				else
					System.out.println("Could not find " + aKey);
				break;
			default:
				System.out.print("Invalid entry\n");
			} // end switch
		} // end while
	} // end main()

} // end class HashTableApp