package com.app.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.pojo.AccidentCoordinates;
import com.app.pojo.Accidents;
import com.app.pojo.Addresses;
import com.app.pojo.Feedback;
import com.app.pojo.Hospital;
import com.app.pojo.PoliceStation;
import com.app.pojo.User;
import com.app.service.AdminServiceInterface;
import com.app.service.HospitalService;
import com.app.service.LoginServiceInterface;
import com.app.service.PoliceStationServiceInterface;
import com.app.service.UserServiceInterface;

@Controller
@RequestMapping("/")
public class ExtraController {

	@Autowired
	private LoginServiceInterface loginService;
	@Autowired
	private AdminServiceInterface adminService;
	@Autowired
	private PoliceStationServiceInterface stationService;
	@Autowired
	private UserServiceInterface userService;

	public ExtraController() {
		System.out.println("in const of" + getClass().getName());
	}

	@GetMapping("/registration")
	public String showRegistration() {
		return "/registration";
	}

	@PostMapping("/registration")
	public String processRegistration(@RequestParam String mobile, @RequestParam String email,
			@RequestParam String name, @RequestParam String password, @RequestParam String cpassword,
			@RequestParam String city, @RequestParam String state, @RequestParam String district,
			@RequestParam String add_ln, @RequestParam String pin_code, @RequestParam String country, Model modelMap,
			RedirectAttributes flashMap, HttpSession hs) {
		
		
		
		Addresses address = new Addresses(city, district, state, country, add_ln, Integer.parseInt(pin_code));

		String Status = "Active";
		
		User user = new User(name, email, cpassword, mobile, Status);

		if (password.equals(cpassword)) {
			String encodedPassword=new BCryptPasswordEncoder().encode(password);
			user.setPassword(encodedPassword);
			flashMap.addFlashAttribute("success", userService.registerUser(user, address));
			return "redirect:/";
		} else {
			modelMap.addAttribute("error", "Password and confirm Password Not Matched");
			return "redirect:/registration";
		}
	}

	@GetMapping("/feedback")
	public String showFeedBack() {
		return "/feedback";
	}

	@PostMapping("/feedback")
	public String processFeedBack(@RequestParam String name, @RequestParam String mobile, @RequestParam String email,
			@RequestParam String comment, Model modelMap, RedirectAttributes flashMap, HttpSession hs) {
		Feedback f = new Feedback(name, email, mobile, comment);
		flashMap.addFlashAttribute("message", userService.saveFeedback(f));
		return "/feedback";
	}

	@GetMapping("/informaccident")
	public String showInformAccidents() {
		return "/informaccident";
	}

	@PostMapping("/informaccident")
	public String informAccident(@RequestParam String name, @RequestParam String vehicalno,
			@RequestParam String latitude, @RequestParam String longitude, @RequestParam String count,
			RedirectAttributes flashMap, Model modelMap, HttpSession hs) {

		AccidentCoordinates ac = new AccidentCoordinates(Double.parseDouble(latitude), Double.parseDouble(longitude));
		hs.setAttribute("accidentCoordinates", ac);
		if (longitude.isEmpty() && latitude.isEmpty()) {
			modelMap.addAttribute("error", "Live Location Coordinates Are Compulsary");
			return "/informaccident";
		} else {
			PoliceStation nearestStation = stationService.fetchPoliceStationByCoordinates(Double.parseDouble(latitude),
					Double.parseDouble(longitude));
			System.out.println(nearestStation);
			AccidentCoordinates c = new AccidentCoordinates(Double.parseDouble(latitude),
					Double.parseDouble(longitude));
			Accidents a = new Accidents(name, vehicalno, ac, Integer.parseInt(count), nearestStation);
			System.out.println(a);
			hs.setAttribute("success", userService.addAccident(a, c));

			return "redirect:/nearestHositals";
		}
	}

	@GetMapping("/nearestHositals")
	public String showHosital(HttpSession hs) {
		AccidentCoordinates coordinates = (AccidentCoordinates) hs.getAttribute("accidentCoordinates");
		Hospital nearestHospital = stationService.fetchHospitalByCoordinates(coordinates.getLatitude(),
				coordinates.getLongitude());
		hs.setAttribute("nearestHospitals", nearestHospital);
		return "/nearestHositals";
	}

	@GetMapping("/signin")
	public String showSignin() {
		return "/signin";
	}

	@GetMapping("/about")
	public String showAbout() {
		return "/about";
	}
}
