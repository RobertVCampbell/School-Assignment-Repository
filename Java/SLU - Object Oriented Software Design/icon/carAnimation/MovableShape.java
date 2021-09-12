/*
 * Movable shape interface
 */

import java.awt.Graphics2D;

public interface MovableShape
{
   public void draw(Graphics2D g, int x, int y);
   public void move();
}
