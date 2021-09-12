import javax.swing.*;

public class ButtonDemo
{

    public static void main(String []args)
    {
        JFrame mainFrame = new JFrame("Button Demo");
        mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JButton submitButton = new JButton("submit");
        SubmitButtonListener listener = new SubmitButtonListener();
        submitButton.addActionListener(listener);

        mainFrame.add(submitButton);
        mainFrame.pack();
        mainFrame.setVisible(true);
    }
}
