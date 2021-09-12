/*
 * An example of using Icon interface
 */

import javax.swing.*;
import java.awt.event.*;
import java.awt.BorderLayout;

public class Driver
{
   JLabel snowmanLabel;

   public Driver()
   {
      JFrame mainFrame = new JFrame();
      mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

      Snowman snowman = new Snowman(300);
      snowmanLabel = new JLabel(snowman);

      JPanel mainPanel = new JPanel();
      mainPanel.setLayout(new BorderLayout());

      mainPanel.add(snowmanLabel, BorderLayout.NORTH);

      mainFrame.add(mainPanel);
      mainFrame.pack();
      mainFrame.setVisible(true);


   }

   public static void main(String []args)
   {
      Driver display = new Driver(); 
   }
}
