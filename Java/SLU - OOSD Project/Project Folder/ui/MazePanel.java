package ui;

import java.awt.*;
//import javax.swing.*;
import java.awt.event.*;
import java.io.FileNotFoundException;

import javax.swing.*;

import model.*;

public class MazePanel extends JPanel {
	private  int size;
	//private BoardButton emptySpace;
	private  JButton[] tiles;
	private UserMoveHandler game;
	
	MazePanel(UserMoveHandler g){
		game = g;
		size = 7;
		tiles = new JButton[size*size];
	}
		

	public void initialize(int height)
	    {
	     this.setPreferredSize(new Dimension(height, height));
	     this.setLayout(new GridLayout(size, size));

	     for (int i = 0; i < size * size; i++)
	     {
	    	 int x = i%size;
	    	 int y = i/size;
	    			
	         tiles[i] = new JButton();
	         tiles[i].addActionListener(new ButtonListener(x,y));
	         //tiles[i].setEnabled(false);
	         this.add(tiles[i]);
	     }	
	     //Hard coded first position for the player
	     reenable(game.getStart());
	    }//End of initialize
	
	protected void reenable(int[] pos) {
		for(int i = 0; i < size * size; i++) {
			tiles[i].setText("");
			tiles[i].setEnabled(false);
		}
		//Enable the player and adjacent positions
		for(int i = 0; i < ((pos.length) - 2); i+=2) {
			if(pos[i]!= -1) {
				int index = (pos[i+1] * size) + pos[i];
				//System.out.println("Index: " + index + " Array Coord: (" + pos[i] + ", " + pos[i+1] + ")");
				if(pos[i] == pos[pos.length - 2]) {
					if(pos[i+1] == pos[pos.length -1]) {
						tiles[index].setText("M");
					}
				}
				tiles[index].setEnabled(true);
			}
		}
		
		int index = (pos[1] * size) + pos[0];
		tiles[index].setText("P");
		
		if(pos[0] == pos[pos.length-2] && pos[1] == pos[pos.length - 1]) {
			tiles[index].setText("P + M");
		}
	}
	
	/*class BoardButton extends JButton {

		public int x;  //row
		public int y;  //column
		
		BoardButton(int x,int y) {
			this.x = x;
			this.y = y;
		}

	}// end of boardbutton
	*/
	
	class ButtonListener implements ActionListener {
		private int x;
		private int y;
		
		ButtonListener(int hor, int vert){
			x = hor;
			y = vert;
		}
		
		@Override
		public void actionPerformed(ActionEvent e) {
			int[] pos = game.handleMove(this.x, this.y);
			//System.out.println("Coord: (" + this.x + ", " + this.y + ").");
			reenable(pos);
		}
		
	}//End of buttonlistener
	

	public static void main(String[] args) throws FileNotFoundException
	{
		JFrame game = new JFrame();
		game.setPreferredSize(new Dimension(700,700));
		game.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        game.setTitle("Hunt The Wumpus");
        game.setResizable(false);
        game.setBackground(Color.white);
        game.setForeground(Color.lightGray);
        game.setFont(new Font("SansSerif", Font.PLAIN, 18));
		game.pack();
		UserMoveHandler g = new GameLogic();
		MazePanel maze = new MazePanel(g);
		maze.initialize(600);
		game.add(maze, BorderLayout.CENTER);
		game.setVisible(true);
		maze.setVisible(true);

	}
		
	
	
}
		
