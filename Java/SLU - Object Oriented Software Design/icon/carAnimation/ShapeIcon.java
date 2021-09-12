/*
 * Generic Shape that implements Icon
 */

import javax.swing.*;
import java.awt.Component;
import java.awt.Graphics;
import java.awt.Graphics2D;

public class ShapeIcon implements Icon
{
   protected MovableShape shape;
   protected int width;
   protected int height;

   public ShapeIcon(MovableShape shape, int width, int height)
   {
      this.shape = shape;
      this.width = width;
      this.height = height;
   }
   public int getIconHeight()
   {
      return height;
   }

   public int getIconWidth()
   {
      return width;
   }

   public void paintIcon(Component c, Graphics g, int x, int y)
   {
      Graphics2D g2 = (Graphics2D)g;
      shape.draw(g2, x, y);
   }
}
