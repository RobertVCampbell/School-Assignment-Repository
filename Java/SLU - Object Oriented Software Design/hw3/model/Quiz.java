package model;

import java.util.ArrayList;


/**
* A Quiz class that holds an array of Question objects
*/
public class Quiz
{
   String courseName;
   String quizName;

   private ArrayList<Question> questions;

	/**
	* Constructor that takes a course and quiz name while also
	* initializing the question array
	*/
   public Quiz(String course, String quiz)
   {
      questions = new ArrayList<Question>();
      courseName = course;
      quizName = quiz;
   }

	/**
	* Adds a Question object to the arraylist of questions
	*/
   public void addQuestion(Question q)
   {
      questions.add(q);
   }


	/**
	* Stores the quiz in a .dat file
	* Current just placeholder code
	*/
   public void save()
   {
      System.out.println("Saving quiz to " + getQuizName()+".dat");
   }

	/**
	* Loads the quiz from a .dat file
	* Current just placeholder code
	*/
   public void load()
   {
      System.out.println("Loading quiz from " + getQuizName()+".dat");
   }

	/**
	* @return Returns the Filename that the quiz will be stored with
	*/
   public String getQuizName()
   {
      String fileName = courseName + "_" + quizName;
      return fileName;
   }


	/**
	* @return Calculates the percentage grade of an answered quiz and returns it
	*/
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
   
   	/**
	* Sets the quizname
	* @param quizName Updates the name of the quiz
	*/
   public void setName(String name){
	   
	   quizName = name;
   }
}
