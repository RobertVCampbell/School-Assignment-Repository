
class X
{
	private int maxSize; 
	private long[] theStruc;
	private int last;
	
	public X(int s) 
	{
		maxSize = s; 
		theStruc = new long[maxSize]; 
		last = 0;
	}
	
	public void put(long j) 
	{
		theStruc[last++] = j;
	}
	
	public long take() 
	{
		return theStruc[--last];
	}
	
	public long peek() 
	{
		return theStruc[last];
	}
	
	public boolean isEmpty() 
	{
		return (last == 0);//Corrected so that it will read as empty when it is empty
	}
	
	public boolean isFull() 
	{
		return (last == maxSize); //Will have it return full when it is full
	}

}

