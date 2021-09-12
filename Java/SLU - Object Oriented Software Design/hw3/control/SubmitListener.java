package control;
import java.awt.event.*;
import java.awt.*;
import model.*;
import ui.QuizUI;

public class SubmitListener implements ActionListener
{
   private Student student;
   private Quiz quiz;
   private String dir;
   private QuizUI ui;

   public SubmitListener(QuizUI ui, Student student, Quiz quiz, String dir)
   {
      this.student = student;
      this.quiz = quiz;
      this.dir = dir;
      this.ui = ui;
   }
   public void actionPerformed(ActionEvent e)
   {
      Solution sol = new Solution(quiz);
      sol.setStudent(student);
      String fileName = dir + "/" + sol.getSolutionName() + ".dat";
      sol.save(fileName);
      ui.showFinished();
   }
}
