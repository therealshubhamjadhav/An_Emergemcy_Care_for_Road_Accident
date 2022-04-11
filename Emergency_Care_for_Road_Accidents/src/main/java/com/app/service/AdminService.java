package com.app.service;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.app.dao.AdminDaoInterface;
import com.app.pojo.Accidents;
import com.app.pojo.Addresses;
import com.app.pojo.Feedback;
import com.app.pojo.Hospital;
import com.app.pojo.PoliceStation;
import com.app.pojo.User;

@Service
@Transactional
public class AdminService implements AdminServiceInterface {

	@Autowired
	private AdminDaoInterface adminDao;

	@Override
	public String registerUser(User user, Addresses address) {
		return adminDao.registerUser(user, address);
	}

	@Override
	public List<User> fetchUserList() {
		return adminDao.fetchUserList();
	}

	@Override
	public String removeUser(int uid) {
		return adminDao.removeUser(adminDao.findUserById(uid));
	}

	@Override
	public String registerHospital(Hospital hospital, Addresses address) {
		return adminDao.registerHospital(hospital, address);
	}

	@Override
	public String toggleHosptalStatus(int hid) {
		return adminDao.toggleHosptalStatus(hid);
	}

	@Override
	public String removeHospital(int hid) {
		return adminDao.removeHospital(adminDao.fetchHospitalById(hid));
	}

	@Override
	public String registerPoliceStation(PoliceStation policeStation, Addresses address) {
		return adminDao.registerPoliceStation(policeStation, address);
	}

	@Override
	public List<PoliceStation> fetchStationsList() {
		return adminDao.fetchStationsList();
	}

	@Override
	public String toggleStationStatus(int sid) {
		return adminDao.toggleStationStatus(sid);
	}

	@Override
	public String removeStation(int sid) {
		PoliceStation p = adminDao.findStationById(sid);
		return adminDao.removeStation(p);
	}

	@Override
	public List<Feedback> fetchAllFeedback() {
		return adminDao.fetchAllFeedback();
	}

	@Override
	public List<Accidents> fetchallAccidents() {
		return adminDao.fetchallAccidents();
	}

	@Override
	public List<Hospital> fetchHospitalList() {
		return adminDao.fetchHospitalList();
	}

}
