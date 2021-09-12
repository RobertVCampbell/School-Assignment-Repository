/*
 * Example of using MovableShape
 */

import javax.swing.*;
import java.awt.event.*;
import java.io.IOException;

public class Driver
{

   public static void main(String []args)
   {
      JFrame mainFrame = new JFrame();
      mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
      mainFrame.setSize(600, 600);
      Car car;

      try
      {
         car = new Car("./RedCar.png", 0, 600);
      }
      catch (IOException e)
      {
         System.out.println("IO exception");
         return;
      }

      ShapeIcon icon = new ShapeIcon(car, 600, 600);
      JLabel label = new JLabel(icon);
      mainFrame.add(label);
      mainFrame.setVisible(true);
      
      ActionListener listener = new ActionListener()
      {
         public void actionPerformed(ActionEvent e)
         {
            label.repaint();
            car.move();
         }
      };


      final int DELAY = 10;
      Timer t = new Timer(DELAY, listener);
      t.start();
   }
}
