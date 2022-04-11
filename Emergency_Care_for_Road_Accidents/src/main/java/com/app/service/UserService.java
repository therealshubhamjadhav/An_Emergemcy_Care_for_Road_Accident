package com.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.UserDaoInterface;
import com.app.pojo.AccidentCoordinates;
import com.app.pojo.Accidents;
import com.app.pojo.Addresses;
import com.app.pojo.Feedback;
import com.app.pojo.User;
import com.app.pojo.Vehicle;

@Service
@Transactional
public class UserService implements UserServiceInterface {

	@Autowired
	private UserDaoInterface userDao;

	@Override
	public String userFirstLogin(User user, byte[] imageFile, String cpassword) {
		return userDao.userFirstLogin(user, imageFile, cpassword);
	}

	@Override
	public String updateMyProfile(User user, String full_name, String mobile, String email, Addresses address) {
		return userDao.updateMyProfile(user, full_name, mobile, email, address);
	}

	@Override
	public String changePassword(User u, String conpassword) {
		return userDao.changePassword(u, conpassword);
	}

	@Override
	public void updateImage(Integer id, byte[] imageFile) {
		userDao.updateImage(id, imageFile);

	}

	@Override
	public List<Vehicle> fetchVehicals(User u) {

		return userDao.fetchVehicals(u);
	}

	@Override
	public String saveVehical(User u, Vehicle v) {
		return userDao.saveVehical(u, v);
	}

	@Override
	public void deleteVehicals(int vid) {
		userDao.deleteVehicle(vid);
	}

	@Override
	public String addAccident(Accidents a, AccidentCoordinates c) {

		return userDao.addAccident(a, c);
	}

	@Override
	public List<Accidents> fetchMyAccident(User u) {
		return userDao.fetchMyAccident(u);
	}

	@Override
	public String removeAccident(int aid) {
		return userDao.removeAccident(aid);
	}

	@Override
	public String registerUser(User user, Addresses address) {
		return userDao.registerUser(user, address);
	}

	@Override
	public String saveFeedback(Feedback f) {
		return userDao.saveFeedback(f);
	}
}
