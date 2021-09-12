import javax.swing.*;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.BorderLayout;

public class Face extends JPanel
{
   private int radius;

   public Face(int radius)
   {
	  this.radius = radius;
      setPreferredSize(new Dimension(2*this.radius, 2*this.radius));
   }

   @Override
   protected void paintComponent(Graphics g)
   {
      super.paintComponent(g);
      g.setColor(Color.YELLOW);
      g.fillOval(0, 0, 2*radius, 2*radius);
      g.setColor(Color.BLACK);
      g.fillOval(radius/2, radius/2, radius/4, radius/4);
      g.fillOval(radius+radius/2, radius/2, radius/4, radius/4);
      g.fillOval(radius/2, radius, radius, radius/4);
   }

   public static void main(String[] args)
   {
      JFrame frame = new JFrame("Square");
      // operation to do when the window is closed
      frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

      Face mainPanel = new Face(300);
      mainPanel.setLayout(new BorderLayout());

      frame.add(mainPanel);

      // packs the components within the window based on their preferred size
      frame.pack();
      frame.setVisible(true);
   }
}
