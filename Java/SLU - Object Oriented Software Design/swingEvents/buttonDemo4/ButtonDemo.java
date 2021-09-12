import javax.swing.*;
import java.awt.event.*;

public class ButtonDemo
{

    public static void main(String []args)
    {
        JFrame mainFrame = new JFrame("Button Demo");
        mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JButton submitButton = new JButton("submit");
        submitButton.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e)
            {
                System.out.println("button clicked");
            }
        });

        mainFrame.add(submitButton);
        mainFrame.pack();
        mainFrame.setVisible(true);
    }
}
