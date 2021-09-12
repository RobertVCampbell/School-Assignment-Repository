package ui;

import model.*;
import java.awt.*;
import java.awt.event.*;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.*;
import javax.swing.*;

/**
	This class creates a GamePanel which creates the window that holds the InfoPanel,
	implements GameLogic, and holds the ControlPanel.
**/ 
@SuppressWarnings("deprecation")
public class GamePanel implements Observer, ActionListener
{
	int x, y, d;
	private JFrame mainFrame;
	private GameLogic gameL;
	private InfoPanel info;
	private MazePanel maze;
	private ControlPanel control;
	/**
		Constructors that take different parameters
	**/
	public GamePanel()
	{

		this.x = 700;
		this.y = 800;
		this.d = 2;
		
		difficultyPopup();
				
	}
	
	
	public void initialize() throws FileNotFoundException{
		control = new ControlPanel();
		gameL = new GameLogic(d);
		info = new InfoPanel(gameL, this.d);
		maze = new MazePanel(gameL);
		
		control.addActionListener(this);
		gameL.addObserver(info);
		gameL.addObserver(this);
		
		mainFrame = new JFrame();
		mainFrame.setPreferredSize(new Dimension(1000,1000));
		mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        mainFrame.setTitle("Hunt The Wumpus");
        mainFrame.setResizable(false);
        mainFrame.setBackground(Color.white);
        mainFrame.setForeground(Color.lightGray);
        mainFrame.setFont(new Font("SansSerif", Font.PLAIN, 18));
		mainFrame.pack();
		maze.initialize(600);
		
		mainFrame.add(maze, BorderLayout.CENTER);
		mainFrame.add(info, BorderLayout.NORTH);
		mainFrame.add(control, BorderLayout.SOUTH);
		maze.setVisible(true);
		mainFrame.setVisible(true);
		
		
		
	}
	
	public void difficultyPopup()
	{
		JFrame difFrame = new JFrame();
		difFrame.setPreferredSize(new Dimension(300,300));
		difFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        difFrame.setTitle("CHOOSE DIFFICULTY");
        difFrame.setResizable(false);
        difFrame.setBackground(Color.white);
        difFrame.setForeground(Color.lightGray);
        difFrame.setFont(new Font("SansSerif", Font.PLAIN, 18));
		difFrame.pack();

		JButton easy = new JButton("Easy");
		easy.setVerticalTextPosition(AbstractButton.CENTER);
		easy.setHorizontalTextPosition(AbstractButton.CENTER);
		easy.setFont(new Font("SansSerif", Font.PLAIN, 24));
		easy.setEnabled(true);
		easy.setPreferredSize(new Dimension(50,100));

		JButton hard = new JButton("Hard");
		hard.setVerticalTextPosition(AbstractButton.CENTER);
		hard.setHorizontalTextPosition(AbstractButton.CENTER);
		hard.setFont(new Font("SansSerif", Font.PLAIN, 24));
		hard.setEnabled(true);
		hard.setPreferredSize(new Dimension(50,100));

		difFrame.add(easy,BorderLayout.NORTH);
		difFrame.add(hard,BorderLayout.SOUTH);
		difFrame.setVisible(true);
		easy.addActionListener(new ActionListener() {
    		public void actionPerformed(ActionEvent e)
    		{
				selectDifficulty(1);
      			difFrame.dispose();
      			try {
					initialize();
				} catch (FileNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
   			}
		});
		hard.addActionListener(new ActionListener() {
    		public void actionPerformed(ActionEvent e)
    		{
    			selectDifficulty(2);
      			difFrame.dispose();
      			try {
					initialize();
				} catch (FileNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

   			}
		});
	}//End difficulty popup
	
	public void gameOverPopup()
	{
		JFrame endFrame = new JFrame();
		endFrame.setPreferredSize(new Dimension(300,300));
		endFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		if(gameL.monWon()) {endFrame.setTitle("Game Over.");}
		else {endFrame.setTitle("You Won!");}

        endFrame.setResizable(false);
        endFrame.setBackground(Color.white);
        endFrame.setForeground(Color.lightGray);
        endFrame.setFont(new Font("SansSerif", Font.PLAIN, 18));
		endFrame.pack();

		JButton restart = new JButton("New Game");
		restart.setVerticalTextPosition(AbstractButton.CENTER);
		restart.setHorizontalTextPosition(AbstractButton.CENTER);
		restart.setFont(new Font("SansSerif", Font.PLAIN, 24));
		restart.setEnabled(true);
		restart.setPreferredSize(new Dimension(50,100));

		JButton exit = new JButton("Exit");
		exit.setVerticalTextPosition(AbstractButton.CENTER);
		exit.setHorizontalTextPosition(AbstractButton.CENTER);
		exit.setFont(new Font("SansSerif", Font.PLAIN, 24));
		exit.setEnabled(true);
		exit.setPreferredSize(new Dimension(50,100));

		endFrame.add(restart,BorderLayout.NORTH);
		endFrame.add(exit,BorderLayout.SOUTH);
		endFrame.setVisible(true);
		restart.addActionListener(new ActionListener() {
    		public void actionPerformed(ActionEvent e)
    		{
      			endFrame.dispose();
      			difficultyPopup();
   			}
		});
		exit.addActionListener(new ActionListener() {
    		public void actionPerformed(ActionEvent e)
    		{
    			System.exit(0);
   			}
		});
	}
	
	
	
	public void actionPerformed(ActionEvent e)
	{
				difficultyPopup();
	}

	public void selectDifficulty(int z){
		this.d = z;
		return;
		}
	
	@Override
	public void update(Observable o, Object arg) {
		System.out.println("Main frame updated");
		if(gameL.monWon()) {
			gameOverPopup();
		} else
			try {
				if(gameL.playerWon()) {
							gameOverPopup();
						}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		//mainFrame.repaint();
		
	}
	
	
	
	/* Only need the default constructor
	 * The difficulty changes can be implemented after the fact.
	 * public GamePanel(int dif)
	{
		this.x = 700;
		this.y = 800;
		InfoPanel info = new InfoPanel(dif);
		GameLogic gameL = new GameLogic(dif);
		gameL.addObserver(info);
	}
	public GamePanel(int dif, int x, int y)
	{
		this.x = x;
		this.y = y;
		InfoPanel info = new InfoPanel(dif);
		GameLogic gameL = new GameLogic(dif);
		gameL.addObserver(info);
	}*/
	
	/*public boolean createWindow()
	{
		JFrame game = new JFrame();
		game.setPreferredSize(new Dimension(x,y));
		game.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        game.setTitle("Hunt The Wumpus");
        game.setResizable(false);
        game.setBackground(Color.white);
        game.setForeground(Color.lightGray);
        game.setFont(new Font("SansSerif", Font.PLAIN, 18));
	}*/
	/**
		Method displays start screen of game.
		This method will notify user of a previously saved game and give option to load game.
		If user starts new game, method will give user difficulty options.
	 * @throws FileNotFoundException 
	**/
	/*public boolean displayStartScreen() {//game.setVisible(true);}
	public boolean displayMazeBoard() {}
	public boolean beginGame() {}
	public boolean restartGame() {}
	public boolean endGame() {}*/

	public static void main(String[] args) throws FileNotFoundException
	{
		/*GamePanel game = new GamePanel(1);
		game.createWindow();
		game.displayStartScreen();
		game.beginGame();
		game.restartGame();
		game.beginGame();
		game.endGame();*/
		
		GamePanel game = new GamePanel();
	}

	
}

/** Questions:
	Do we want high score to be shown in the info panel?
	Does GameLogic have to be Observable?
**/

// Only use the following if GamePanel extends JFrame
// setPreferredSize(new Dimension(700,600));
// setBackground(Color.white);
// setForeground(Color.lightGray);
// setFont(new Font("SansSerif", Font.PLAIN, 18));
