package com.wipro.inventory.service;

import java.util.List;

import com.wipro.inventory.entity.Admin;
import com.wipro.inventory.entity.Inventory;

public interface InventoryService {
	public boolean addItem(Inventory item);

	public boolean deleteItem(String name);

	public List<Inventory> getItems();

	public Inventory findByName(String name);

	public void updateItem(int id, Inventory item);

	public List<Inventory> acceptItems();

	public void requestItem(String name, String user);

	public void acceptItem(String name);
	
	public void declineItem(String name);

	public boolean isUser(String name);

	public List<Inventory> search(String name);

	public List<Inventory> requestedItems();
}