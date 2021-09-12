/**
* StartMenu class for Sliding Puzzle project
* Displays the options menu for users within the GUI
*
*/


package ui;
import javax.swing.*;
import java.awt.event.*;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.Font;

import model.Player;
import model.Level;

public class StartMenu extends JPanel {

    private Player player;
    private JTextField textField;
    private LevelButton easyButton, medButton, hardButton;
    private Level currentDifficulty;
    private ILevelSetter levelSetter;
 
    /**
     * @param p Player associated with this game
     * @param game Game top level container with use case implementation
     */
    public StartMenu(Player p, ILevelSetter levelSetter) 
    {
        this.levelSetter = levelSetter;
        player = p;

        JLabel label = new JLabel("Sliding Puzzle");
        label.setFont(new Font("Futura",1,50));
        this.add(label);

        JLabel label2 = new JLabel("Options");
        label2.setFont(new Font("Futura",1,30));
        this.add(label2);

        textField = new JTextField();
        textField.setText("Enter your name");
        textField.addFocusListener(new FocusListener() {
            @Override
            public void focusGained(FocusEvent e) {
                if(textField.getText().equals("Enter your name")) textField.setText("");
            }
            public void focusLost(FocusEvent e) {
                if(textField.getText().length() != 0) {
                    player.setName(textField.getText());
                }
            }
        });
        textField.setFont(textField.getFont().deriveFont(18f));
        textField.setMaximumSize(new Dimension(600,50));
        this.add(textField);

        textField.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent evt){
                String input = textField.getText();
                player.setName(input);
            }
        });
        easyButton = new LevelButton(Level.EASY, player);
        easyButton.setText("Easy");

        medButton = new LevelButton(Level.MEDIUM, player);
        medButton.setText("Medium");

        hardButton = new LevelButton(Level.HARD, player);
        hardButton.setText("Hard");

        this.setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
        this.add(easyButton);
        this.add(medButton);
        this.add(hardButton);
    }

    /**
     * Sets current difficulty level
     * @param level of the game to be played: EASY, MEDIUM, HARD
     */
    private void setCurrentDifficulty(Level level) 
    {
        System.out.println("Selected difficulty "+level);
        currentDifficulty = level;
        levelSetter.setLevel(currentDifficulty);
    }

    /**
     * class that creates a LevelButton, which allows the buttons to set the level when clicked
     */
    private class LevelButton extends JButton implements ActionListener{
        private Level level;
        private Player player;

        public LevelButton(Level level, Player p){

            super();
            this.player = p;
            this.level = level;
            this.addActionListener(this);
        }

        public void actionPerformed(ActionEvent evt){
            player.setLevel(level);
            setCurrentDifficulty(level);
        }

    }
}
