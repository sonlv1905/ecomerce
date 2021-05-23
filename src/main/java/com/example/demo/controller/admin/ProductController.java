package com.example.demo.controller.admin;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entity.Category;
import com.example.demo.entity.Item;
import com.example.demo.service.category.CategoryService;
//
import com.example.demo.service.product.ItemService;
@Controller
public class ProductController implements ServletContextAware{
	
	private ServletContext servletContext;	
	
	@Autowired
	ItemService itemService;
	
	@Autowired
	CategoryService categoryService;
	
	
	@RequestMapping("admin/products")
	public String listProduct(ModelMap model, HttpSession session) {
		if(session.getAttribute("admin")==null || session.getAttribute("admin")=="") {
			return "redirect:/admin/login";
		}
		
		List<Item> items = itemService.findAll();
		model.addAttribute("Items",items);	
		
		Item i = new Item();
		model.addAttribute("item", i);
		model.addAttribute("categories",categoryService.findAll());
		return "admin.dashboard.product";
	}
	
	
	@RequestMapping(value="/add-product", method = RequestMethod.POST)
	public String addProduct(
			@ModelAttribute("item")Item item, 
			HttpSession session,
			@RequestParam(value="file") MultipartFile file
		) {
		if(session.getAttribute("admin")==null || session.getAttribute("admin")=="" ) {
			return "redirect:/admin/login";
		}
		
		item.setPath(uploadFile(file));
		System.out.println(item.toString()+"\n---");
		itemService.save(item);
		System.out.println("saved item success");
		return "redirect:/admin/products";
	}
	
	@RequestMapping(value={"/remove-products/{id}"} ,method = RequestMethod.GET)
	public String delProduct(@PathVariable("id") int id) {
		itemService.deleteById(id);
		System.out.println("removed item success");
		return "redirect:/admin/products";
	}

	private String uploadFile(MultipartFile multipartFile) {
		try {
			byte[] bytes = multipartFile.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/uploads/images/" + multipartFile.getOriginalFilename()));
			Files.write(path, bytes);
			return multipartFile.getOriginalFilename();
		}catch(Exception e) {
			return "no-image.png";
		}
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		// TODO Auto-generated method stub
		this.servletContext = servletContext;
	}
	
}
