package com.app.service;

import java.util.List;

import com.app.pojo.Accidents;
import com.app.pojo.Addresses;
import com.app.pojo.Feedback;
import com.app.pojo.Hospital;
import com.app.pojo.PoliceStation;
import com.app.pojo.User;

public interface AdminServiceInterface {

	String registerUser(User user, Addresses address);

	List<User> fetchUserList();

	String removeUser(int uid);

	String registerHospital(Hospital hospital, Addresses address);

	String toggleHosptalStatus(int hid);

	String removeHospital(int hid);

	String registerPoliceStation(PoliceStation policeStation, Addresses address);

	List<PoliceStation> fetchStationsList();

	String toggleStationStatus(int sid);

	String removeStation(int sid);

	List<Feedback> fetchAllFeedback();

	List<Accidents> fetchallAccidents();

	List<Hospital> fetchHospitalList();

}
