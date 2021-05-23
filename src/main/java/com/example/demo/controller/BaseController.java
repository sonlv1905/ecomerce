package com.example.demo.controller;
//
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

//
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//
import com.example.demo.common.GooglePojo;
import com.example.demo.common.GoogleUtils;
import com.example.demo.entity.Account;
import com.example.demo.entity.CartItem;
import com.example.demo.service.account.AccountService;

@Controller
public class BaseController {
	
	@Autowired
	private GoogleUtils googleUtils;
	
	@Autowired
	private AccountService accountService;
	
	
//	@RequestMapping(value = { "/", "/login" })
//	public String login() {
//		return "admin.login";
//	}
//	
	@RequestMapping("/login-google")
	public String loginGoogle(HttpServletRequest request, HttpSession session) throws ClientProtocolException, IOException {
	    String code = request.getParameter("code");
	    if (code == null || code.isEmpty()) {
	      return "redirect:/login?google=error";
	    }
	    String accessToken = googleUtils.getToken(code);
	    
	    GooglePojo googlePojo = googleUtils.getUserInfo(accessToken);
//	    UserDetails userDetail = googleUtils.buildUser(googlePojo);
	    session.setAttribute("username", googlePojo.getEmail());
	    session.setAttribute("userImg", googlePojo.getPicture());
	    session.setAttribute("userId", googlePojo.getId());
	    
	    List<CartItem> cart = new ArrayList<>();
	    session.setAttribute("cart", cart);
	    System.out.println("Login thanh cong");
	    
	    System.out.println(googlePojo.getEmail()+"\n"+googlePojo.getId());
	    
	    Optional<Account> u = accountService.findById(googlePojo.getEmail());
		if(!u.isPresent()) {
			Account  acc = accountService.save(new Account(googlePojo.getEmail()));
		    System.out.println("saved "+acc.getUsername());
		}
	    
//	    UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null,userDetail.getAuthorities());
//	    authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
//	    SecurityContextHolder.getContext().setAuthentication(authentication);
	    return "redirect:/home";
    }
//	
//	
//	@RequestMapping("/403")
//	public String accessDenied() {
//	    return "403";
//	}
}
