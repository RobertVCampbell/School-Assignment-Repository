
public class Link {
	private long dData;
	public Link next;
	public Link previous;
	
	public Link(long d){
		dData = d;
		next = null;
		previous = null;
	}//end constructor
	
	public long getData(){
		return dData;}
	
	public void displayLink(){
		System.out.println(dData+" ");
	}
}//end class
