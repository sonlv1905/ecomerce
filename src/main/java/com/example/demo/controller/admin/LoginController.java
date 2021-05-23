package com.example.demo.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.User;

@Controller 

public class LoginController {
	@Autowired
	User _userBean;
	
	@RequestMapping(value = { "/admin/login", "/admin"})
	public String index() {
		return "admin.login";
	}
	
	@RequestMapping(value = "/admin/login/process",method = RequestMethod.POST)
	public String process(ModelMap model,
			@RequestParam("username")String username,
			@RequestParam("password")String password,
			HttpSession session) {
		System.out.println(" "+username + " " + password);
		if(_userBean.getUsername().equals(username) && _userBean.getPassword().equals(password)) {
			System.out.println("login admin"); 	
			session.setAttribute("admin", username);
			//admin
			/* return "admin.dashboard.index"; */
			return "redirect:/admin/dashboard"; 
		}
		
		return "admin.login";
	}
	
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("admin");
		return "redirect:/admin/login";
	}
	
}
