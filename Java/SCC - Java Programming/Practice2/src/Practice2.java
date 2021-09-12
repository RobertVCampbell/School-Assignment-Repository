import java.io.*;
import java.util.*;
import javax.swing.JOptionPane;

public class Practice2 {
	
	static Scanner console = new Scanner(System.in);

	public static void main(String[] args) throws FileNotFoundException {
		
		int number = 0;
		String numbers = "";
		
		PrintWriter outFile = new PrintWriter("Test.txt");
		
		for(int i = 0; i<10; i++){
			number = (int)(Math.random()*100);
			numbers += number + " ";
			outFile.println(number);
		};	//End For	
		
		outFile.close();
		
		System.out.println(numbers);
		numbers = "";
		
		Scanner inFile = new Scanner(new FileReader("Test.txt"));
		while(inFile.hasNext()){
			number = inFile.nextInt();
			number += 1;
			
			numbers += number + ", ";
		};
		inFile.close();
		
		JOptionPane.showMessageDialog(null, numbers, "Number List", JOptionPane.WARNING_MESSAGE);

	}//End main

}//End Class
