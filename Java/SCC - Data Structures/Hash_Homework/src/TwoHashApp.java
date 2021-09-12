import java.util.*;

public class TwoHashApp {
	static Scanner console = new Scanner(System.in);
	static int SMALL = 100;
	static int LARGE = 1000;
	static int ITEMS = 75;
	
	public static void main(String[] args) {
		DataItem aDataItem;
		
		HashTable firstTable = new HashTable(SMALL);
		HashTable secondTable = new HashTable(LARGE);
		
		String dataString = "";
		int key;
		
		
		for(int i = 0; i < ITEMS; i++){
			key = (int)(java.lang.Math.random() * SMALL * ITEMS);
			aDataItem = new DataItem(key);
			firstTable.insert(aDataItem);
		}//end of for
		dataString = firstTable.displayString();
		String[] data = dataString.split(" ");

		for(int i = 0; i < data.length; i++){
			aDataItem = new DataItem(Integer.parseInt(data[i]));
			secondTable.insert(aDataItem);
		}//end of for
		
		secondTable.display();
			
		
		
	}//end of main

}//end of class
