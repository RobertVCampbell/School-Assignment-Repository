package ui;

import model.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import java.awt.*;
import java.awt.event.*;
import java.util.*;
import javax.swing.*;

public class ControlPanel extends JButton 
{
	public ControlPanel()
	{
		super("Restart");
		setVerticalTextPosition(AbstractButton.CENTER);
		setHorizontalTextPosition(AbstractButton.CENTER);
		setBackground(Color.red);
		setFont(new Font("SansSerif", Font.PLAIN, 24));
		setEnabled(true);
		setPreferredSize(new Dimension(50,100));
	}
}