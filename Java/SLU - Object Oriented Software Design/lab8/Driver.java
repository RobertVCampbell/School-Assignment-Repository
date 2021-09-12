import javax.swing.*;
import java.awt.event.*;
import java.awt.Dimension;

public class Driver
{

    public static void main(String []args)
    {
        JFrame mainFrame = new JFrame("Label Input Demo");
        mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JPanel mainPanel = new JPanel();
        mainPanel.setPreferredSize(new Dimension(315, 100));

        JLabel label = new JLabel("");
        mainPanel.add(label);

        JTextField answerField = new JTextField();
        answerField.setPreferredSize(new Dimension(300, 30));
        mainPanel.add(answerField);

        JButton submitButton = new JButton("Submit");
        submitButton.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e)
            {
				label.setText(answerField.getText());
                submitButton.setEnabled(false);
                answerField.setEnabled(false);
            }
        });

        mainPanel.add(submitButton);
        

        mainFrame.add(mainPanel);
        mainFrame.pack();
        mainFrame.setVisible(true);
    }
}
