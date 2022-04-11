package com.app.dao;

import java.util.List;

import com.app.pojo.Accidents;
import com.app.pojo.Addresses;
import com.app.pojo.Feedback;
import com.app.pojo.Hospital;
import com.app.pojo.PoliceStation;
import com.app.pojo.User;

public interface AdminDaoInterface {

	String registerUser(User user, Addresses address);

	List<User> fetchUserList();

	User findUserById(int uid);

	String removeUser(User userObject);

	String registerHospital(Hospital hospital, Addresses address);

	String toggleHosptalStatus(int hid);

	Hospital fetchHospitalById(int hid);

	String removeHospital(Hospital hospitalObject);

	String registerPoliceStation(PoliceStation policeStation, Addresses address);

	List<PoliceStation> fetchStationsList();

	String toggleStationStatus(int sid);

	PoliceStation findStationById(int sid);

	String removeStation(PoliceStation p);

	List<Feedback> fetchAllFeedback();

	List<Accidents> fetchallAccidents();

	List<Hospital> fetchHospitalList();

}
