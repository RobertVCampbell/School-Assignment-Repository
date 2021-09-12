/*
 * Example of how Line2D class can be used
 */

public class Driver
{
   public static void main(String []args)
   {
      Point2D s = new Point2D(1, 2);
      Point2D e = new Point2D(3, 4);

      Line2D line = new Line2D(s, e);
      System.out.println(line);
   }
}
