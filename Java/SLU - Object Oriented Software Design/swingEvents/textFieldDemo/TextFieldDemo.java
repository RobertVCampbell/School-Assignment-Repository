import javax.swing.*;
import java.awt.event.*;
import java.awt.Dimension;

public class TextFieldDemo
{

    public static void main(String []args)
    {
        JFrame mainFrame = new JFrame("Button Demo");
        mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JPanel mainPanel = new JPanel();
        mainPanel.setPreferredSize(new Dimension(100, 100));

        JLabel label = new JLabel("5+5?");
        mainPanel.add(label);

        JTextField answerField = new JTextField();
        answerField.setPreferredSize(new Dimension(30, 30));
        mainPanel.add(answerField);

        JButton submitButton = new JButton("Submit");
        submitButton.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e)
            {
                if (Integer.parseInt(answerField.getText()) != 10)
                {
                    label.setText("WRONG!");
                }
                else
                {
                    label.setText("CORRECT!");
                }
            }
        });

        mainPanel.add(submitButton);

        mainFrame.add(mainPanel);
        mainFrame.pack();
        mainFrame.setVisible(true);
    }
}
