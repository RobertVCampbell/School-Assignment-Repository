import javax.swing.*;
import java.awt.event.*;
import java.awt.Dimension;

public class ButtonDemo
{

    public static void main(String []args)
    {
        JFrame mainFrame = new JFrame("Button Demo");
        mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JPanel mainPanel = new JPanel();
        mainPanel.setPreferredSize(new Dimension(50, 50));

        JLabel label = new JLabel("5+5?");
        mainPanel.add(label);

        JButton submitButton = new JButton("see answer");
        submitButton.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e)
            {
                label.setText("10");
            }
        });

        mainPanel.add(submitButton);

        mainFrame.add(mainPanel);
        mainFrame.pack();
        mainFrame.setVisible(true);
    }
}
