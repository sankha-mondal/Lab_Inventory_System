package com.wipro.inventory.datatranfer;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.stereotype.Component;


@Component
public class LoginDto {
	@Size(min=3,message=" * Username's minimum length should be three")
	@Size(max=20,message=" * Username's maximum length should be twenty")
	@NotBlank(message="* Username required")
	private String username;
	@Size(min=5,message="* Password length should contain atleast five")
	@NotBlank(message="* Password required")
	private String password;
	public LoginDto() {
		super();
		//TODO Auto-generated constructor stub
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

}