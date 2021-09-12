import javax.swing.*;
import java.awt.event.*;

public class ButtonDemo
{
    public static void main(String []args)
    {
        JFrame mainFrame = new JFrame("Button Demo");
        mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        SubmitButton submitButton = new SubmitButton();

        mainFrame.add(submitButton);
        mainFrame.pack();
        mainFrame.setVisible(true);
    }
}
