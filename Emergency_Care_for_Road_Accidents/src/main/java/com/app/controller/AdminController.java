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
import com.app.pojo.Addresses;
import com.app.pojo.Hospital;
import com.app.pojo.PoliceStation;
import com.app.pojo.User;
import com.app.service.AdminServiceInterface;

@Controller
@RequestMapping("/Admin")
public class AdminController {

	@Autowired
	private AdminServiceInterface adminService;

	public AdminController() {
		System.out.println("in const of " + getClass().getName());
	}

	@GetMapping("/Dashboard")
	public String showAdminDashboard() {
		return "/Admin/Dashboard";
	}

	@GetMapping("/addnewuser")
	public String showAddNewUser() {
		return "/Admin/addnewuser";
	}

	@PostMapping("/addnewuser")
	public String processAddNewUser(@RequestParam String first_name, @RequestParam String middle_name,
			@RequestParam String last_name, @RequestParam String mobile, @RequestParam String email,
			@RequestParam String city, @RequestParam String state, @RequestParam String district,
			@RequestParam String add_ln, @RequestParam int pin_code, @RequestParam String country, HttpSession hs,
			Model modelMap, RedirectAttributes flashMap) {
		Addresses address = new Addresses(city, district, state, country, add_ln, pin_code);
		User user = new User(first_name + " " + middle_name + " " + last_name, email, first_name + "#123", mobile,
				"new");
		modelMap.addAttribute("success", adminService.registerUser(user, address));
		return "/Admin/addnewuser";
	}

	@GetMapping("/availableuser")
	public String showAvailableUsers(HttpSession hs) {
		hs.setAttribute("userList", adminService.fetchUserList());
		return "/Admin/availableuser";
	}

	@GetMapping("/user_delete")
	public String removeUser(@RequestParam int uid, RedirectAttributes flashMap) {
		flashMap.addFlashAttribute("message", adminService.removeUser(uid));
		return "redirect:/Admin/availableuser";
	}

	@GetMapping("/addnewhospital")
	public String showAddHospitals() {
		return "/Admin/addnewhospital";
	}

	@PostMapping("/addnewhospital")
	public String processAddHospital(@RequestParam String hospital_name, @RequestParam String mobile,
			@RequestParam String alt_mobile, @RequestParam String email, @RequestParam String city,
			@RequestParam String state, @RequestParam String district, @RequestParam String add_ln,
			@RequestParam int pin_code, @RequestParam String country, HttpSession hs, Model modelMap,
			RedirectAttributes flashMap) {
		Addresses address = new Addresses(city, district, state, country, add_ln, pin_code);
		Hospital hospital = new Hospital(hospital_name, email, "Hospital#" + mobile.substring(6, 10), mobile, "new",
				alt_mobile);
		modelMap.addAttribute("success", adminService.registerHospital(hospital, address));
		return "/Admin/addnewhospital";
	}

	@GetMapping("/availablehospitals")
	public String showHospitals(HttpSession hs) {
		hs.setAttribute("hospitalList", adminService.fetchHospitalList());
		return "/Admin/availablehospitals";
	}

	@GetMapping("/hospital_status")
	public String toggleHospitalStatus(@RequestParam int hid, RedirectAttributes flashMap) {
		flashMap.addFlashAttribute("message", adminService.toggleHosptalStatus(hid));
		return "redirect:/Admin/availablehospitals";
	}

	@GetMapping("/hospital_delete")
	public String removeHospital(@RequestParam int hid, RedirectAttributes flashMap) {
		flashMap.addFlashAttribute("message", adminService.removeHospital(hid));
		return "redirect:/Admin/availablehospitals";
	}

	@GetMapping("/addnewpolicestation")
	public String showPoliceRegistration() {
		return "/Admin/addnewpolicestation";
	}

	@PostMapping("/addnewpolicestation")
	public String processPoliceStationRegistration(@RequestParam String station_name, @RequestParam String mobile,
			@RequestParam String alt_mobile, @RequestParam String email, @RequestParam String city,
			@RequestParam String state, @RequestParam String district, @RequestParam String add_ln,
			@RequestParam int pin_code, @RequestParam String country, HttpSession hs, Model modelMap,
			RedirectAttributes flashMap) {

		Addresses address = new Addresses(city, district, state, country, add_ln, pin_code);
		PoliceStation policeStation = new PoliceStation(station_name, email, "Police#" + mobile.substring(6, 10),
				mobile, alt_mobile, "new");
		modelMap.addAttribute("success", adminService.registerPoliceStation(policeStation, address));
		return "/Admin/addnewpolicestation";
	}

	@GetMapping("/availablestations")
	public String showPoliceStationList(HttpSession hs) {
		hs.setAttribute("stationList", adminService.fetchStationsList());
		return "/Admin/availablestations";
	}

	@GetMapping("/station_status")
	public String toggleStationStatus(@RequestParam int sid, RedirectAttributes flashMap) {
		flashMap.addFlashAttribute("message", adminService.toggleStationStatus(sid));
		return "redirect:/Admin/availablestations";
	}

	@GetMapping("/station_delete")
	public String removeStation(@RequestParam int sid, RedirectAttributes flashMap) {
		flashMap.addFlashAttribute("message", adminService.removeStation(sid));
		return "redirect:/Admin/availablestations";
	}

	@GetMapping("/feedback")
	public String showfeedback(HttpSession hs) {
		hs.setAttribute("feeedbackList", adminService.fetchAllFeedback());
		return "/Admin/feedback";
	}

	@GetMapping("/accidentHistory")
	public String showAccidentlist(HttpSession hs) {
		hs.setAttribute("accidentList", adminService.fetchallAccidents());
		return "/Admin/accidentHistory";
	}

}
