/*
 * A movable point in 2D
 */

public class MovablePoint implements IMovable
{
   private int x;
   private int y;

   public MovablePoint(int x, int y)
   {
      this.x = x;
      this.y = y;
   }
  
   public String toString()
   {
      String value = "(" + x + "," + y + ")";
      return value;
   }

   public void moveUp(int distance){y = y + distance;}
   // TODO: implement all other methods of IMovable interrface
   public void moveDown(int distance){y = y - distance;}
   public void moveLeft(int distance){x = x - distance;}
   public void moveRight(int distance){x = x + distance;}

}
