import javax.swing.*;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.BorderLayout;

public class Driver extends JPanel
{
   private int[] x;
   private int[] y;
   private int n;

   public Driver(int[] hor, int[] vert, int num)
   {
		x = hor;
		y = vert;
		n = num;
		
		setPreferredSize(new Dimension(2*(this.x[1] - this.x[0]), 2*(this.y[0] - this.y[2])));

   }

   @Override
   protected void paintComponent(Graphics g)
   {
      super.paintComponent(g);
      g.setColor(Color.BLUE);
      g.fillPolygon(x,y,n);
      
   }

   public static void main(String[] args)
   {
	  int[] x = new int[]{200,900,600};
	  int[] y = new int[]{600,600,200};
	  int n = 3;
	   
      JFrame frame = new JFrame("Triangle");
      // operation to do when the window is closed
      frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

      Driver mainPanel = new Driver(x,y,n);
      mainPanel.setLayout(new BorderLayout());

      frame.add(mainPanel);

      // packs the components within the window based on their preferred size
      frame.pack();
      frame.setVisible(true);
   }
}
