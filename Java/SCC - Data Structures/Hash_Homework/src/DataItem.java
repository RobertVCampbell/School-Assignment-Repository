/* Created by: Robert Campbell
 * Created on: 04/19/2017
 * Purpose: Make a default item object that can be used as a baseline
 *          template in hash-type data structures
 */
public class DataItem {
	//Data the hash item contains-----------------------
	private int keyValue;
	
	//Constructors----------------------------
	public DataItem(int in){
		keyValue = in;
	}
	
	public DataItem(){
		
	}
	
	//retrieve the key---------------------------------------
	public int getData(){
		return keyValue;}
	
	//End of Default Data Item
}
