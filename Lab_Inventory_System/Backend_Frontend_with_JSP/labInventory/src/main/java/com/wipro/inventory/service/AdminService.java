package com.wipro.inventory.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wipro.inventory.datatranfer.LoginDto;
import com.wipro.inventory.entity.Admin;
import com.wipro.inventory.repository.Adminrepo;
@Service
public class AdminService implements AdminServiceInterface{
	@Autowired
	private Adminrepo repo;
	
	
	@Override
	public boolean addAdmin(Admin admin) {
		// TODO Auto-generated method stub
		Admin adminhere=repo.findByUsername(admin.getUsername());
		if(adminhere==null) {
			//System.out.println("successful");
			//admin.setIsuser(true);
			repo.save(admin);
			return true;
		}
		else {
			return false;
		}
	}
		
		

	@Override
	public boolean findAdmin(LoginDto admin) {
		// TODO Auto-generated method stub
		//System.out.println(admin);
		Admin adminhere=repo.findByUsername(admin.getUsername());


		if(adminhere==null) {
			return false;
		}
		//System.out.println(adminhere);
		if(admin.getUsername().equals(adminhere.getUsername()) && (admin.getPassword().equals(adminhere.getPassword()))) {
			return true;
		}
		else {
			return false;
			}
		
	}
	
	@Override
	public Admin getAdmin(String name) {
		// TODO Auto-generated method stub
		Admin admin=repo.findByUsername(name);
		return admin;
	}
	@Override
	public List<Admin> getUsers() {
		// TODO Auto-generated method stub
		List<Admin> users=new ArrayList<Admin>();
		List<Admin> usersPresent=repo.findAll();
		for(Admin user:usersPresent) {
			if(user.isIsuser()) {
				users.add(user);
				}
		}
			return users;
		}
	@Override
	public Admin findByName(String name) {
		// TODO Auto-generated method stub
		Admin admin=repo.findByUsername(name);
		return admin;
		}
	@Override
	public void updateUser(Admin admin) {
		// TODO Auto-generated method stub
		Admin adminpresent=repo.findById(admin.getId()).orElse(null);
			if(admin!=null) {
			repo.delete(adminpresent);
			admin.setId(admin.getId());
			admin.setIsuser(true);
			repo.save(admin);
			}
		}

	@Override
		public void deleteUser(String name) {
	// TODO Auto-generated method stub
		Admin admin=repo.findByUsername(name);
		repo.delete(admin);
	}
	@Override
		public boolean findByNameBoolean(String name) {
		// TODO Auto-generated method stub
		Admin admin=repo.findByUsername(name);
		if(admin==null) {
			return false;
		}
		return true;
	}
	@Override
		public void changePassword(String username,String password) {
		// TODO Auto-generated method stub
		Admin admin=repo.findByUsername(username);
		Admin adminpresent=admin;
		adminpresent.setPassword(password);
		repo.delete(admin);
		repo.save(adminpresent);
	}
	@Override
	public boolean validAdminPassword(String username,String password) {
	// TODO Auto-generated method stub	
	Admin admin = repo.findByUsername(username);
	if (admin.getPassword().equals(password)) {
		return true;
	}
		return false;
	}
	

}