package ui;


import java.awt.*;
import java.awt.event.*;
import java.util.*;
import javax.swing.*;
 
public class UIDriver extends JPanel {
    
    public UIDriver() {
        setPreferredSize(new Dimension(700, 600));
        setBackground(Color.white);
        setForeground(Color.lightGray);
        setFont(new Font("SansSerif", Font.PLAIN, 18));
      
        
    }
 
 
    void drawStartScreen(Graphics2D g) {
       
     
    }
 
    void drawRooms(Graphics2D g) {
     

    }
 
 
    @Override
    public void paintComponent(Graphics gg) {
 
       
    }
 
    public static void main(String[] args) {
    	
            JFrame frame = new JFrame();
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.setTitle("Hunt The Wumpus");
            frame.setResizable(false);
            frame.add(new UIDriver(), BorderLayout.CENTER);
            frame.pack();
            frame.setVisible(true);
       
    }
 
}