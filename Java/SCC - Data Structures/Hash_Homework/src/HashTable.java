/* Created by: Robert Campbell
 * Created on: 04/19/2017
 * Purpose: Make a default hash object that can be used as a baseline
 *          template in hash-type data structures
 */
public class HashTable {
	private DataItem[] firstHash; //Hash table
	private int size; //Size of the hash array
	private DataItem nonItem;  //an empty item to overwrite deleted values
	
	//constructor--------------------------------
	public HashTable(int index){
		size = index;
		firstHash = new DataItem[size];
		nonItem = new DataItem();
	}
	
	//function to print out the data in the hash
	public void display(){
		System.out.println("This hash's size = " + size);
		for(int i=0; i<size; i++){
			if(firstHash[i] != null)
				System.out.print(firstHash[i].getData() + " ");
			//else
				//System.out.print("** ");
		}
		System.out.println("");
	}
	
	//function to print out the data and return a String
	public String displayString(){
		System.out.println("This hash's size = "+ size);
		String data = "";
		for(int i=0; i<size; i++){
			if(firstHash[i] != null){
				data += firstHash[i].getData() + " ";
				System.out.print(firstHash[i].getData() + " ");
			//else
				//System.out.print("** ");
			}//end if
		}//end for
		System.out.println("");
		return data;
	}
	
	//Simple hash function to determine the array index in the hash---------------------
	public int hashFunc(int key){
		return key % size;
	}
	
	//Insert function to insert the item into the hash ----------------------------
	public void insert(DataItem item){
		int key = item.getData();
		int hashVal = hashFunc(key);
		
		while(firstHash[hashVal] != null && firstHash[hashVal].getData() != -1){
			++hashVal;
			hashVal %= size;
		}//end while
		firstHash[hashVal] = item;
	}//end insert
	
	//Delete function to remove an item from the hash -------------------------------
	public DataItem delete(int key){
		int hashVal = hashFunc(key);
		
		while(firstHash[hashVal]!= null){//until empty cell
			if(firstHash[hashVal].getData() == key){
				DataItem temp = firstHash[hashVal];
				firstHash[hashVal] = nonItem;
				return temp;
			}//end if
			++hashVal;
			hashVal %= size;
		}//end while
		return null;
	}//end delete
	
	public DataItem find(int key){
		int hashVal = hashFunc(key);
		
		while(firstHash[hashVal]!= null){//until empty cell
			if(firstHash[hashVal].getData() == key){
				return firstHash[hashVal];}//end if
			++hashVal;
			hashVal %= size;
		}//end while
		return null;
	}//end find
}//End class
