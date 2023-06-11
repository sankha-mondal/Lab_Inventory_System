package com.wipro.inventory.service;

import java.util.List;

import com.wipro.inventory.datatranfer.LoginDto;
import com.wipro.inventory.entity.Admin;

public interface AdminServiceInterface {
	public boolean addAdmin(Admin admin);

	public boolean findAdmin(LoginDto admin);

	public Admin getAdmin(String name);

	public List<Admin> getUsers();

	public Admin findByName(String name);

	public void updateUser(Admin admin);

	public void deleteUser(String name);

	public boolean findByNameBoolean(String name);

	public void changePassword(String username, String password);
	
	public boolean validAdminPassword(String username, String password);
	
}