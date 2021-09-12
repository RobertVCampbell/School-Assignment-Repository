package ui;
import javax.swing.*;
import java.awt.Dimension;
import java.awt.*;
import java.awt.event.*;

import model.*;
public class Game implements IPlayerMove, ILevelSetter
{
    private JFrame    mainFrame;
    private Board     gameBoard;
    private StartMenu startMenu;
    private Puzzle    puzzle;
    private GameTimer timer;
    private JPanel    mainPanel;
    private Player    player;
    private HighScores highScores;

    private JButton   startButton;

    /*
     * Implement all the use cases here
     */

    /**
     * Use case: user starts the application
     */
    public Game()
    {
        mainFrame = new JFrame("Sliding puzzle game");
        mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        mainPanel = new JPanel();
        mainPanel.setPreferredSize(new Dimension(850,650));

        highScores = new HighScores();
        timer = new GameTimer();

        player = new Player();
        startMenu = new StartMenu(player, this);
        mainPanel.add(startMenu);
        mainFrame.add(mainPanel);

        startButton = new JButton("Start");
        startButton.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent event)
            {
                startGame();
            }
        });
        mainFrame.pack();
        mainFrame.setVisible(true);
    }

    /**
     * Use case: user selects difficulty level
     */
    @Override
    public void setLevel(Level level)
    {
        puzzle = new Puzzle(level);
        gameBoard = new Board(puzzle, this);
        gameBoard.initialize(600);

        mainPanel.removeAll();
        mainPanel.add(gameBoard);
        mainPanel.add(startButton);
        startButton.setEnabled(true);
        mainPanel.revalidate();
        mainFrame.repaint();
    }

    /**
     * Use case: user starts the game
     */
    public void startGame()
    {
        gameBoard.showTiles();
        timer.start();
    }

    /**
     * Use case: user makes a move
     */
    @Override
    public void playerMoved()
    {
        gameBoard.showTiles();
        if (puzzle.isSolved())
        {
            gameOver();
        }
    }

    /**
     * Use case: game over
     */
    public void gameOver()
    {
        timer.stop();
        Score score = new Score(player, timer.getElapsedMilliseconds());
        boolean newLeader = highScores.isNewLeader(score);
        if (newLeader)
        {
            // show new leader announcement
        }
    }
}
