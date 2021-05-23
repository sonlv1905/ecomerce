package com.example.demo.controller.admin;

import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entity.Category;
import com.example.demo.entity.Item;
import com.example.demo.service.category.CategoryService;

@Controller

public class DashBoardController {
	
	@Autowired
	CategoryService categoryService;
	
	
	
	@RequestMapping("admin/dashboard")
	public String index(ModelMap model, HttpSession session ) {
		if(session.getAttribute("admin")==null || session.getAttribute("admin")=="" ) {
			return "redirect:/admin/login";
		}
		List<Category> list =  categoryService.findAll();
		for(Category i:list) {
			System.out.println(i.getName());
		}
		model.addAttribute("Categories",list);	
		Item i = new Item();
		Category c = new Category();
		c.setIsActive(true);
		model.addAttribute("category", c);
		model.addAttribute("item", i);
		return "admin.dashboard.index";
	}
	
	@RequestMapping(value="/add-category", method = RequestMethod.POST)
	public String addCategory(@ModelAttribute("category")Category category, HttpSession session ) {
		if(session.getAttribute("admin")==null || session.getAttribute("admin")=="" ) {
			return "redirect:/admin/login";
		}
		
		categoryService.save(category);
		System.out.println("saved "+category.getName() + category.getDescription() +category.getIsActive());
		return "redirect:/admin/dashboard";
	}
	
	@RequestMapping(value={"/remove-category/{id}"} ,method = RequestMethod.GET)
	public String delCategory(@PathVariable("id") int id) {
		categoryService.deleteById(id);
		System.out.println("removed category success");
		return "redirect:/admin/dashboard";
	}
	
	
//	@RequestMapping("admin/orders")
//	public String listOrder(ModelMap model, HttpSession session) {
//		if(session.getAttribute("admin")==null || session.getAttribute("admin")=="") {
//			return "redirect:/admin/login";
//		}
//		return "admin.dashboard.order";
//	}
}
