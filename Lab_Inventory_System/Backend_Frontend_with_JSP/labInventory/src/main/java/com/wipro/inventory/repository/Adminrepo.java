package com.wipro.inventory.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wipro.inventory.entity.Admin;
public interface Adminrepo extends JpaRepository<Admin, Integer>{
public Admin findByUsername(String username);

}
