package model.dataLoaders;

import java.io.FileNotFoundException;
import java.io.IOException;

import model.store.Inventory;

public interface InventoryLoader {
	public Inventory read() throws IOException, FileNotFoundException;
}
