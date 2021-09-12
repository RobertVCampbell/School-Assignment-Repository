// queue.java
// demonstrates queue
// to run this program: C>java QueueApp
////////////////////////////////////////////////////////////////
class Queue
	{
	private int maxSize;
	private long[] queArray;
	private int front;
	private int rear;
	private int nItems;
	//--------------------------------------------------------------
	public Queue(int s) // constructor
	{
		maxSize = s;
		queArray = new long[maxSize];
		front = 0;
		rear = -1;
		nItems = 0;
	}
	//--------------------------------------------------------------
	public void insert(long j) // put item at rear of queue
	{
		if(rear == maxSize-1) // deal with wraparound
			rear = -1;
		queArray[++rear] = j; // increment rear and insert
		nItems++; // one more item
	}
	//--------------------------------------------------------------
	public long remove() // take item from front of queue
	{
		long temp = queArray[front++]; // get value and incr front
		if(front == maxSize) // deal with wraparound
			front = 0;
		nItems--; // one less item
		return temp;
	}
	//--------------------------------------------------------------
	public long peekFront() // peek at front of queue
	{	return queArray[front];}
	//--------------------------------------------------------------
	public boolean isEmpty() // true if queue is empty
		{return (nItems==0);}
	//--------------------------------------------------------------
	public boolean isFull() // true if queue is full
		{
		return (nItems==maxSize);
		}
	//--------------------------------------------------------------
	public int size() // number of items in queue
		{
		return nItems;
		}
	//--------------------------------------------------------------
	
	/*Homework project 4.1
	 * Enter a method that displays the queue from first to last
	 * without any indication of if any wraparound occurs
	 *Created by:	Robert Campbell
	 *Created on:	02/15/2017*/
	public void display(){
		//Test if the queue is empty
		if(isEmpty()){
			System.out.println("The queue is empty.");
			return;	}
		
		else{
			//Test if it is full to notify the user
			if(isFull())
				System.out.println("The queue is full.");
			
			System.out.println("The queue contains:");
			
			int temp = front;
			for(int count = 0; count < nItems; count++ ){
				System.out.print(queArray[temp++] + " ");
				if(temp == maxSize) // deal with wraparound
					temp = 0;
			}//End for
			System.out.println("");
		}//end else
	}//End of display()
	
	
} // end class Queue