package com.app.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.HospitalDaoInterface;
import com.app.pojo.Addresses;
import com.app.pojo.Hospital;
import com.app.pojo.HospitalCoordinates;

@Service
@Transactional
public class HospitalService implements HospitalServiceInterface {

	@Autowired
	private HospitalDaoInterface hospitalDao;

	@Override
	public String processFirstLogin(Hospital h, byte[] imageFile, String cpassword, HospitalCoordinates coordinates) {
		return hospitalDao.processFirstLogin(h, imageFile, cpassword, coordinates);
	}

	@Override
	public String updateHospital(String hospital_name, String mobile, String alt_mobile, String email,
			Addresses address, Hospital h) {
		return hospitalDao.updateHospital(hospital_name, mobile, alt_mobile, email, address, h);
	}

	@Override
	public String changePassword(Integer id, String npassword) {
		return hospitalDao.changePassword(id, npassword);
	}

}
