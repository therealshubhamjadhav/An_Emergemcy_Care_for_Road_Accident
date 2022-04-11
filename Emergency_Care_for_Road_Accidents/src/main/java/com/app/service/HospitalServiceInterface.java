package com.app.service;

import com.app.pojo.Addresses;
import com.app.pojo.Hospital;
import com.app.pojo.HospitalCoordinates;

public interface HospitalServiceInterface {

	String processFirstLogin(Hospital h, byte[] imageFile, String cpassword, HospitalCoordinates coordinates);

	String updateHospital(String hospital_name, String mobile, String alt_mobile, String email, Addresses address,
			Hospital h);

	String changePassword(Integer id, String npassword);

}
