import javax.swing.*;
import java.awt.Component;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.*;
import java.awt.Rectangle;

import java.awt.Color;

public class Snowman implements Icon
{
   private int height;
   private Color []colors={Color.BLUE, Color.RED, Color.GREEN};
   private int nextColorIndex;
   public Snowman(int height)
   {
      this.height = height;
      nextColorIndex = 0;
   }

   public int getIconWidth()
   {
      return (int)((height+1)/2.0);
   }

   public int getIconHeight()
   {
      return height;
   }

   public void paintIcon(Component c, Graphics g, int x, int y)
   {
      System.out.println("painting a snowman");
      Graphics2D g2 = (Graphics2D)g;
      double oneSixth = height/6.0;

      Ellipse2D.Double head = new Ellipse2D.Double(x, y, oneSixth, oneSixth);
      g2.setColor(colors[nextColorIndex]);
      g2.fill(head);

      Ellipse2D.Double middle = new Ellipse2D.Double(x, y+oneSixth, 2*oneSixth, 2*oneSixth);
      g2.fill(middle);

      Ellipse2D.Double bottom = new Ellipse2D.Double(x, y+3*oneSixth, 3*oneSixth, 3*oneSixth);
      g2.fill(bottom);

      Rectangle snowmanBox = new Rectangle(x, y, getIconWidth(), height);
      g2.draw(snowmanBox);

      //update next color index
      nextColorIndex++;
      nextColorIndex%=colors.length;
   }

}
