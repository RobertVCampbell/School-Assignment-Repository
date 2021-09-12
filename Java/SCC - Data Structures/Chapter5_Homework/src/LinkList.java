
public class LinkList {
	private Link first;
	//private Link last;
	private Link priFirst;
	//private Link priLast;
	
	public LinkList(){
		first = null;
		priFirst = null;
		}//End constructor
	
	public void insert(long d){
		Link temp;
		Link x = new Link(d);
		if(first == null){
			first = x;
			return;
		}
		temp = first;
		if(d < first.getData()){
			first = x;
			first.next = temp;
			return;
			}//end else if
		while(temp != null){
			if(temp.next == null || d < temp.next.getData()){
				x.next = temp.next;
				temp.next = x;
				return;
			}//end if
			temp = temp.next;
		}//end while
		return;
	}
	
	public void insertPri(long d){
		Link temp;
		Link x = new Link(d);
		if(priFirst == null){
			priFirst = x;
			return;
		}
		temp = priFirst;
		if(d < priFirst.getData()){
			priFirst = x;
			priFirst.next = temp;
			return;
			}//end else if
		while(temp != null){
			if(temp.next == null || d < temp.next.getData()){
				x.next = temp.next;
				temp.next = x;
				return;
			}//end if
			temp = temp.next;
		}//end while
		return;
	}//end insertPri
	
	public void remove(){
		if(isEmpty())
			return;
		Link temp;
		if(priFirst != null){
			temp = priFirst;
			System.out.println("Priority value: " + temp.getData());
			priFirst = priFirst.next;
		}//end if
		else{
			temp = first;
			System.out.println("Value: " + temp.getData());
			first = first.next;
		}//end else
	}//end remove
	
	public void display(){
		Link temp;
		if(isEmpty())
			System.out.println("There is no data.");
		if(priFirst != null){
			temp = priFirst;
			System.out.println("Priority values: ");
			while(temp != null){
				System.out.print(temp.getData() + " ");
				temp = temp.next;
			}//end while
			System.out.println("|");
		}//end if
		if(first != null){
			temp = first;
			System.out.println("Non-priority values: ");
			while(temp != null){
				System.out.print(temp.getData() + " ");
				temp = temp.next;
			}//end while
			System.out.println("|");
		}//End if
		return;
	}//End display
		
	public Link getFirst(){
		return first;}
	
	public Link getPriFirst(){
		return priFirst;
	}
	
	public void setFirst(Link f){
		first = f;}
	
	
	
	public boolean isEmpty(){
		return (first==null && priFirst == null);}
	
}
