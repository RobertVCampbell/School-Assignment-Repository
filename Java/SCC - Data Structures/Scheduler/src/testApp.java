
public class testApp {

	public static void main(String[] args){
		EmployeeArr test = new EmployeeArr(4);
		
		test.insert("Z", "First");
		test.insert("N", "First");
		test.insert("c", "First");
		test.insert("c", "First");
		test.insert("e", "First");
		test.deleteLast();
		test.insert("F", "First");
		test.deleteFirst();
		test.insert("a", "First");
		test.insert("H", "First");
		test.sortFAlpha();
		test.deleteFirst();
		test.deleteFirst();
		test.deleteFirst();
		test.deleteFirst();
		test.deleteFirst();
	}
}
