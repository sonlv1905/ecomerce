package com.example.demo.controller.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.CartItem;
import com.example.demo.entity.Category;
import com.example.demo.entity.Item;
import com.example.demo.service.account.AccountService;
import com.example.demo.service.category.CategoryService;
import com.example.demo.service.product.ItemService;


@Controller
public class HomeController {
	@Autowired
	AccountService accountService;
	
	@Autowired
	CategoryService categoryService;
	

	@Autowired
	ItemService itemService;
	
	@GetMapping(value={"", "/", "/home"})
	public String index(ModelMap model, HttpSession httpSession) { 
		float total = 0;
		if(httpSession.getAttribute("cart")!=null) {
			List<CartItem> ls = (List<CartItem>) httpSession.getAttribute("cart");
			model.addAttribute("cartProduct",ls);
			for(CartItem i:ls) {
				total += i.getQuantity()*i.getItem().getPrice();
			}
		}
		model.addAttribute("total", total);
		
		//getcategory
		List<Category> list =  categoryService.findAll();
		model.addAttribute("Categories",list);	
		//items
		List<Item> items = itemService.findAll();
		model.addAttribute("products",items);	
		
		return "home.index";
	}
		
	
	@PostMapping("/checklogin")
	public String checkLogin(ModelMap model,
			@RequestParam("username")String username,
			@RequestParam("password")String password,
			HttpSession session) {
		
		if(accountService.checkLogin(username, password)) {
			session.setAttribute("username",username);
			List<CartItem> cart = new ArrayList<>();
			session.setAttribute("cart", cart);
			System.out.println("Login thanh cong");
			return "redirect:/home";
			//user
		}
		else {
			model.addAttribute("ERROR", "Username and password some thing wrong");
			System.out.println("login that bai");
		}
		return "home.cart";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("username");
		session.removeAttribute("userImg");
		session.removeAttribute("userId");
		session.removeAttribute("cart");
		return "redirect:/home";
	}

}
