package com.app.dao;

import javax.persistence.EntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.app.pojo.Addresses;
import com.app.pojo.Hospital;
import com.app.pojo.HospitalCoordinates;

@Repository
public class HospitalDao implements HospitalDaoInterface {

	@Autowired
	private EntityManager mgr;

	@Override
	public String processFirstLogin(Hospital h, byte[] imageFile, String cpassword, HospitalCoordinates coordinates) {
		Hospital hospital = mgr.find(Hospital.class, h.getId());
		hospital.setImage(imageFile);
		hospital.setPassword(cpassword);
		hospital.setHospitalCoordinates(coordinates);
		hospital.setStatus("Active");
		return "User First Login Success";
	}

	@Override
	public String updateHospital(String hospital_name, String mobile, String alt_mobile, String email,
			Addresses address, Hospital h) {
		Hospital hs = mgr.find(Hospital.class, h.getId());
		hs.setEmail(email);
		hs.setAltMobile(alt_mobile);
		hs.setMobile(mobile);
		hs.setName(hospital_name);
		hs.setHospitalAddress(address);
		return "Profile Updated";
	}

	@Override
	public String changePassword(Integer id, String npassword) {
		Hospital h = mgr.find(Hospital.class, id);
		h.setPassword(npassword);
		return "Password Changed Successfully";
	}

}
