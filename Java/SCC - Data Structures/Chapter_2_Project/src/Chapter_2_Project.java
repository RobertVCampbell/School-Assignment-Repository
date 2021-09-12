
public class Chapter_2_Project {

	public static void main(String[] args) {
		String one = "ba";
		String two = "aa";
		
		System.out.println(one == two);
		System.out.println(one.compareTo(two));
		System.out.println(one.compareToIgnoreCase(two));
		System.out.println(one.toUpperCase().compareTo(two.toUpperCase()));
		
	}

}
