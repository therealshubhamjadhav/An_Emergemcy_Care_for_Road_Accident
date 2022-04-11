package com.app.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.app.pojo.AccidentCoordinates;
import com.app.pojo.Accidents;
import com.app.pojo.Addresses;
import com.app.pojo.Hospital;
import com.app.pojo.PoliceStation;
import com.app.pojo.User;
import com.app.pojo.Vehicle;
import com.app.service.AdminServiceInterface;
import com.app.service.HospitalService;
import com.app.service.LoginServiceInterface;
import com.app.service.PoliceStationServiceInterface;
import com.app.service.UserServiceInterface;

@Controller
@RequestMapping("/User")
public class UserController {

	@Autowired
	private UserServiceInterface userService;
	@Autowired
	private LoginServiceInterface loginService;
	@Autowired
	private AdminServiceInterface adminService;
	@Autowired
	private PoliceStationServiceInterface stationService;

	public UserController() {
		System.out.println("in const of " + getClass().getName());
	}

	@GetMapping("/firstLogin")
	public String showUserFirstLogin() {
		return "/User/firstLogin";
	}

	@PostMapping("/firstLogin")
	public String processFirstLogin(@RequestParam String npassword, @RequestParam String cpassword,
			@RequestParam MultipartFile image, Model modelMap, RedirectAttributes flashMap, HttpSession hs) {
		User user = (User) hs.getAttribute("userDetails");
		if (npassword.equals(cpassword)) {
			try {
				byte[] imageFile = image.getBytes();
				flashMap.addFlashAttribute("success", userService.userFirstLogin(user, imageFile, cpassword));
				return "redirect:/";
			} catch (Exception e) {
				flashMap.addFlashAttribute("error", "Some Error Occoured.. Please try Again");
				return "redirect:/";
			}
		} else {
			modelMap.addAttribute("error", "password does not matched");
			return "/User/firstLogin";
		}
	}

	@GetMapping("/Dashboard")
	public String showDashboard() {
		return "/User/Dashboard";
	}

	@GetMapping("/myprofile")
	public String showMyProfile(HttpSession hs) {
		User u = (User) hs.getAttribute("userDetails");
		hs.setAttribute("userDetails", loginService.validateUser(u.getEmail(), u.getPassword()));
		return "/User/myprofile";
	}

	@PostMapping("/myprofile")
	public String updateMyProfile(@RequestParam String full_name, @RequestParam String mobile,
			@RequestParam String email, @RequestParam String city, @RequestParam String state,
			@RequestParam String district, @RequestParam String add_ln, @RequestParam int pin_code,
			@RequestParam String country, HttpSession hs, Model modelMap, RedirectAttributes flashMap) {
		Addresses address = new Addresses(city, district, state, country, add_ln, pin_code);
		User user = (User) hs.getAttribute("userDetails");
		flashMap.addFlashAttribute("success", userService.updateMyProfile(user, full_name, mobile, email, address));
		hs.setAttribute("userDetails", loginService.validateUser(email, user.getPassword()));
		return "/User/myprofile";
	}

	@GetMapping("/changepassword")
	public String showChangePassword() {
		return "/User/changepassword";
	}

	@PostMapping("/changepassword")
	public String changePassword(@RequestParam String cpassword, @RequestParam String npassword,
			@RequestParam String conpassword, Model modelMap, RedirectAttributes flashMap, HttpSession hs) {
		User u = (User) hs.getAttribute("userDetails");
		if (u.getPassword().equals(cpassword)) {
			if (npassword.equals(cpassword)) {
				modelMap.addAttribute("success", "User Different Password then Previous");
				return "/User/changepassword";
			} else {
				if (npassword.equals(conpassword)) {
					modelMap.addAttribute("success", userService.changePassword(u, conpassword));
					hs.setAttribute("userDetails", loginService.validateUser(u.getEmail(), conpassword));
					return "/User/changepassword";
				} else {
					modelMap.addAttribute("success", "new Password and confirm password does not matched");
					return "/User/changepassword";
				}
			}
		} else {
			modelMap.addAttribute("success", "Current Password Does Not Matched");
			return "/User/changepassword";
		}
	}

	@GetMapping("/updateimage")
	public String showUpdateImage(HttpSession hs, Model model) {
		try {
			User userDetails = (User) hs.getAttribute("userDetails");
			User u = loginService.validateUser(userDetails.getEmail(), userDetails.getPassword());
			hs.setAttribute("userDetails", u);
			return "/User/updateimage";
		} catch (Exception e) {
			model.addAttribute("success", "Image not Found");
			return "/User/updateimage";
		}
	}

	@PostMapping("/updateimage")
	public String processUpdateImage(HttpSession hs, @RequestParam MultipartFile image) {
		User u = (User) hs.getAttribute("userDetails");
		try {
			byte[] imageFile = image.getBytes();
			userService.updateImage(u.getId(), imageFile);
			return "redirect:/User/updateimage";
		} catch (Exception e) {
			return "/User/updateimage";
		}
	}

	@GetMapping("/myvechical")
	public String showUserVehicalInfo(HttpSession hs) {
		System.out.println("show user vehical info");
		User u = (User) hs.getAttribute("userDetails");
		hs.setAttribute("vehicalsList", userService.fetchVehicals(u));
		return "/User/myvechical";
	}

	@PostMapping("/myvechical")
	public String processSaveVehical(@RequestParam String vehical_no, @RequestParam String vehical_type,
			@RequestParam String vehical_company, @RequestParam int vehical_capacity, @RequestParam String vehical_fuel,
			@RequestParam MultipartFile vehical_image, HttpSession hs, Model modelMap, RedirectAttributes flashmap) {
		try {
			User u = (User) hs.getAttribute("userDetails");
			byte[] imageFile = vehical_image.getBytes();
			Vehicle v = new Vehicle(imageFile, vehical_no, vehical_type, vehical_company, vehical_capacity);
			modelMap.addAttribute("success", userService.saveVehical(u, v));
			return "redirect:/User/myvechical";

		} catch (Exception e) {
			modelMap.addAttribute("success", "Error Occoured");
			return "/User/myvechical";
		}
	}

	@GetMapping("/vehical_delete")
	public String deleteVehicals(@RequestParam int sid) {
		userService.deleteVehicals(sid);
		return "redirect:/User/myvechical";
	}

	@GetMapping("/nearestHospitals")
	public String showNearestHospitals(HttpSession hs) {
		AccidentCoordinates coordinates = (AccidentCoordinates) hs.getAttribute("AccidentCoordinates");
		Hospital nearestHospital = stationService.fetchHospitalByCoordinates(coordinates.getLatitude(),
				coordinates.getLongitude());
		hs.setAttribute("nearestHospitals", nearestHospital);
		return "/User/nearestHospitals";
	}

	@GetMapping("/addaccident")
	public String showAddAccident(HttpSession hs) {
		User u = (User) hs.getAttribute("userDetails");
		hs.setAttribute("vehicalList", userService.fetchVehicals(u));
		return "/User/addaccident";
	}

	@PostMapping("/addaccident")
	public String processAddAccident(@RequestParam String driver, @RequestParam String vid,
			@RequestParam String latitude, @RequestParam String longitude, @RequestParam String count,
			RedirectAttributes flashMap, Model modelMap, HttpSession hs) {

		AccidentCoordinates ac = new AccidentCoordinates(Double.parseDouble(latitude), Double.parseDouble(longitude));
		hs.setAttribute("AccidentCoordinates", ac);
		if (longitude.isEmpty() && latitude.isEmpty()) {
			modelMap.addAttribute("error", "Live Location Coordinates Are Compulsary");
			return "/User/addaccident";
		} else {
			PoliceStation nearestStation = stationService.fetchPoliceStationByCoordinates(Double.parseDouble(latitude),
					Double.parseDouble(longitude));

			AccidentCoordinates c = new AccidentCoordinates(Double.parseDouble(latitude),
					Double.parseDouble(longitude));
			Accidents a = new Accidents(driver, vid, ac, Integer.parseInt(count), nearestStation);
			hs.setAttribute("success", userService.addAccident(a, c));
			return "redirect:/User/nearestHospitals";

		}
	}

	@GetMapping("/accidentHistory")
	public String showAccidentHistory(HttpSession hs) {
		User u = (User) hs.getAttribute("userDetails");
		hs.setAttribute("accidentList", userService.fetchMyAccident(u));
		return "/User/accidentHistory";
	}

	@GetMapping("/accident_delete")
	public String processAccidentDelete(@RequestParam int aid, RedirectAttributes flashMap) {
		flashMap.addFlashAttribute("success", userService.removeAccident(aid));

		return "redirect:/User/accidentHistory";
	}

	@GetMapping("/hospitallist")
	public String showhospital(HttpSession hs) {
		System.out.println("in show hospital list");
		hs.setAttribute("hospitallist", adminService.fetchHospitalList());

		return "/User/hospitallist";
	}

}
