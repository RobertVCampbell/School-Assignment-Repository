/*
 * Class that defines a line in 2D 
 */

public class Line2D
{
   private Point2D start;
   private Point2D end;
  
   public Line2D()
   {
      start = new Point2D();
      end = new Point2D();
   }

   public Line2D(Point2D s, Point2D e)
   {
      start = new Point2D(s.getX(), s.getY());
      end = new Point2D(e.getX(), e.getY());
   }

   public String toString()
   {
      String val = "start: " + start.toString() + ", end: " + end.toString();
      return val;
   }
}
