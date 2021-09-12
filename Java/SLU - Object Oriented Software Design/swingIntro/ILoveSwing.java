import javax.swing.*;
import java.awt.BorderLayout;

public class ILoveSwing
{
   public static void main(String[] args)
   {
      JFrame frame = new JFrame("My First Frame");
      // operation to do when the window is closed
      frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

      JPanel mainPanel = new JPanel();
      mainPanel.setLayout(new BorderLayout());
      JLabel label = new JLabel("I Love SWING");

      mainPanel.add(label);
      frame.add(mainPanel);

      // packs the components within the window based on their preferred size
      frame.pack();
      frame.setVisible(true);
   }
}
