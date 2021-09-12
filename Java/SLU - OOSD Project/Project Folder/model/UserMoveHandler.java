
package model;

public interface UserMoveHandler{
	//public boolean handleMove(Direction d);
	public int[] handleMove(int x, int y);
	public int[] getStart();
	
}