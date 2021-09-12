public class ItemTable {
	private Item[] itemHash; //Hash table
	private int size; //Size of the hash array
	private Item nonItem;  //an empty item to overwrite deleted values
	
	
	//constructor--------------------------------
	public ItemTable(int index){
		size = index;
		itemHash = new Item[size*2];
		nonItem = new Item();
	}
	
	//function to print out the data in the hash
	public void display(){
		Order temp;
		//System.out.println("This hash's size = " + size);
		for(int i=0; i<size; i++){
			if(itemHash[i] != null){
				System.out.println("Model");
				//Number + 5 _ (11 total), Description + 18 (29 total), Cost + 3 (7), Price + 2 (7)
				//On Hand + 0 (7)
				System.out.println("Number     Description                  Cost   Price  On Hand");
				System.out.println("---------------------------------------------------------------");
				itemHash[i].display();
				temp = itemHash[i].first;
				while(temp != null){
					temp.display();
					temp = temp.next;
				}
				System.out.println("");
			}
			
		}
		System.out.println("");
	}
	
	/*//function to print out the data and return a String
	public String displayString(){
		System.out.println("This hash's size = "+ size);
		String data = "";
		for(int i=0; i<size; i++){
			if(itemHash[i] != null){
				data += itemHash[i].getKey() + " ";
				System.out.print(itemHash[i].getKey() + " ");
			//else
				//System.out.print("** ");
			}//end if
		}//end for
		System.out.println("");
		return data;
	}*/
	
	//Simple hash function to determine the array index in the hash---------------------
	public int hashFunc(int key){
		return key % size;
	}
	
	//Insert function to insert the item into the hash ----------------------------
	public void insert(Item item){
		int key = item.getKey();
		int hashVal = hashFunc(key);
		
		while(itemHash[hashVal] != null && itemHash[hashVal].getKey() != -1
				&& item.model != itemHash[hashVal].model){
			++hashVal;
			hashVal %= size;
		}//end while
		itemHash[hashVal] = item;
	}//end insert
	
	//Delete function to remove an item from the hash -------------------------------
	public Item delete(int key){
		int hashVal = hashFunc(key);
		
		while(itemHash[hashVal]!= null){//until empty cell
			if(itemHash[hashVal].getKey() == key){
				Item temp = itemHash[hashVal];
				itemHash[hashVal] = nonItem;
				return temp;
			}//end if
			++hashVal;
			hashVal %= size;
		}//end while
		return null;
	}//end delete
	
	public Item find(int key){
		int hashVal = hashFunc(key);
		
		while(itemHash[hashVal]!= null){//until empty cell
			if(itemHash[hashVal].getKey() == key){
				return itemHash[hashVal];}//end if
			++hashVal;
			hashVal %= size;
		}//end while
		return null;
	}//end find
	
	public void insObj(String f, String g, long h, double i){
		int index = findItem(g);
		if(index != -1)
			itemHash[index].insert(f, g, h, i);
		
	}
	
	public int findItem(String g){
		int key =  Integer.parseInt(g.substring(3));
		int hashVal = hashFunc(key);
		
		while(itemHash[hashVal]!= null){//until empty cell
			if(itemHash[hashVal].getKey() == key){
				return hashVal;
			}//end if
			++hashVal;
			hashVal %= size;
		}//end while
		System.out.println("Model Number " + g + " not found");
		return -1;
	}
	
	public void search(String g){
		int index = findItem(g);
		if(index != -1){
			Order temp = new Order();
			//System.out.println("This hash's size = " + size);
			if(itemHash[index] != null){
					System.out.println("Model");
					//Number + 5 _ (11 total), Description + 18 (29 total), Cost + 3 (7), Price + 2 (7)
					//On Hand + 0 (7)
					System.out.println("Number     Description                  Cost   Price  On Hand");
					System.out.println("---------------------------------------------------------------");
					itemHash[index].display();
					temp = itemHash[index].first;
					while(temp != null){
						temp.display();
						temp = temp.next;
					}
					System.out.println("");
				}
			}
			System.out.println("");
		}
	}//End class
