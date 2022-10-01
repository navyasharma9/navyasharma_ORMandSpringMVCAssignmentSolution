package com.customer.manage.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	public HomeController() {
		System.out.println("home controller");
	}
	@GetMapping("/")
	public String homePage()
	{
		System.out.println("home page request");	
		return "home";
	}
}