package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	public HomeController() {
		System.out.println("in const of " + getClass().getName());
	}

	@GetMapping("/")
	public String provideHomePage() {
		return "/Home";
	}

}
