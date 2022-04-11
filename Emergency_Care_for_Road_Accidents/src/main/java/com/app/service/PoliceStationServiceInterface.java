package com.app.service;

import java.util.List;

import com.app.pojo.Accidents;
import com.app.pojo.Addresses;
import com.app.pojo.Hospital;
import com.app.pojo.PoliceStation;
import com.app.pojo.StationCoordinates;

public interface PoliceStationServiceInterface {

	String processFirstLogin(PoliceStation ps, byte[] imageFile, String cpassword, StationCoordinates coordinates);

	String updateStation(String station_name, String mobile, String alt_mobile, String email, Addresses address,
			PoliceStation ps);

	PoliceStation fetchPoliceStationByCoordinates(double latitude, double longitude);

	List<Accidents> fetchAccidentbyID(PoliceStation p);

	Hospital fetchHospitalByCoordinates(Double latitude, Double longitude);

}
