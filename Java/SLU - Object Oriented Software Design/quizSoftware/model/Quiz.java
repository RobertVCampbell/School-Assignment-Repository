package model;

import java.util.ArrayList;

public class Quiz
{
   String courseName;
   String quizName;

   private ArrayList<Question> questions;

   public Quiz(String course, String quiz)
   {
      questions = new ArrayList<Question>();
      courseName = course;
      quizName = quiz;
   }

   public void addQuestion(Question q)
   {
      questions.add(q);
   }

   public void save()
   {
      System.out.println("Saving quiz to " + getQuizName()+".dat");
   }
   public void load()
   {
      System.out.println("Loading quiz from " + getQuizName()+".dat");
   }

   public String getQuizName()
   {
      String fileName = courseName + "_" + quizName;
      return fileName;
   }

   public double getGrade()
   {
      double totalEarned = 0;
      double totalPossible = 0;
      for (int i = 0; i < questions.size(); i++)
      {
         Question q = questions.get(i);
         totalPossible+= q.getPointValue();
         if (q.isCorrect())
         {
            totalEarned+=q.getPointValue();
         }
      }
      return 100.0 * totalEarned/totalPossible;
   }
}
