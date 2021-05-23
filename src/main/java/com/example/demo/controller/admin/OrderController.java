package com.example.demo.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entity.Item;
import com.example.demo.service.product.ItemService;

@Controller
public class OrderController {
	
	@Autowired
	ItemService itemService;
	
	@RequestMapping("admin/orders")
	public String listOrder(ModelMap model, HttpSession session) {
		if(session.getAttribute("admin")==null || session.getAttribute("admin")=="") {
			return "redirect:/admin/login";
		}
		List<Item> items = itemService.findAll();
		model.addAttribute("Products",items);
		return "admin.order";
	}
}
