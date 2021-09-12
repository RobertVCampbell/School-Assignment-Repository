package control;

import model.*;
import model.io.*;
import ui.*;
import ui.student.*;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.ArrayList;

public class StudentQuizControl
{
   private String lastLine = "";
   private Scanner scanner;
   private Quiz quiz;
   private QuizUI quizUI;

   public StudentQuizControl(String course, String name, String dir) throws FileNotFoundException
   {
      quiz = new Quiz(course, name);
      quizUI = new QuizUI(quiz);

      FileReader quizReader = new FileReader(dir+"/"+quiz.getQuizName()+".dat");
      ArrayList<Token> questions = quizReader.getTokens();
      for (int i = 0; i < questions.size(); i++)
      {
         Token token = questions.get(i);
         IQuestionPanel qPanel = null;
         switch (token.type)
         {
            case M:
               MultipleChoiceQuestion qMultipleChoice = new MultipleChoiceQuestion(token);
               qPanel = new MultipleChoiceQuestionPanel(qMultipleChoice);
               quiz.addQuestion(qMultipleChoice);
               break;

            case N:
               NumericQuestion qNumeric = new NumericQuestion(token);
               qPanel = new NumericQuestionPanel(qNumeric);
               quiz.addQuestion(qNumeric);
               break;
         }
         if (qPanel != null)
         {
            quizUI.addQuestionPanel(qPanel);
         }
      }
      SubmitListener submit = new SubmitListener(quizUI, new Student(1234356), quiz, "data");
      quizUI.addSubmitListener(submit); 
      quizUI.makeVisible();
   }

}
