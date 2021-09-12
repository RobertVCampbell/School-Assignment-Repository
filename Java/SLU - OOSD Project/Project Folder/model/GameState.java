package model;

import java.io.IOException;

public interface GameState {
	public boolean monWon();
	public boolean playerWon() throws IOException;

}
