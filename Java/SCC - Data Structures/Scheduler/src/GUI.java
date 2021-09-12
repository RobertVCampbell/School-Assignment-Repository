import java.awt.*;
import javax.swing.*;
public class GUI extends JFrame {
	public GUI(){
		initUI();
	}
	
	private void initUI(){
		
		setTitle("Simple Example");
		setSize(300,200);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
	}

	public static void main(String[] args){
		
		EventQueue.invokeLater(() -> {
			GUI ex = new GUI();
			ex.setVisible(true);
		});
	}
	
	
	
}
