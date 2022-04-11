package com.app.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.app.pojo.AccidentCoordinates;
import com.app.pojo.Accidents;
import com.app.pojo.Addresses;
import com.app.pojo.Feedback;
import com.app.pojo.User;
import com.app.pojo.Vehicle;

@Repository
public class UserDao implements UserDaoInterface {

	@Autowired
	private EntityManager mgr;

	@Override
	public String userFirstLogin(User user, byte[] imageFile, String cpassword) {
		User u = mgr.find(User.class, user.getId());
		u.setImage(imageFile);
		u.setPassword(cpassword);
		u.setStatus("Active");
		return "Profile update successfully please login";
	}

	@Override
	public String updateMyProfile(User user, String full_name, String mobile, String email, Addresses address) {
		User u = mgr.find(User.class, user.getId());
		u.setName(full_name);
		u.setMobileNo(mobile);
		u.setEmail(email);
		u.setUserAddress(address);
		return "Profile Updated Successfully";
	}

	@Override
	public String changePassword(User u, String conpassword) {
		User user = mgr.find(User.class, u.getId());
		String encodedPassword=new BCryptPasswordEncoder().encode(conpassword);
		user.setPassword(encodedPassword);
		return "Password Changed Successfully";
	}

	@Override
	public void updateImage(Integer id, byte[] imageFile) {
		User u = mgr.find(User.class, id);
		u.setImage(imageFile);

	}

	@Override
	public List<Vehicle> fetchVehicals(User u) {
		String jpql = "select v from Vehicle v where v.parentUser=:u";
		return mgr.createQuery(jpql, Vehicle.class).setParameter("u", u).getResultList();
	}

	@Override
	public String saveVehical(User u, Vehicle v) {
		Vehicle vehical = v;
		vehical.setParentUser(u);
		mgr.persist(vehical);
		return "Vehical Added Successfully";
	}

	@Override
	public void deleteVehicle(int vid) {
		Vehicle v = mgr.find(Vehicle.class, vid);
		mgr.remove(v);
	}

	@Override
	public String addAccident(Accidents a, AccidentCoordinates c) {
		a.setStatus("new");
		a.setCoordinates(c);
		mgr.persist(a);
		return "Accident registered successfully informed to nearest police station find nearest hospitals";
	}

	@Override
	public List<Accidents> fetchMyAccident(User u) {
		String username = u.getName();
		String jpql = "select a from Accidents a where a.username=:username";
		return mgr.createQuery(jpql, Accidents.class).setParameter("username", username).getResultList();
	}

	@Override
	public String removeAccident(int aid) {
		Accidents a = mgr.find(Accidents.class, aid);
		mgr.remove(a);
		return "Accident Removed";
	}

	@Override
	public String registerUser(User user, Addresses address) {
		User u = user;
		u.setUserAddress(address);
		mgr.persist(u);
		return "User Registered Successfully";
	}

	@Override
	public String saveFeedback(Feedback f) {
		Feedback feed = f;
		mgr.persist(feed);
		return "Thanks your feedback valuable for us";
	}
}
