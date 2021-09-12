package model;
import java.util.*;
import java.lang.Math;
import java.io.*;



@SuppressWarnings("deprecation")
public class GameLogic extends Observable implements UserMoveHandler, TurnCounter

{
    protected int turnCount;
    protected int[] scores = {9999, 9999};
    protected int[] start;
	
    // Difficulty only effects the monster turn rate
	// Currently only 2 for easy 1 for hard
	// Used as an off-by-one index for the scores array
    protected int difficulty;
    
    //Boolean flags to track the winner
    protected boolean pWon;
    protected boolean mWon;
    
	protected Character mon;
    protected Character player;
    protected Maze maze = new Maze();

    //Filereader that loads in highscores into the scores array
    protected void loadScores() throws FileNotFoundException {
    	File inputFile = new File("model/scores.dat");
    	Scanner scanner = new Scanner(inputFile);
    	scores[0] = scanner.nextInt();
    	scores[1] = scanner.nextInt();
    	scanner.close();    	
    }

    //Save highscores as a file to be loaded later
    protected void saveScores() throws IOException {
    	String score = ("" + scores[0] + " " + scores[1] + "");
    	//System.out.println(score);
    	BufferedWriter writer = new BufferedWriter(new FileWriter("model/scores.dat"));
    	writer.write(score);
    	writer.close();
    	
    }


    public GameLogic() throws FileNotFoundException{
        turnCount = 0;
        difficulty = 2;
        loadScores();
        player = new Character(0 ,6, 1, 1);
        mon = new Character(5, 4, 1, difficulty);
        
        int[] startArray = {0, 6, 0, 5, 1, 6, -1, -1, -1, -1, 5, 4};
        start = startArray;
        
    }

    public GameLogic(int dif) throws FileNotFoundException{
        turnCount = 0;
        difficulty = dif;
        loadScores();

        //Conditional statements for difficulty settings
        player = new Character(0 ,6, 1, 1);
        mon = new Character(5, 4, 1, difficulty);
        int[] startArray = {0, 6, 0, 5, 1, 6, -1, -1, -1, -1, 5, 4};
        start = startArray;
    }

    public void setHighScore(){}

    public void incTurn(){
		turnCount += 1;
	}

    public int getPlayerSight(){return player.getSight();}

    public int getMonRate(){return mon.getRate();}
	
	public boolean isMonTurn(){return ((turnCount% (mon.getRate())) == 0);}
		
	
	/* Checks if the player is in the monsters sight and moves there if they are.
	*  If not, it pulls the all the monsters possible moves into an array with
	*   {Current positionx, y, upx, y, rightx, y, downx y, leftx, y}
	*   and selects one at random. Loops until it successfully completes.
	* Reset's the monster to start position if it takes more than 1000 loops
	*/
	public void monMove(){
		if(maze.isInSightline(mon,player)){
			mon.setX(player.getX());
			mon.setY(player.getY());
			mWon = true;
			return;
		}
		else{
			int[] options = maze.visible(mon);
			int move = (int)(((Math.random()) * 4)+1);
			move = move * 2;
			int loop = 100;			
			
			do{
				if(options[move] != -1){
					mon.setX(options[move]);
					mon.setY(options[move+1]);
					return;
				}
				
				else if(loop == 0){
					mon.setX(5);
					mon.setY(4);
					return;
				}
				
				else{
					move = (int)(((Math.random()) * 4)+1);
					move = move * 2;
					loop -= 1;

				}
			}while(true);
		}
		
	}

    public int getHighScore(){return scores[difficulty - 1];}

	//From TurnCounter interface	
    public int getTurnCount(){return turnCount;}

    
    public int[] getPlayerPos(){
	int[] p = {player.getX(),player.getY()};
	return p;}

    
    public int[] getMonPos(){
	int[] p = {mon.getX(),mon.getY()};
	return p;}

    
    public int[][] getMaze(){return (maze.getMaze());}

    
	/*Tests if player and monster are overlapping*/
	public boolean isOver(){ 
		if( (player.getX() == mon.getX()) && (player.getY() == mon.getY()) )
			return true;
		else
			return false;
	}
	
	
	/*From GameState interface*/
	//Tests if the game is over and if the player won
	public boolean playerWon() throws IOException {
		if((isOver()) && pWon) {
			if(turnCount < scores[difficulty-1]) {
				scores[difficulty - 1] = turnCount;
				saveScores();
			}
			return true;
		}
		else
			return false;
	}
	
	//Tests if the game is over and if the monster won
	public boolean monWon() {
		if((isOver()) && mWon) {
			return true;
		}
		else
			return false;
	}
	
	/*From UserMoveHandler interface*/
	/* Takes movement grid selection from ui and returns
	 *  the current character position, all visible tiles/valid movement tiles, and
	 *  the monster's current position, in a structured int array.
	 *  
	 *  Array structure:
	 *  	{PlayerX, PlayerY, Up X, Up Y, Right X, Right Y, Down X, Down Y, Mon X, Mon Y}
	 *  
	 *  Each array position pair (like player x and y) will return the valid position values, or 
	 *  if the move is invalid it will return (-1, -1)
	 *  
	 *  The logic will also call to test if the game is over and call for monster to move as apporpriate
	 * */
	  public int[] handleMove(int x, int y){
		int[] positions = new int[12];
		int[] vis = maze.visible(player);
		boolean valid = false;
		
		for(int i = 2; i < 9 ; i+= 2) {
			if(vis[i] == x) {
				if(vis[i+1] == y) {
					valid = true;
					break;
				}
			}
		}
		
		if(valid) {
			player.setX(x);
			player.setY(y);
			
			vis = maze.visible(player);
			
			incTurn();
			
			if(isOver()) {
				pWon = true;
			}
			else if(isMonTurn()) {
				monMove();
			}
			else {}
		}
		
		System.arraycopy(vis, 0, positions, 0, vis.length);
		positions[10] = mon.getX();
		positions[11] = mon.getY();
		setChanged();
		notifyObservers();
		return positions;
	  }

	  /* From userMoveHandler
	   * 	Returns the starting player position and vision, with monster position*/
		public int[] getStart() { return start;}

	
	
	
	/* Movement handling using an enum. No longer used.
	 * public boolean handleMove(Direction d){
	 * 
	 * int x = player.getX(); int y = player.getY(); int ax = x * 2; int ay = y * 2;
	 * 
	 * 
	 * int[][] m = maze.getMaze();
	 * 
	 * //Tests if the desired direction is in the array and // if the two rooms are
	 * connected.
	 * 
	 * if(d == Direction.UP){ if(((y-1)>= 0) && (m[(ay - 1)][ax] == 1)){
	 * player.setY(y-1); incTurn();
	 * 
	 * if(isOver()) { pWon = true; notifyObservers();
	 * 
	 * } else if(isMonTurn()){ monMove(); } return true; }
	 * 
	 * else{ return false; } }
	 * 
	 * else if(d == Direction.RIGHT){ if(((x+1)<= 6) && (m[(ay)][ax + 1] == 1)){
	 * player.setX(x+1); incTurn();
	 * 
	 * if(isOver()) { pWon = true; notifyObservers();
	 * 
	 * } else if(isMonTurn()){ monMove(); } return true; }
	 * 
	 * else{ return false; } }
	 * 
	 * else if(d == Direction.DOWN){ if(((y+1)<= 6) && (m[(ay + 1)][ax] == 1)){
	 * player.setY(y+1); incTurn(); if(isOver()) { pWon = true; notifyObservers();
	 * 
	 * } else if(isMonTurn()){ monMove(); } return true; }
	 * 
	 * else{ return false; } }
	 * 
	 * else if (d == Direction.LEFT){ if(((x-1)>= 0) && (m[(ay)][ax - 1] == 1)){
	 * player.setX(x-1); incTurn(); if(isOver()) { pWon = true; notifyObservers();
	 * 
	 * } else if(isMonTurn()){ monMove(); } return true; }
	 * 
	 * else{ return false; } }
	 * 
	 * else{ return false; } }
	 */
	
	

}
