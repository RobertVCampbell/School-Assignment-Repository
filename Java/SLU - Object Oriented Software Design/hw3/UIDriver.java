import java.io.FileNotFoundException;
import control.LoadQuiz;

public class UIDriver
{
   public static void main(String []args)
   {
      try
      {
         StudentQuizControl control = new StudentQuizControl("csci2300", "quiz1", "data"); 
      }
      catch(FileNotFoundException e)
      {
         System.out.println("could not load the quiz " + e.getMessage());
      }
   }
}
