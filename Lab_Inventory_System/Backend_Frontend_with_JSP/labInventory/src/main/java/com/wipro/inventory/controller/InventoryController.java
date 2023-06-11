package com.wipro.inventory.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.wipro.inventory.entity.Admin;
import com.wipro.inventory.entity.Inventory;
import com.wipro.inventory.service.AdminService;
import com.wipro.inventory.service.InventoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class InventoryController {
	@Autowired
	private AdminController controller;
	@Autowired
	private InventoryService service;
		@Autowired
		private AdminService adminService;
		public String login(HttpServletRequest request,Model model) {
			HttpSession session=request.getSession();
			String name=(String) session.getAttribute("name");
			return name;
		}
		public boolean isUser(String name) {
			Admin admin=adminService.getAdmin(name);
			return admin.isIsuser();
			}
		@GetMapping("/additem")
		public String addItem(Model model,HttpServletRequest request) {
			String str=login(request,model);
			if(str==null) {
				return	controller.adminlogin(model);
			}
			model.addAttribute("item", new Inventory());
			model.addAttribute("present",false);
			return "additem";
		}
		@PostMapping("/addedItem")
		public String itemSuccessFull(@Valid @ModelAttribute("item") Inventory item,BindingResult result,Model model,HttpServletRequest request) {
			String str=login(request,model);
			if(str==null) {
				return controller.adminlogin(model);
			}
			if(result.hasErrors()) {
				model.addAttribute("present",false);
				return "additem";
				}

			if(service.addItem(item)) {
				return "redirect:getitems";
			}
			else {
		model.addAttribute("present",true);
		return "additem";
		}
	}
		
		@GetMapping("/deleteitem")
		public String deleteItem(@RequestParam("name") String name,Model model,HttpServletRequest request) {
			String str=login(request,model);
			if(str==null) {
				return controller.adminlogin(model);
			}
			service.deleteItem(name);
			getItems(model,request);
			String adminName=(String) request.getSession().getAttribute("name");
			boolean isuser=isUser(adminName);
			model.addAttribute("isuser", isuser);
			return "addedSuccessful";
		}
		@GetMapping("/getitems")
		public String getItems(Model model,HttpServletRequest request){
			String str=login(request,model);
			if(str==null) {
				return controller.adminlogin(model);
			}
			System.out.println("Anupam");
			String adminName=(String) request.getSession().getAttribute("name");
			boolean isuser=isUser(adminName);
			model.addAttribute("isuser", isuser);
			model.addAttribute("items", service.getItems());
			return "addedSuccessful";
		}
		@GetMapping("/updateitem")
		public String updateItem(@RequestParam("name") String name,Model model,HttpServletRequest request) {
			String str=login(request,model);
			if(str==null) {
				return controller.adminlogin(model);
			}
			Inventory item=service.findByName(name);
			//System.out.println(item);
			model.addAttribute("item",item);
			return "updateitem";
		}
		@PostMapping("/updateditem")
		public String updateditem(@Valid @ModelAttribute("item") Inventory item,BindingResult result,HttpServletRequest request,Model model) {
			//System.out.println("item");
			String str=login(request,model);
			if(str==null) {
				return controller.adminlogin(model);
			}
			if(result.hasErrors()) {
				return "updateitem";
			}
			service.updateItem(item.getId(),item);
			return "redirect:getitems";
		}
		@GetMapping("/requestitem")
		public String requestItem(@RequestParam("name") String name,Model model,HttpServletRequest request) {
			String str=login(request,model);
			if(str==null) {
				return controller.adminlogin(model);
			}
			String user=(String) request.getSession().getAttribute("name");
			service.requestItem(name,user);
			model.addAttribute("added", "Item requested Successfully");
			model.addAttribute("items", service.getItems());
			String adminName=(String) request.getSession().getAttribute("name");
			boolean isuser=isUser(adminName);
			model.addAttribute("isuser", isuser);
			return "addedSuccessful";
			}
	@GetMapping("/acceptitems")
	public String acceptItems(Model model,HttpServletRequest request) {
		String str=login(request,model);
			if(str==null) {
				return	controller.adminlogin(model);
			}
			List<Inventory> items1=service.acceptItems();
			//System.out.println(items1+"uyh");
			model.addAttribute("items", items1);
			model.addAttribute("isuser", false);
			return "acceptitems";
		}
	@GetMapping("/acceptitem")
	public String acceptItem(@RequestParam("name") String name,Model model,HttpServletRequest request)
	{
		String str=login(request,model);
		if(str==null) {
	return controller.adminlogin(model);
	}
	service.acceptItem(name);
	List<Inventory> items1=service.acceptItems();
	
	model.addAttribute("items", items1);
	model.addAttribute("isuser", false);
	 return "acceptitems";
	}
	@GetMapping("/requesteditems")
	public String requestedItems(Model model) {
		model.addAttribute("items", service.getItems());
		return "acceptitems";
	}
	 @GetMapping("/decline")
	public String declineItem(@RequestParam("name") String name, Model model,HttpServletRequest request){
	 String str=login(request,model);
	 if(str==null) {
	return controller.adminlogin(model);
	 }
	 service.declineItem(name);
	return "redirect:acceptitems";
	}
	 @GetMapping("/search")
	 public String searchItem(@RequestParam("name") String name, Model model,HttpServletRequest request){
	 String str=login(request,model);
	 if(str==null) {
	return controller.adminlogin(model);
	}
	List<Inventory> arr=service.search(name);
	model.addAttribute("items", arr);
	String adminName=(String) request.getSession().getAttribute("name");
	boolean isuser=isUser(adminName);
	model.addAttribute("isuser", isuser);
	return "addedSuccessful";
	}

}