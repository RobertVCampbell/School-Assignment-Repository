/**
* Board class for Sliding Puzzle project
* Displays the board within the larger GUI
*
*/

package ui;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import model.Puzzle;

public class Board extends JPanel {

    private JButton[] tiles;
    private int size;
    private IPlayerMove mover;
    private Puzzle puzzle;

    public Board (Puzzle puzzle, IPlayerMove mover) {
        this.puzzle = puzzle;
        this.mover = mover;
        size = puzzle.getSize();
        tiles = new JButton[size*size];
    }

    public void initialize(int height)
    {
        this.setPreferredSize(new Dimension(height, height));
        this.setLayout(new GridLayout(size, size));

        for (int i = 0; i < size * size; i++)
        {
            tiles[i] = new JButton(String.valueOf(i));
            tiles[i].addActionListener(new ButtonListener(i));
            tiles[i].setEnabled(false);
            this.add(tiles[i]);
        }
    }


    public void showTiles()
    {
        int i = 0;
        for (Integer tileValue: puzzle)
        {
            tiles[i].setText(tileValue.toString());
            tiles[i].setEnabled(tileValue > 0);
            i++;
        }
    }

    /**                                                                                                                 
     * Action listener for the buttons placed on the board                                                              
     */
    private class ButtonListener implements ActionListener {
        private int index;

        public ButtonListener(int i) {
            index = i;
        }

        public void actionPerformed(ActionEvent e)
        {
            boolean validMove = puzzle.move(index);
            if(validMove) 
            {
                mover.playerMoved();
            }
        }
    }

}
