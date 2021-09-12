import model.*;
import model.io.*;
import java.util.ArrayList;
import java.io.FileNotFoundException;

public class Driver
{
   public static ArrayList<Token> readQuizFromFile(String fileName)
   {
      try
      {
         FileReader reader = new FileReader(fileName);
         return reader.getTokens();
      }
      catch (FileNotFoundException e)
      {
         System.out.println("Could not open file "+fileName);
      }
      return null;
   }


   public static void gradeUnansweredQuiz(Quiz quiz)
   {
      double score = quiz.getGrade();
      if (score != 0)
      {
         System.out.println("ERROR: quiz.grade() gave " + score + " we expected " + 0);
      }
   }

   public static void main(String []args)
   {
      // TODO: replace hard coded file with a file passed from command line arguments
      ArrayList<Token> quizTokens = readQuizFromFile("data/csci2300_quiz1.dat");
      Quiz quiz = new Quiz("csci2300", "quiz1");
      for (int i = 0; i < quizTokens.size(); i++)
      {
         Question question = null;
         switch (quizTokens.get(i).type)
         {
            case M:
              question = new MultipleChoiceQuestion(quizTokens.get(i));
              break;
            case N:
              question = new NumericQuestion(quizTokens.get(i));
              break;
         }
         if (question != null)
         {
            quiz.addQuestion(question);
         }
      }
      gradeUnansweredQuiz(quiz);
   }
}
