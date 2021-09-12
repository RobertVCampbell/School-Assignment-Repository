package model;

public class Solution
{
   private Student student;
   private Quiz quiz;

   public Solution(Quiz quiz)
   {
      this.quiz = quiz;
   }

   public void setStudent(Student s)
   {
      this.student = s;
   }
   public void save(String fileName)
   {
      System.out.println("Saving solution to " + fileName);
   }
   public void load()
   {
      System.out.println("Loading solution from " + getSolutionName() + ".dat");
   }

   public String getSolutionName()
   {
      String name = quiz.getQuizName() + "_" + student.getId();
      return name;
   }
}
