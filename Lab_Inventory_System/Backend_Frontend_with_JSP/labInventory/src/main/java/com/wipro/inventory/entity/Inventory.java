package com.wipro.inventory.entity;

	import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Component;
	
	
	@Entity
	@Component
	public class Inventory {
		@Id
		@GeneratedValue
		private int id;
		@NotBlank(message="* Component name shouldnot be empty")
		private String name;
		@Min(value=0,message=" * Minimum value should be zero")
		@Max(value=100,message=" * Maximum value should be 100")
		@NotNull(message="* Enter valid quantity")
		private Integer quantity;
		private boolean requested;
		private boolean accepted;
		@ManyToMany(mappedBy = "accept")
		private List<Admin> adminid;
		private String username;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public Integer getQuantity() {
			return quantity;
		}
		public void setQuantity(Integer quantity) {
			this.quantity = quantity;
		}
		public boolean isRequested() {
			return requested;
		}
		public void setRequested(boolean requested) {
			this.requested = requested;
		}
		public boolean isAccepted() {
			return accepted;
		}
		public void setAccepted(boolean accepted) {
			this.accepted = accepted;
		}
		public List<Admin> getAdminid() {
			return adminid;
		}
		public void setAdminid(List<Admin> adminid) {
			this.adminid = adminid;
		}
		
		public String getUsername() {
			return username;
			
		}
		public void setUsername(String username) {
			this.username = username;
			
		}
		
		@Override
		public String toString() {
			return "Inventory [id=" + id + ", name=" + name + ", quantity=" + quantity + ", requested=" + requested
					+ ", accepted=" + accepted + ", adminid=" + adminid + ", username=" + username + "]";
		}
	
}
