package ui;

import model.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import java.awt.*;
import java.awt.event.*;
import java.util.*;
import javax.swing.*;

/**
	This class creates the InfoPanel displayed at the top of the user interface
	This class will include:
		directions the character can move
		difficulty level
		timer/score? (propably not)
**/
 
public class InfoPanel extends JPanel implements Observer
{
	public JLabel difficulty;
	public JLabel turnCount;
	private TurnCounter counter;
	//public JLabel score;

	public InfoPanel(TurnCounter c, int d)
	{
		counter = c;
		setPreferredSize(new Dimension(30,100));
		setBackground(Color.orange);
		setForeground(Color.blue);
		setFont(new Font("SansSerif", Font.PLAIN, 24));
		if(d == 1) {this.difficulty = new JLabel("Hard");}
		else {this.difficulty = new JLabel("Easy");}
		this.turnCount = new JLabel("Turn: 0      High-Score: " + counter.getHighScore());
		this.add(turnCount);
		
	}

	/**
		@param d is a String for difficulty level of either "Easy" or "Hard"
		Constructor allows the difficulty level to be set
	**/
	public InfoPanel(String d)
	{
		setPreferredSize(new Dimension(30,100));
		setBackground(Color.orange);
		setForeground(Color.blue);
		setFont(new Font("SansSerif", Font.PLAIN, 24));
		this.difficulty = new JLabel(d);
		this.turnCount = new JLabel("0");
	}

	@Override
	public void update(Observable o, Object data)
	{
		System.out.println("Info panel updated.");
		turnCount.setText("Turn: " + counter.getTurnCount() + "      High-Score: " + counter.getHighScore());
		//turnCount.repaint();
	}


}

