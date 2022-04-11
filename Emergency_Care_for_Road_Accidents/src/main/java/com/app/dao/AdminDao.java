package com.app.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.pojo.Accidents;
import com.app.pojo.Addresses;
import com.app.pojo.Feedback;
import com.app.pojo.Hospital;
import com.app.pojo.PoliceStation;
import com.app.pojo.User;

@Repository
public class AdminDao implements AdminDaoInterface {

	@Autowired
	private EntityManager mgr;

	@Override
	public String registerUser(User user, Addresses address) {
		User u = user;
		u.setUserAddress(address);
		mgr.persist(u);
		return "User Registered Successfully";
	}

	@Override
	public List<User> fetchUserList() {
		String jpql = "select u from User u";
		return mgr.createQuery(jpql, User.class).getResultList();
	}

	@Override
	public User findUserById(int uid) {
		return mgr.find(User.class, uid);
	}

	@Override
	public String removeUser(User userObject) {
		mgr.remove(userObject);
		return "User Removed Successfully";
	}

	@Override
	public String registerHospital(Hospital hospital, Addresses address) {
		Hospital h = hospital;
		h.setHospitalAddress(address);
		mgr.persist(h);
		return "Hospital Registered Successfully";
	}

	@Override
	public String toggleHosptalStatus(int hid) {
		Hospital hospital = mgr.find(Hospital.class, hid);
		String status = hospital.getStatus();
		if (status.equals("new")) {
			hospital.setStatus("Active");
		} else if (status.equals("Active")) {
			hospital.setStatus("Inactive");
		} else {
			hospital.setStatus("Active");
		}
		return "Status Updated";
	}

	@Override
	public Hospital fetchHospitalById(int hid) {
		return mgr.find(Hospital.class, hid);
	}

	@Override
	public String removeHospital(Hospital hospitalObject) {
		mgr.remove(hospitalObject);
		return "Hospital Removed Successfully";
	}

	@Override
	public String registerPoliceStation(PoliceStation policeStation, Addresses address) {
		PoliceStation p = policeStation;
		p.setPoliceStationAddress(address);
		mgr.persist(p);
		return "Police Station Registered Successfully";
	}

	@Override
	public List<PoliceStation> fetchStationsList() {
		String jpql = "select p from PoliceStation p";
		return mgr.createQuery(jpql, PoliceStation.class).getResultList();
	}

	@Override
	public String toggleStationStatus(int sid) {
		PoliceStation p = mgr.find(PoliceStation.class, sid);
		if (p.getStatus().equals("new")) {
			p.setStatus("Active");
		} else if (p.getStatus().equals("Active")) {
			p.setStatus("Inactive");
		} else {
			p.setStatus("Active");
		}
		return null;
	}

	@Override
	public PoliceStation findStationById(int sid) {
		return mgr.find(PoliceStation.class, sid);
	}

	@Override
	public String removeStation(PoliceStation p) {
		mgr.remove(p);
		return "Police Station Removed Successfully";
	}

	@Override
	public List<Feedback> fetchAllFeedback() {
		String jpql = "Select f from Feedback f";
		List<Feedback> list = mgr.createQuery(jpql, Feedback.class).getResultList();
		if (list != null)
			return list;
		return null;
	}

	@Override
	public List<Accidents> fetchallAccidents() {
		String jpql = "Select f from Accidents f";
		List<Accidents> list = mgr.createQuery(jpql, Accidents.class).getResultList();
		if (list != null)
			return list;
		return null;
	}

	@Override
	public List<Hospital> fetchHospitalList() {
		String jpql = "select h from Hospital h";
		List<Hospital> hospitalList = new ArrayList<>();
		List<Hospital> hospitals = mgr.createQuery(jpql, Hospital.class).getResultList();
		for (Hospital h : hospitals) {
			if (h.getImage() != null) {
				hospitalList.add(h);
			}
		}
		return hospitalList;
	}

}
