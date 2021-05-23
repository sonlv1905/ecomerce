package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.example.demo.entity.User;

@SpringBootApplication
public class DemoEcomApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoEcomApplication.class, args);
	}
	@Bean(name= "USER_BEAN")
	public User setUser() {
		User u = new User();
		u.setUsername("admin");
		u.setPassword("admin");
		return u;
	}
	
}
