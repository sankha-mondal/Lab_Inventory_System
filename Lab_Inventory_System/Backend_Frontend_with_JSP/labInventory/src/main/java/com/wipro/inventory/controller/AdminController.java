package com.wipro.inventory.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wipro.inventory.datatranfer.LoginDto;
import com.wipro.inventory.entity.Admin;
import com.wipro.inventory.service.AdminServiceInterface;


@Controller
public class AdminController {
	@Autowired
	private AdminServiceInterface service;

//	@GetMapping("/abc")
//	public String adminRegistrationPage() {
//		model.addAttribute("admin", new Admin());
//		model.addAttribute("present", false);
//		return "adminregistration";
//		return "redirect:adminlogin";
//	} 


	public boolean isUser(String name) {
		Admin admin = service.getAdmin(name);
		return admin.isIsuser();
	}

//	@PostMapping("/registrationsuccess")
//	public String registrationSuccessful(@Valid @ModelAttribute("admin") Admin admin, BindingResult result,
//			Model model) {
//		if (result.hasErrors()) {
//			model.addAttribute("present", false);
//			return "adminregistration";
//		}
//		boolean present = service.addAdmin(admin);
//		if (present) {
//			return "redirect:adminlogin";
//		} else {
//			model.addAttribute("present", true);
//			return "adminregistration";
//		}
//	}

	@GetMapping("/")
	public String adminlogin(Model model) {
		model.addAttribute("logindto", new LoginDto());
		model.addAttribute("admin" ,false);
		model.addAttribute("login", true);
		return "AdminLogin";
	}

	@PostMapping("/logintest")
	public String loginTest(@Valid @ModelAttribute("logindto") LoginDto admin, BindingResult result,
			HttpServletRequest request, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("admin" ,false);
			model.addAttribute("login", true);
			return "AdminLogin";
		}
		Admin admin1 = service.getAdmin(admin.getUsername());
		if (service.findAdmin(admin) && !admin1.isIsuser()) {
			HttpSession session = request.getSession(false);
			session.setAttribute("name", admin.getUsername());
			return "redirect:getitems";
		}
		else if(service.findAdmin(admin) && admin1.isIsuser()) {
			model.addAttribute("admin" ,true);
			model.addAttribute("login", true);
			return "AdminLogin";
		}
		else {
			model.addAttribute("admin" ,false);
			model.addAttribute("login", false);
			return "AdminLogin";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request, Model model) {
		model.addAttribute("logindto", new LoginDto());
		model.addAttribute("login", true);
		model.addAttribute("admin" ,false);
		request.getSession().invalidate();
		return "AdminLogin";
	}

	@GetMapping("/getusers")
	public String getUsers(Model model, HttpServletRequest request) {
		String name = (String) request.getSession().getAttribute("name");
		if (name == null) {
			return adminlogin(model);
		}
		String adminName = (String) request.getSession().getAttribute("name");
		boolean isuser = isUser(adminName);
		model.addAttribute("isuser", isuser);
		model.addAttribute("users", service.getUsers());
		return "userspage";
	}

	@GetMapping("/updateuser")
	public String updateUser(@RequestParam("name") String name, Model model) {
		Admin admin = service.findByName(name);
		model.addAttribute("admin", admin);
		model.addAttribute("present", false);
		return "updateuser";
	}

	@PostMapping("/updateuser")
	public String updateUser(@Valid @ModelAttribute("admin") Admin admin, BindingResult result,
			HttpServletRequest request, Model model) {
		String name = (String) request.getSession().getAttribute("name");
		if (name == null) {
			return adminlogin(model);
		}
		if (result.hasErrors()) {
			return "updateuser";
		}
		service.updateUser(admin);
		return getUsers(model, request);
	}

	@GetMapping("deleteuser")
	public String deleteUser(@RequestParam("name") String name1, Model model, HttpServletRequest request) {
		String name = (String) request.getSession().getAttribute("name");
		if (name == null) {
			return adminlogin(model);
		}
		service.deleteUser(name1);
		return getUsers(model, request);
	}

	@GetMapping("forgetpassword")
	public String forgetPassword(HttpServletRequest request, Model model) {
		model.addAttribute("present", false);
		return "forgetpassword";
	}

	@PostMapping("/changepassword")
	public String changePassword(@RequestParam("name") String username, HttpServletRequest request, Model model) {
		if (!service.findByNameBoolean(username)) {
			model.addAttribute("present", true);
			return "forgetpassword";
		}
		model.addAttribute("greater", true);
		model.addAttribute("passwordcontains",false);
		model.addAttribute("validate",false);
		model.addAttribute("username", username);
		return "changepassword";
	}

	@PostMapping("/change")
	public String change(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpServletRequest request, Model model) {
		boolean contains = password.contains(" ");
		boolean validate = service.validAdminPassword(username,password);
		if (password.length() >= 8 && !contains && !validate) {
			service.changePassword(username, password);
			model.addAttribute("logindto", new LoginDto());
			model.addAttribute("login", true);
			model.addAttribute("admin" ,false);
			return "AdminLogin";
		} else {
			if (!service.findByNameBoolean(username)) {
				model.addAttribute("present", true);
				return "forgetpassword";
			}
			else if (contains) {
				model.addAttribute("greater",true);
				model.addAttribute("passwordcontains",true);
				model.addAttribute("validate",false);
				model.addAttribute("username",username);
				return "changepassword";
			}
			else if (validate) {
				model.addAttribute("greater",true);
				model.addAttribute("passwordcontains",false);
				model.addAttribute("validate",true);
				model.addAttribute("username",username);
				return "changepassword";
			}
			model.addAttribute("greater", false);
			model.addAttribute("passwordcontains",false);
			model.addAttribute("validate",false);
			model.addAttribute("username", username);
			return "changepassword";
		}

	}

}