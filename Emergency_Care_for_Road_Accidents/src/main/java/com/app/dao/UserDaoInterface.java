package com.app.dao;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.app.pojo.AccidentCoordinates;
import com.app.pojo.Accidents;
import com.app.pojo.Addresses;
import com.app.pojo.Feedback;
import com.app.pojo.User;
import com.app.pojo.Vehicle;

public interface UserDaoInterface {
	PasswordEncoder passwordEncoder=new BCryptPasswordEncoder();

	String userFirstLogin(User user, byte[] imageFile, String cpassword);

	String updateMyProfile(User user, String full_name, String mobile, String email, Addresses address);

	String changePassword(User u, String conpassword);

	void updateImage(Integer id, byte[] imageFile);

	List<Vehicle> fetchVehicals(User u);

	String saveVehical(User u, Vehicle v);

	void deleteVehicle(int vid);

	String addAccident(Accidents a, AccidentCoordinates c);

	List<Accidents> fetchMyAccident(User u);

	String removeAccident(int aid);

	String registerUser(User user, Addresses address);

	String saveFeedback(Feedback f);

}
