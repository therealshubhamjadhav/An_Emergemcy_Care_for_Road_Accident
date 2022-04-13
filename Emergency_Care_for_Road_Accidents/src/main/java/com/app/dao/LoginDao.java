package com.app.dao;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import com.app.pojo.Admin;
import com.app.pojo.Hospital;
import com.app.pojo.PoliceStation;
import com.app.pojo.User;

@Repository
public class LoginDao implements LoginDaoInterface {

	@Autowired
	private EntityManager mgr;
	private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	@Override
	public Admin validateAdmin(String email, String password) {

		try {
			String jpql = "select a from Admin a where a.email=:email and a.password=:password ";// 
			Admin admin = mgr.createQuery(jpql, Admin.class).setParameter("email", email).setParameter("password", password).getSingleResult();// 
			if (admin != null)
				return admin;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return null;
	}

	@Override
	public User validateUser(String email, String password) {
		try {
			String jpql = "select u from User u where u.email=:email ";// and u.password=:password
			User user = mgr.createQuery(jpql, User.class).setParameter("email", email).getSingleResult(); // setParameter("password",
																											// password).
			if (user != null && passwordEncoder.matches(password, user.getPassword()))
				return user;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return null;
	}

	@Override
	public Hospital validateHospital(String email, String password) {
		try {
			String jpql = "select h from Hospital h where h.email=:email and h.password=:password";// 
			Hospital hospital = mgr.createQuery(jpql, Hospital.class).setParameter("email", email).setParameter("password", password).getSingleResult(); 
			if (hospital != null)
				return hospital;
		} catch (Exception e) {
			return null;
		}
		return null;
	}

	@Override
	public PoliceStation validateStation(String email, String password) {
		try {
			String jpql = "select p from PoliceStation p where p.email=:email and p.password=:password ";// 
			PoliceStation station = mgr.createQuery(jpql, PoliceStation.class).setParameter("email", email)
					.setParameter("password", password).getSingleResult();// 
			if (station != null)
				return station;
		} catch (Exception e) {
			return null;
		}
		return null;
	}

}
