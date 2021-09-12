import javax.swing.*;
import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.Dimension;

public class GUIExample
{
   public static void main(String[] args)
   {
      JFrame frame = new JFrame("Hunting Game");
      // operation to do when the window is closed
      frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

      JPanel mainPanel = new JPanel();
      mainPanel.setLayout(new BorderLayout());
      JLabel label = new JLabel("<html><center>N<br/>W     E<br/>S</center></html>");

      mainPanel.add(label, BorderLayout.LINE_END);
      frame.add(mainPanel);

	JButton button = new JButton("Restart");
	mainPanel.add(button, BorderLayout.PAGE_END);

	for(int i = 25; i > 0; i--){
		button = new JButton("Map");
		button.setPreferredSize(new Dimension(100, 100));
		mainPanel.add(button, BorderLayout.CENTER);
	}

	

	
      // packs the components within the window based on their preferred size
      frame.pack();
      frame.setVisible(true);
   }
}
