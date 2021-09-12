public class QuickSort2App{
	static final int MAX = 16;
	public static void main(String[] args)
		{
		ArrayIns arr; // reference to array
		arr = new ArrayIns(MAX); // create the array
		
		for(int j=0; j<MAX; j++) // fill array with
		{ // random numbers
			long n = (int)(java.lang.Math.random()*99);
			arr.insert(n);
		}
		arr.display(); // display items
		arr.quickSort(); // quicksort them
		arr.display(); // display them again
	} // end main()
} // end class QuickSort2App