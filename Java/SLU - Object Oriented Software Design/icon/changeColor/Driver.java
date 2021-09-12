import javax.swing.*;
import java.awt.event.*;
import java.awt.BorderLayout;

public class Driver
{
   JLabel snowmanLabel;
   JButton changeColorButton;

   public Driver()
   {
      JFrame mainFrame = new JFrame();
      mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

      Snowman snowman = new Snowman(300);
      snowmanLabel = new JLabel(snowman);

      JPanel mainPanel = new JPanel();
      mainPanel.setLayout(new BorderLayout());

      JButton changeColorButton = new JButton("Change color");
      changeColorButton.addActionListener(new ActionListener(){
         public void actionPerformed(ActionEvent e)
         {
            snowmanLabel.repaint();
         }
      });

      mainPanel.add(snowmanLabel, BorderLayout.NORTH);
      mainPanel.add(changeColorButton, BorderLayout.SOUTH);


      mainFrame.add(mainPanel);
      mainFrame.pack();
      mainFrame.setVisible(true);


   }

   public static void main(String []args)
   {
      Driver display = new Driver(); 
   }
}
