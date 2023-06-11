package com.wipro.inventory.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.stereotype.Component;



@Entity
@Component
public class Admin {
	@Id
	private int id;
	@NotBlank(message="* Email required")
	@Email(message="* Please enter proper email")
	private String email;
	@Size(min=3,message=" * Username minimum length should be three")
	@Size(max=20,message=" * Username maximum length should be twenty")
	@NotBlank(message="* Username required")
	private String username;
	@Size(min=5,message="* Password length should contain atleast five")
	@NotBlank(message="* Password required")
	private String password;
	private boolean isuser;
	
	@ManyToMany(cascade=CascadeType.ALL)
	private List<Inventory> accept;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isIsuser() {
		return isuser;
	}
	public void setIsuser(boolean isuser) {
		this.isuser = isuser;
	}
	public List<Inventory> getAccept() {
		return accept;
	}
	public void setAccept(List<Inventory> accept) {
		this.accept = accept;
	}
	
	
	@Override
	public String toString() {
		return "Admin [id=" + id + ", email=" + email + ", username=" + username + ", password=" + password
				+ ", isuser=" + isuser + ", accept=" + accept + "]";
	}
	
}