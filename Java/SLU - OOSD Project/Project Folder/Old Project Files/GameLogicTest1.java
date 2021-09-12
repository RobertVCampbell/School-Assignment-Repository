/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import model.Maze;     
import static model.TurnCounter.turnCount;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author jeffreymartin
 */
public class GameLogicTest1 {
    
    public GameLogicTest1() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    @Test
    public void constructorTest1(){
        System.out.println("Game Logic constructor");
        GameLogic g = new GameLogic(0);
        int expResult = 0;
        int result  = g.getTurnCount();
        assertEquals(turnCount, result); 
   
        }   
    /**
     * Test of incTurn method, of class GameLogic.
     */
    @Test
    public void testIncTurn() {
        System.out.println("incTurn");
        GameLogic g = new GameLogic();
        g.incTurn();
        
    }

    /**
     * Test of getPlayerSight method, of class GameLogic.
     */
    @Test
    public void testGetPlayerSight() {
        System.out.println("getPlayerSight");
        GameLogic instance = new GameLogic();
        int expResult = 0;
        int result = instance.getPlayerSight();
        assertEquals(expResult, result);
    }

    /**
     * Test of getMonRate method, of class GameLogic.
     */
    @Test
    public void testGetMonRate() {
        System.out.println("getMonRate");
        GameLogic instance = new GameLogic();
        int expResult = 2;
        int result = instance.getMonRate();
        assertEquals(expResult, result);
    }

    /**
     * Test of getTurnCount method, of class GameLogic.
     */
    @Test
    public void testGetTurnCount() {
        System.out.println("getTurnCount");
        GameLogic instance = new GameLogic();
        int expResult = turnCount;
        int result = instance.getTurnCount();
        assertEquals(expResult, result);
    }

    /**
     * Test of getMaze method, of class GameLogic.
     */
    @Test
    public void testGetMaze() {
        System.out.println("getMaze");
        GameLogic instance = new GameLogic();
        int[][] expResult = instance.getMaze();
        int[][] result = instance.getMaze();
        assertArrayEquals(expResult, result);
       
    }
}


