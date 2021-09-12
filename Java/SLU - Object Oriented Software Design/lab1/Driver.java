/*
 * Example of how Circle2D class can be used
 */

public class Driver
{
   public static void main(String []args)
   {
      Point2D s = new Point2D(1, 2);
      Point2D e = new Point2D(3, 4);

      Circle2D circle = new Circle2D(s, 1);
      System.out.println(circle);
      circle = new Circle2D(e, 3);
      System.out.println(circle);
   }
}
