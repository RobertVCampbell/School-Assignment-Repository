/**
* InfoGUI class for Sliding Puzzle project
* Used to represent the GameTimer in the GUI
*
*/

package ui;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

import model.Player;

public class InfoGUI extends JPanel {

    private Player player;
    private Timer timer;
    private int currentTime;
    private JLabel time;
    private String timerText;

    /**
    * This is the default constructor for the InfoGUI class
    * @param p this is the player created by the options GUI
    */
    public InfoGUI(Player p) {
        this.setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));

        JLabel label = new JLabel("Timer");
        label.setFont(new Font("Futura",1,20));
        this.add(label);

        time = new JLabel("  0:00");
        time.setFont(new Font("Futura",1,20));
        this.add(time);
    }

    /**
    * This starts the timer when the start button is clicked
    */
    public void startTime() {
        currentTime = 0;

        ActionListener listener = new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                currentTime = currentTime + 1;
                int minutes = currentTime/60;
                int seconds = currentTime %60;
                timerText = "  " + Integer.toString(minutes) + ":";
                if(seconds < 10) timerText += "0" + Integer.toString(seconds);
                else timerText += Integer.toString(seconds);
                time.setText(timerText);
            }
        };

        timer = new Timer(1000, listener);
        timer.start();

    }

    /**
    * This stops the timer when the game is complete
    */
    public void stopTime() {
        timer.stop();
    }

    /**
     * Returns the time it took to complete the game in double form
     */
    public double getTime() {
        double temp = currentTime;
        return temp;
    }
}
