import javax.swing.*;
import java.awt.event.*;

public class ButtonDemo implements ActionListener
{

    public ButtonDemo()
    {
        JFrame mainFrame = new JFrame("Button Demo");
        mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JButton submitButton = new JButton("submit");
        submitButton.addActionListener(this);

        mainFrame.add(submitButton);
        mainFrame.pack();
        mainFrame.setVisible(true);
    }

    public static void main(String []args)
    {
        ButtonDemo demo = new ButtonDemo();
    }

    public void actionPerformed(ActionEvent e)
    {
        System.out.println("button clicked");
    }
}
