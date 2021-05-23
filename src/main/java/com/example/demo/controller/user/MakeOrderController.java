package com.example.demo.controller.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entity.CartItem;
import com.example.demo.entity.Category;
import com.example.demo.service.product.ItemService;


@Controller

public class MakeOrderController {
	
	@Autowired
	ItemService itemService;
	

	@RequestMapping(value = {"/order" },method = RequestMethod.GET)
	 public String index(ModelMap model, HttpSession httpSession) { 
		float total =0;
		int qty = 0;
		if(httpSession.getAttribute("cart")!=null) {
			List<CartItem> ls = (List<CartItem>) httpSession.getAttribute("cart");
			model.addAttribute("cartProduct",ls);
			for(CartItem i:ls) {
				total += i.getQuantity()*i.getItem().getPrice();
				qty +=i.getQuantity();
			}
		}
		model.addAttribute("qty", qty);
		model.addAttribute("total", total);
		
		return "home.order"; 
	 }
	 
//	@RequestMapping("addCart/{id}")
//	public String toCart(
//			HttpSession httpSession,
//			@PathVariable("id") int id,
//			ModelMap model
//		){
//		
//		if(httpSession.getAttribute("cart")!=null) {
//			
//			System.out.println("inn cart");
//			List<CartItem> ls = (List<CartItem>) httpSession.getAttribute("cart");
//			int index = exists(id, ls);
//			if(index ==-1) {
//				Item i = itemService.findById(id).get();
//				ls.add(new CartItem(i,1));
//			}
//			else {
//				int qty = ls.get(index).getQuantity()+1;
//				ls.get(index).setQuantity(qty);
//			}
//			
//			//model.addAttribute("cartProduct",ls);			
//		}else System.out.println("cart null");
//		return "redirect:/cart";
//	}
//	
	
}
