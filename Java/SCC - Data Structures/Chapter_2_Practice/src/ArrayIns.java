
// insertSort.java
// demonstrates insertion sort
// to run this program: C>java InsertSortApp
//--------------------------------------------------------------
class ArrayIns{
	private long[] a; // ref to array a
	private int nElems; // number of data items
	//--------------------------------------------------------------
	public ArrayIns(int max) // constructor
	{
		a = new long[max]; // create the array
		nElems = 0; // no items yet
	}
	//--------------------------------------------------------------
	public void insert(long value) // put element into array
	{
		a[nElems] = value; // insert it
		nElems++; // increment size
	}
	//--------------------------------------------------------------
	public void display() // displays array contents
	{
		for(int j=0; j<nElems; j++) // for each element,
			System.out.print(a[j] + " "); // display it
		System.out.println("");
	}
	//--------------------------------------------------------------
	public void insertionSort()
	{
		int in, out;
		for(out=1; out<nElems; out++) // out is dividing line
		{
			long temp = a[out]; // remove marked item
			in = out; // start shifts at out
			
			temp = noDups(in, out, temp);
			
			while(in>0 && a[in-1] >= temp) // until one is smaller,
			{
				a[in] = a[in-1]; // shift item to right
				--in; // go left one position			
			}
			a[in] = temp; // insert marked item
		} // end for
	} // end insertionSort()
	
	//------------------------------------------------------------------
	
	public long noDups(int i, int o, long t){
		//Loop through the array for duplicates
		while(i>0 && a[i-1] >= t) // until one is smaller,
		{
			//Test if the value is a duplicate
			if(a[i-1] == t){
				//Set temp to the last element in the array
				//Decrement the number of elements
				t = a[--nElems];
				
				//Move duplicate outside the array
				a[nElems] = a[o];
				
				//store the last value in the tested position
				a[o] = t;
				
				//Start the noDup loop again, with new value
				i = o;
			}
			--i; // go left one position			
		}
		//Return new or old value to temp and continue the sort
		return t;
	}//End noDups()
} // end class ArrayIns

