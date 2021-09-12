import javax.swing.*;
import java.awt.event.*;

public class SubmitButton extends JButton implements ActionListener
{
    public SubmitButton()
    {
        super("submit");
        addActionListener(this);
    }

    public void actionPerformed(ActionEvent e)
    {
        System.out.println("button clicked");
    }
}
