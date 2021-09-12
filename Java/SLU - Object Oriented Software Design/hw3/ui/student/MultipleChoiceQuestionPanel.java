package ui.student;
import ui.IQuestionPanel;
import model.MultipleChoiceQuestion;
import javax.swing.*;
import java.awt.event.*;
import java.util.ArrayList;

public class MultipleChoiceQuestionPanel implements IQuestionPanel, ActionListener
{
   private MultipleChoiceQuestion question;
   ArrayList<JRadioButton> options;
   ButtonGroup group;
   JLabel questionWording;

   public MultipleChoiceQuestionPanel(MultipleChoiceQuestion q)
   {
      this.question = q;
      this.options = new ArrayList<JRadioButton>();
      questionWording = new JLabel(q.getQuestionWording());
      ArrayList<String> choices = question.getChoices();
      group = new ButtonGroup();
      for (int i = 0; i < choices.size(); i++)
      {
         JRadioButton b = new JRadioButton(choices.get(i));
         options.add(b);
         b.addActionListener(this);
         group.add(b);
      }
   }

   @Override
   public void render(JPanel panel)
   {
      panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
      panel.add(questionWording);
      for(int i = 0; i < options.size(); i++)
      {
         panel.add(options.get(i));
      }
      panel.revalidate();
      panel.repaint();
   }

   @Override
   public void actionPerformed(ActionEvent e)
   {
      String answer = e.getActionCommand();
      question.setAnswer(answer);     
   }
}

