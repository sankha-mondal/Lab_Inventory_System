package com.wipro.inventory.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.wipro.inventory.entity.Inventory;

@Repository

public interface InventoryRepo extends JpaRepository<Inventory,Integer>{

public Inventory findByName(String name);

}


