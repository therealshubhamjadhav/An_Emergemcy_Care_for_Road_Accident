package com.app.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.pojo.Admin;
import com.app.pojo.Hospital;
import com.app.pojo.PoliceStation;
import com.app.pojo.User;
import com.app.service.LoginServiceInterface;

@Controller
@RequestMapping("/")
public class LoginController {

	@Autowired
	private LoginServiceInterface loginService;

	public LoginController() {
		System.out.println("in const of " + getClass().getName());
	}

	@PostMapping("/login")
	public String processLogin(@RequestParam String email, @RequestParam String password, HttpSession hs,
			Model modelMap, RedirectAttributes flashMap) {

		Admin admin = loginService.validateAdmin(email, password);
		User user = loginService.validateUser(email, password);
		Hospital hospital = loginService.validateHospital(email, password);
		PoliceStation station = loginService.validateStation(email, password);
		String status = "";
		if (admin != null) {
			hs.setAttribute("userDetails", admin);
			return "redirect:/Admin/Dashboard";
		} else if (user != null) {
			status = user.getStatus();
			switch (status) {
			case "new": {
				hs.setAttribute("userDetails", user);
				return "redirect:/User/firstLogin";
			}
			case "Active": {
				hs.setAttribute("userDetails", user);
				return "redirect:/User/Dashboard";
			}
			case "Inactive": {
				flashMap.addFlashAttribute("error", "Please contact Admin to Reactive Your Profile");
				return "redirect:/";
			}
			}
		} else if (hospital != null) {
			status = hospital.getStatus();
			switch (status) {
			case "new": {
				hs.setAttribute("userDetails", hospital);
				return "redirect:/Hospital/firstLogin";
			}
			case "Active": {
				hs.setAttribute("userDetails", hospital);
				return "redirect:/Hospital/Dashboard";
			}
			case "Inactive": {
				flashMap.addFlashAttribute("error", "Please contact Admin to Reactive Your Profile");
				return "redirect:/";
			}
			}
		} else if (station != null) {
			status = station.getStatus();
			switch (status) {
			case "new": {
				hs.setAttribute("userDetails", station);
				return "redirect:/PoliceStation/firstLogin";
			}
			case "Active": {
				hs.setAttribute("userDetails", station);
				return "redirect:/PoliceStation/Dashboard";
			}
			case "Inactive": {
				flashMap.addFlashAttribute("error", "Please contact Admin to Reactive Your Profile");
				return "redirect:/";
			}
			}
		} else {
			flashMap.addFlashAttribute("error", "You are not registerd");
			return "redirect:/signin";
		}
		return "/index";

	}

	@GetMapping("/logout")
	public String logoutUsers(HttpSession hs) {
		hs.getAttribute("userDetails");
		hs.invalidate();
		return "redirect:/signin";
	}
}
