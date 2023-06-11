package com.wipro.inventory.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wipro.inventory.entity.Admin;
import com.wipro.inventory.entity.Inventory;
import com.wipro.inventory.repository.Adminrepo;
import com.wipro.inventory.repository.InventoryRepo;

@Service
public class InventoryServiceImpl implements InventoryService {
	@Autowired
	private Adminrepo adminrepo;
	@Autowired
	private InventoryRepo repo;

	@Override
	public boolean addItem(Inventory item) {
		// TODO Auto-generated method stub
		// System.out.println("inside service");
		if (repo.findByName(item.getName()) == null) {
			//item.setRequested(true);
			repo.save(item);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteItem(String name) {
		// TODO Auto-generated method stub
		Inventory item = repo.findByName(name);
		if (item != null) {
			repo.delete(item);
			return true;
		}
		return false;
	}

	public List<Inventory> getItems() {
		ArrayList<Inventory> items = new ArrayList<Inventory>();
		items = (ArrayList<Inventory>) repo.findAll();
		return items;
	}

	@Override
	public Inventory findByName(String name) {
		Inventory item = repo.findByName(name);
		return item;
	}

	@Override
	public void updateItem(int id1, Inventory item) {
		Inventory item1 = repo.findById(id1).orElse(null);
		if (item1 != null) {
			item1.setName(item.getName());
			item1.setQuantity(item.getQuantity());
			item1.setId(item.getId());
			repo.save(item1);
		}
		// System.out.println(id1 + " " + item + "");
	}

	@Override
	public void requestItem(String name, String user) {
		// TODO Auto-generated method stub
		Inventory item = repo.findByName(name);
		Admin userloggined = adminrepo.findByUsername(user);
		List<Inventory> arr = userloggined.getAccept();
		arr.add(item);
		item.setRequested(true);
		item.setAccepted(false);
		userloggined.setAccept(arr);
		adminrepo.save(userloggined);
		;
	}

	@Override
	public List<Inventory> acceptItems() {
		List<Inventory> arr = new ArrayList<Inventory>();
		List<Inventory> temp = repo.findAll();
		for (Inventory i : temp) {
			if (i.isRequested()) {
				arr.add(i);
			}

		}
		// System.out.println(arr);
		// TODO Auto-generated method stub
		return arr;
	}

	@Override
	public void acceptItem(String name) {
		// TODO Auto-generated method stub
		Inventory item = repo.findByName(name);
		int quantity = item.getQuantity();
		repo.delete(item);
		if (quantity > 0) {
			quantity -= 1;
		}

		item.setAccepted(true);
		item.setRequested(false);
		item.setQuantity(quantity);
		repo.save(item);
	}

	@Override
	public void declineItem(String name) {
		// TODO Auto-generated method stub
		Inventory item = repo.findByName(name);
		repo.delete(item);
		item.setAccepted(false);
		item.setRequested(false);
		repo.save(item);
	}

	@Override
	public boolean isUser(String name) {
		// TODO Auto-generated method stub
		Admin admin = adminrepo.findByUsername(name);
		boolean isuser = admin.isIsuser();
		return false;
	}

	@Override
	public List<Inventory> search(String name) {
		// TODO Auto-generated method stub
		List<Inventory> arr = new ArrayList<Inventory>();
		List<Inventory> items = repo.findAll();
		for (Inventory item : items) {
			if (item.getName().contains(name)) {
				arr.add(item);
			}
		}
		return arr;
	}

	@Override
	public List<Inventory> requestedItems() {
		// TODO Auto-generated method stub
		List<Inventory> arr = repo.findAll();
		List<Inventory> items = new ArrayList<Inventory>();
		for (Inventory i : arr) {
			if (i.isRequested()) {
				items.add(i);
			}
		}

		return items;
	}

}