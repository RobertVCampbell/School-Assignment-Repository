package ui;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.ArrayList;
import model.Quiz;

public class QuizUI
{
   private JPanel quizPanel;
   private JPanel questionPanel;
   private JButton nextQuestionButton;
   private JButton submit;
   private JFrame quizFrame;
   private Quiz quiz;

   private ArrayList<IQuestionPanel> questions;
   private int currentQuestionIndex = 0;
   public QuizUI(Quiz quiz)
   {
      this.quiz = quiz;
      quizFrame = new JFrame("Quiz");
      quizFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
      
      quizPanel = new JPanel();
      quizPanel.setPreferredSize(new Dimension(500, 200));
      quizPanel.setLayout(new BoxLayout(quizPanel, BoxLayout.Y_AXIS));
      questionPanel = new JPanel();
      nextQuestionButton = new JButton("Next");
      submit = new JButton("Submit");

      questions = new ArrayList<IQuestionPanel>();

      nextQuestionButton.addActionListener(new ActionListener(){
         public void actionPerformed(ActionEvent e)
         {
            currentQuestionIndex++;
            showQuestion();
         }
      });

      quizPanel.add(questionPanel);
      quizPanel.add(nextQuestionButton);
      quizFrame.add(quizPanel);
      quizFrame.pack();
   }

   private void showQuestion()
   {
      if (currentQuestionIndex < questions.size())
      {
         questionPanel.removeAll();
         questions.get(currentQuestionIndex).render(questionPanel);
      }
      else
      {
         quizPanel.removeAll();
         quizPanel.add(submit);
         quizPanel.revalidate();
         quizPanel.repaint();
      }
   }
 
   public void addQuestionPanel(IQuestionPanel p)
   {
      questions.add(p);
   }

   public void addSubmitListener(ActionListener listener)
   {
      submit.addActionListener(listener);
   }

   public void makeVisible()
   {
      showQuestion();
      quizFrame.setVisible(true);
   }

   public void showFinished()
   {
      quizPanel.removeAll();
      quizPanel.add(new JLabel("Quiz grade is "+quiz.getGrade() + "%"));
      quizPanel.revalidate();
      quizPanel.repaint();
   }
}
