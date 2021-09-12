/*
 * Best scores per level
 */

package model;

public class HighScores
{
   /**
    * Determines if there is a new high score (leader). Updates the high scores
    * if we have a new leader.
    * @param score a new high score candidate
    * @return true if the given score is a new leader, false otherwise
    */
   public boolean isNewLeader(Score score)
   {
       System.out.println("isNewLeader");
       return false;
   }

   /**
    * Provides the high score for the given difficulty level
    * @param level difficulty level of the requested high score
    * @return the high score for the given difficulty level
    */
   public Score getLeader(Level level)
   {
       System.out.println("getLeader");
       return null;
   }
}
