/*
 * Example of using MovableShape
 */

import javax.swing.*;
import java.awt.event.*;

public class Driver{

   public static void main(String []args)
   {
      JFrame mainFrame = new JFrame();
      mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

      MeltingSnowman snowman = new MeltingSnowman(300);
      ShapeIcon icon = new ShapeIcon(snowman, 150, 300);
      JLabel label = new JLabel(icon);

      mainFrame.setSize(600, 400);
      mainFrame.add(label);
      mainFrame.setVisible(true);

      ActionListener listener = new ActionListener()
      {
         public void actionPerformed(ActionEvent e)
         {
            snowman.move();
            label.repaint();      
         }
      };

      final int DELAY = 1000;
      Timer t = new Timer(DELAY, listener);
      t.start();
   }
}
