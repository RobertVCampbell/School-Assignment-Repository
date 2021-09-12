package model;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Arrays;

public class GameLogicTest{
	
	//Adapted from GameLogicTest1.java
	public static void testConstructors() throws FileNotFoundException{
		//Test default constructor
		GameLogic game1 = new GameLogic();
		
		if(game1.turnCount != 0){
			System.out.println("ERROR in default constructor: Expected turncount == 0, returned: " + game1.turnCount);
		}
		if(game1.difficulty != 2){
			System.out.println("ERROR in default constructor: Expected difficulty == 2, returned: " + game1.difficulty );
		}
		
		//Player and monster initial position
		if((game1.player.x != 0) || (game1.player.y != 6)){
			System.out.println("ERROR in default constructor: Expected player position (0,6), returned: (" + game1.player.x + ", " + game1.player.y + ")");
		}
		if((game1.mon.x != 5) || (game1.mon.y != 4)){
			System.out.println("ERROR in default constructor: Expected monster position (5,4), returned: (" + game1.mon.x + ", " + game1.mon.y + ")");
		}
		
		//Player and monster sight
		if(game1.player.sight != 1){
			System.out.println("ERROR in default constructor: Expected player sight == 1, returned" + game1.player.sight);
			
		}
		if(game1.mon.sight != 1){
			System.out.println("ERROR in default constructor: Expected monster sight == 1, returned" + game1.mon.sight);
			
		}
		
		//Player and monster turnRate
		if(game1.player.turnRate != 1){
			System.out.println("ERROR in default constructor: Expected player turnRate == 1, returned" + game1.player.turnRate);
		}
		if(game1.mon.turnRate != 2){
			System.out.println("ERROR in default constructor: Expected monster turnRate == 2, returned" + game1.mon.turnRate);
		}
		if(game1.mon.turnRate != game1.difficulty){
			System.out.println("ERROR in default constructor: Expected monster turnRate == difficulty. \nTurn rate returned: " + game1.mon.turnRate + ", Difficulty returned: " + game1.difficulty);
		}
		
		
		//Test constructor with difficulty argument
		GameLogic game2 = new GameLogic(1);
		
		if(game2.turnCount != 0){
			System.out.println("ERROR in default constructor: Expected turncount == 0, returned: " + game2.turnCount);
		}
		if(game2.difficulty != 1){
			System.out.println("ERROR in default constructor: Expected difficulty == 2, returned: " + game2.difficulty );
		}
		
		//Player and monster initial position
		if((game2.player.x != 0) || (game2.player.y != 6)){
			System.out.println("ERROR in default constructor: Expected player position (0,6), returned: (" + game2.player.x + ", " + game2.player.y + ")");
		}
		if((game2.mon.x != 5) || (game2.mon.y != 4)){
			System.out.println("ERROR in default constructor: Expected monster position (5,4), returned: (" + game2.mon.x + ", " + game2.mon.y + ")");
		}
		
		//Player and monster sight
		if(game2.player.sight != 1){
			System.out.println("ERROR in default constructor: Expected player sight == 1, returned" + game2.player.sight);
			
		}
		if(game2.mon.sight != 1){
			System.out.println("ERROR in default constructor: Expected monster sight == 1, returned" + game2.mon.sight);
			
		}
		
		//Player and monster turnRate
		if(game2.player.turnRate != 1){
			System.out.println("ERROR in default constructor: Expected player turnRate == 1, returned" + game2.player.turnRate);
		}
		if(game2.mon.turnRate != 1){
			System.out.println("ERROR in default constructor: Expected monster turnRate == 2, returned" + game2.mon.turnRate);
		}
		if(game2.mon.turnRate != game2.difficulty){
			System.out.println("ERROR in default constructor: Expected monster turnRate == difficulty. \nTurn rate returned: " + game2.mon.turnRate + ", Difficulty returned: " + game2.difficulty);
		}
		
	}
	
	public static void testIncTurn() throws FileNotFoundException{
		GameLogic gameL = new GameLogic();
		gameL.turnCount = 0;
		
		gameL.incTurn();
		
		if(gameL.turnCount != 1){
			System.out.println("ERROR in incTurn(): Expected turnCount == 1, returned " + gameL.turnCount);
		}
		gameL.incTurn();
		if(gameL.turnCount != 2){
			System.out.println("ERROR in incTurn(): Expected turnCount == 2, returned " + gameL.turnCount);
		}
	}
	
	public static void testGetPlayerSight() throws FileNotFoundException{
		GameLogic gameL = new GameLogic();
		
		gameL.player.sight = 3;
		if((gameL.getPlayerSight()) != 3){
			System.out.println("ERROR in getPlayerSight(): Expected 3, returned " + gameL.getPlayerSight());
		}
		
	}
	
	public static void testGetMonRate()throws FileNotFoundException{
		GameLogic gameL = new GameLogic();
		
		gameL.mon.turnRate = 7;
		
		if((gameL.getMonRate()) != 7){
			System.out.println("ERROR in getMonRate(): Expected 7, returned " + gameL.getMonRate());
		}
		
	}
	
	public static void testGetTurnCount()throws FileNotFoundException{
		GameLogic gameL = new GameLogic();
		
		gameL.turnCount = 9;
		
		if((gameL.getTurnCount()) != 9 ){
			System.out.println("ERROR in getTurnCount(): Expected 9, returned: " + gameL.getTurnCount());
		}
		
	}
	
	public static void testGetMaze()throws FileNotFoundException{
		GameLogic gameL = new GameLogic();
		int[][] test;
		int[][] compare = {{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1 },
                           {1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1 },
                           {1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1 },
                           {1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0 },
                           {1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1 },
                           {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1 },
                           {1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1 },
                           {0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1 },
                           {1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1 },
                           {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1 },
                           {1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1 },
                           {1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1 },
                           {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1 }};
		
		test = gameL.getMaze();
		
		for(int i = 0; i < 7 ; i++){
			for(int j = 0; j < 7; j++){
				if(compare[i][j] != test[i][j])
					System.out.println("ERROR in getMaze(): Expected " + compare[i][j] + " at (" + j + ", " + i + ")\nReturned " + test[i][j]);
			}
		}
	}
	
	
	//Adapted from GameLogicTest2()
	public static void testLoadSave() throws FileNotFoundException, IOException{
		GameLogic gameL = new GameLogic();
		//int[] fake = {0, 0};
		gameL.scores[0] = 0;
		gameL.scores[1] = 50;
		
		//System.out.println("Fake: " + Arrays.toString(fake) + "Actual: " + Arrays.toString(gameL.scores) );

		
		gameL.loadScores();

		//System.out.println("Fake: " + Arrays.toString(fake) + " Actual: " + Arrays.toString(gameL.scores) );
		if(gameL.scores[0] == 0 || gameL.scores[1] != 0) {
			System.out.println("Error in loadScores(): Expected non-zero values, returned: " + gameL.scores[0] + ", " + gameL.scores[1]);
		}
		//System.out.println("Fake: " + Arrays.toString(fake) + "Actual: " + Arrays.toString(gameL.scores) );
		
		//int[] fake2 = {10,20};
		gameL.scores[0] = 10;
		gameL.scores[1] = 20;

		//System.out.println("Fake: " + Arrays.toString(fake2) + "Actual: " + Arrays.toString(gameL.scores) );
		gameL.saveScores();
		
		gameL.scores[0] = 9999;
		gameL.scores[1] = 9999;
		gameL.saveScores();
		
		
		
		
	}
	
		
	public static void testGetHighScore()throws FileNotFoundException{
		GameLogic gameL = new GameLogic();
		int[] test = {25, 32};
		gameL.scores = test;
		gameL.difficulty = 1;
		
		if((gameL.getHighScore()) != 25){
			System.out.println("ERROR in getHighScore(): Expected 25, returned " + gameL.getHighScore() + " from score index " + ((gameL.difficulty) - 1) );
		}
		
		gameL.difficulty = 2;
		if((gameL.getHighScore()) != 32){
			System.out.println("ERROR in getHighScore(): Expected 25, returned " + gameL.getHighScore() + " from score index " + ((gameL.difficulty) - 1) );
		}
	}
	
	
	
	//Pulled from GameLogicTest3.java
	public static void testPlayerPos()throws FileNotFoundException{
		GameLogic gameL = new GameLogic();
		int[] pos = gameL.getPlayerPos();
		
		if((pos[0] != 0) || (pos[1] != 6)){
			System.out.println("ERROR in getPlayerPos(). Expected initial position (0,6), returned ("+ pos[0] + ", " + pos[1] + ").");
		} 
		
		gameL.player.x = 2;
		gameL.player.y = 1;
		
		pos = gameL.getPlayerPos();
		
		if((pos[0] != 2) || (pos[1] != 1)){
			System.out.println("ERROR in getPlayerPos(). Expected (2,1), returned ("+ pos[0] + ", " + pos[1] + ").");
		} 
	}
	
	public static void testMonPos()throws FileNotFoundException{
		GameLogic gameL = new GameLogic();
		int[] pos = gameL.getMonPos();
		
		if((pos[0] != 5) || (pos[1] != 4)){
			System.out.println("ERROR in getMonPos(). Expected initial position (5,4), returned ("+ pos[0] + ", " + pos[1] + ").");
		} 
		
		gameL.mon.x = 2;
		gameL.mon.y = 1;
		
		pos = gameL.getMonPos();
		
		if((pos[0] != 2) || (pos[1] != 1)){
			System.out.println("ERROR in getMonPos(). Expected (2,1), returned ("+ pos[0] + ", " + pos[1] + ").");
		} 
		
	}
	
	public static void testHandleMove()throws FileNotFoundException{
		GameLogic gameL = new GameLogic();
		
		int[] test = gameL.handleMove(0, 6);

		if(test.length < 2){
			System.out.println("ERROR in handleMove(0,6): Returned less than one ordered pair.");
		}
		if((test.length % 2) != 0){
			System.out.println("ERROR in handleMove(0,6): Returned incomplete coordinate pairs.");	
		}
		if((test.length) != 12){
			System.out.println("ERROR in handleMove(0,6): Expected array of length 12, returned " + test.length);
		}
		
		//Array values:
		//Expecting: {0, 6, 0, 5, 1, 6, -1, -1, -1, -1, 5, 4}
		int[] ans1 = {0, 6, 0, 5, 1, 6, -1, -1, -1, -1, 5, 4};		
		for(int i = 0; i < test.length; i++){	
			if(test[i] != ans1[i]){
				System.out.println("ERROR in handleMove(0,6): Expected " + ans1[i] + " at index " + i + ", but array contained " + test[i] + ".");
				System.out.println("Array: " + Arrays.toString(test));

			}
		}
		
		test = gameL.handleMove(0, 5);

		if(test.length < 2){
			System.out.println("ERROR in handleMove(0,5): Returned less than one ordered pair.");
		}
		if((test.length % 2) != 0){
			System.out.println("ERROR in handleMove(0,5): Returned incomplete coordinate pairs.");	
		}
		if((test.length) != 12){
			System.out.println("ERROR in handleMove(0,5): Expected array of length 12, returned " + test.length);
		}
		
		//Array values:
		//Expecting: {0, 5, 0, 4, 1, 5, 0, 6, -1, -1, 5, 4}
		int[] ans2 = {0, 5, 0, 4, 1, 5, 0, 6, -1, -1, 5, 4};		
		for(int i = 0; i < test.length; i++){	
			if(test[i] != ans2[i]){
				System.out.println("ERROR in handleMove(0,5): Expected " + ans2[i] + " at index " + i + ", but array contained " + test[i] + ".");
				System.out.println("Array: " + Arrays.toString(test));
			}
		}
		test = gameL.handleMove(1, 5);

		if(test.length < 2){
			System.out.println("ERROR in handleMove(1,5): Returned less than one ordered pair.");
		}
		if((test.length % 2) != 0){
			System.out.println("ERROR in handleMove(1,5): Returned incomplete coordinate pairs.");	
		}
		if((test.length) != 12){
			System.out.println("ERROR in handleMove(1,5): Expected array of length 12, returned " + test.length);
		}
		
		//Array values:
		//Expecting: {1, 5, 1, 4, 2, 5, -1, -1, 0, 5, 5, 5}
		int[] ans3 = {1, 5, 1, 4, 2, 5, -1, -1, 0, 5, 5, 5};		
		for(int i = 0; i < 10; i++){	
			if(test[i] != ans3[i]){
				System.out.println("ERROR in handleMove(1,5): Expected " + ans3[i] + " at index " + i + ", but array contained " + test[i] + ".");
				System.out.println("Array: " + Arrays.toString(test));
			}			                         
		}
		if(test[11] != ans3[11]) {
			if(test[11] == ans2[11]) {
				System.out.println("Warning in handleMove(1,5): Monster should have moved but returned the start position (" + test[10] + "," + test[11]+ ").");
				System.out.println("Turn count: " + gameL.turnCount);
			}
			else {
			System.out.println("Warning in handleMove(1,5): Monster should have moved but returned position (" + test[10] + "," + test[11]+ ").");
			System.out.println("Turn count: " + gameL.turnCount);}
			System.out.println("MonPos: (" + gameL.mon.x + ", " + gameL.mon.y + "). Array: (" + test[10] + "," + test[11]+ ")." );
			
		}

		
		
		/* Old test from using an enum. Now works using x,y pairs.
		 * boolean valid;
		//valid move 
		valid = gameL.handleMove(Direction.UP);
		if(!valid){
			System.out.println("ERROR in handleMove(Direction.UP): Expected true, returned " + valid + ".");	
		}
		
		gameL.player.x = 2;
		gameL.player.y = 1;
		
		//Invalid move, wall
		valid = gameL.handleMove(Direction.RIGHT);
		if(valid){
			System.out.println("ERROR in handleMove(Direction.UP): Expected false, returned " + valid + ".");	
		}
		
		gameL.player.x = 0;
		gameL.player.y = 0;
		
		//Invalid move, wall
		valid = gameL.handleMove(Direction.UP);
		if(valid){
			System.out.println("ERROR in handleMove(Direction.UP): Expected false, returned " + valid + ".");	
		}*/
		
	}
	
	public static void testIsOver()throws IOException, FileNotFoundException{
		GameLogic gameL = new GameLogic();
		gameL.player.x = 2;
		gameL.player.y = 1;
		gameL.mon.x = 2;
		gameL.mon.y = 1;
		
		boolean valid;
		//Game is over, monster and player are overlapping
		valid = gameL.isOver();
		if(!valid){
			System.out.println("ERROR in isOver() test 1: Expected true, returned false.");	
		}
		
		if(gameL.monWon()) {
			System.out.println("ERROR in monWon() test 1: Expected false, returned true.");	
		}
		
		if(gameL.playerWon()) {
			System.out.println("ERROR in playerWon() test 1: Expected false, returned true.");	
		}
		
		gameL.mWon = true;
		gameL.pWon = true;
		
		if(!(gameL.monWon())) {
			System.out.println("ERROR in monWon() test 2: Expected true, returned false.");	
		}
		
		if(!(gameL.playerWon())) {
			System.out.println("ERROR in playerWon() test 1: Expected true, returned false.");	
		}
		
		gameL.player.x = 0;
		gameL.player.y = 0;
		
		//Game is not over, player and monster are in different positions
		valid = gameL.isOver();
		if(valid){
			System.out.println("ERROR in isOver(): Expected false, returned true.");	
		}		
		if(gameL.monWon()) {
			System.out.println("ERROR in monWon() test 1: Expected false, returned true.");	
		}
		
		if(gameL.playerWon()) {
			System.out.println("ERROR in playerWon() test 1: Expected false, returned true.");	
		}
	}
	

	
	public static void main(String []args)throws FileNotFoundException, IOException
	{
		testConstructors();
		testIncTurn();
		testGetPlayerSight();
		testGetMonRate();
		testGetTurnCount();
		testGetMaze();
			
		testGetHighScore();
		
		testPlayerPos();
		testMonPos();
		testHandleMove();
		testIsOver();
		
		testLoadSave();
		
	}
	

}
