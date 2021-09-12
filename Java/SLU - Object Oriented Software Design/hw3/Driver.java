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

	public static void testQuiz(){
		Quiz aQuiz = new Quiz("csci2300","quiz2");
		
		MultipleChoiceQuestion multi = new MultipleChoiceQuestion("What is the question?");
		multi.addChoice("This is the question.",true);
		multi.addChoice("This is not the question.",false);
		multi.setPointValue(10);
		
		aQuiz.addQuestion(multi);
		
		NumericQuestion num = new NumericQuestion("The answer is 10.");
		num.setCorrectAnswer(10.0);
		num.setPointValue(10);
		
		aQuiz.addQuestion(num);
		
		System.out.println(aQuiz.getGrade());
		
		aQuiz.save();
		
	}


   public static void main(String []args)
   {
      // TODO: replace hard coded file with a file passed from command line arguments
	  
      ArrayList<Token> quizTokens = readQuizFromFile("data/" + args[0] + ".dat");
	  System.out.println(args[0]+".dat");
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
	  testQuiz();
   }
}
