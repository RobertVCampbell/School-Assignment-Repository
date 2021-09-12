
//import GUI
import javax.swing.JOptionPane;

public class Example1 {

	public static void main(String[] args) {

		//declare variables
		double radius;
		double area;
		double circumference;
		
		String radiusString;
		String outputStr;
		
		//Create a dialogue box prompting for the radius
		radiusString = JOptionPane.showInputDialog("Enter the radius of the circle: ");
		
		//Cast the radius as double
		radius = Double.parseDouble(radiusString);
		
		//Calculate the radius and the circumference
		area = radius * radius * Math.PI;
		circumference = 2 * radius * Math.PI;
		
		//Convert into a string
		outputStr = "Radius: " + radius + "\n" + 
					"Area: " + String.format("%.2f", area) + " square units\n" +
					"Circumference: " + String.format("%.2f", circumference) + " units\n";
		
		//Code to test output string
		//System.out.print(outputStr);
		
		//Output the result in another dialogue box
		//showMessageDialog(null, string, title, Icon type)
		JOptionPane.showMessageDialog(null, outputStr, "Circle", JOptionPane.INFORMATION_MESSAGE);
		
		//Remember to exit out of the system whenever using J Panes
		System.exit(0);
		
		
		
		
	}

}
