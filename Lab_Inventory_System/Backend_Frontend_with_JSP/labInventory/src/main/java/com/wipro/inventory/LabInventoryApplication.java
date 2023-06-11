package com.wipro.inventory;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class LabInventoryApplication {

	public static void main(String[] args) {
		SpringApplication.run(LabInventoryApplication.class, args);
		System.out.println("Server up!!");
	}

}
