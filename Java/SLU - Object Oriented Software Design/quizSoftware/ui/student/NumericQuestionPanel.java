package ui.student;

import ui.IQuestionPanel;
import model.NumericQuestion;

import javax.swing.*;
import java.text.NumberFormat;
import java.awt.event.*;
import java.awt.Dimension;
import javax.swing.event.*;

public class NumericQuestionPanel implements IQuestionPanel, DocumentListener
{
   private NumericQuestion question;
   JTextField answer;
   JLabel questionWording;
   JLabel blankFiller;

   public NumericQuestionPanel(NumericQuestion q)
   {
      this.question = q;
      questionWording = new JLabel("What is 5+5?");
      answer = new JTextField();
      answer.getDocument().addDocumentListener(this);
      blankFiller = new JLabel();
      blankFiller.setPreferredSize(new Dimension(400, 500));
   }

   private void setAnswer()
   {
      question.setAnswer(answer.getText());
   }


   @Override
   public void render(JPanel panel)
   {
      panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
      panel.add(questionWording);
      panel.add(answer);
      panel.add(blankFiller);
      panel.revalidate();
      panel.repaint();
   }
 
   @Override
   public void insertUpdate(DocumentEvent event)
   {
      setAnswer();
   }

   @Override
   public void changedUpdate(DocumentEvent event)
   {
      setAnswer();
   }

   @Override
   public void removeUpdate(DocumentEvent event)
   {
   }
}
