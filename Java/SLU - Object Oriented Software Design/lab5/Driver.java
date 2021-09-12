public class Driver
{
   public static void main(String []args)
   {
      MovablePoint p = new MovablePoint(0,0);
      System.out.println("point "+p);
      p.moveUp(5);
      p.moveLeft(2);
      System.out.println("point "+p);

      MovableCircle circle = new MovableCircle(p, 10);
      System.out.println("circle "+circle);
      circle.moveRight(7);
      circle.moveDown(3);
      System.out.println(circle);
   }
}
