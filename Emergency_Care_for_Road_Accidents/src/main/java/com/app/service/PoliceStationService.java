package com.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.PoliceStationDaoInterface;
import com.app.pojo.Accidents;
import com.app.pojo.Addresses;
import com.app.pojo.Hospital;
import com.app.pojo.PoliceStation;
import com.app.pojo.StationCoordinates;

@Service
@Transactional
public class PoliceStationService implements PoliceStationServiceInterface {

	@Autowired
	private PoliceStationDaoInterface stationDao;

	@Override
	public String processFirstLogin(PoliceStation ps, byte[] imageFile, String cpassword,
			StationCoordinates coordinates) {

		return stationDao.processFirstLogin(ps, imageFile, cpassword, coordinates);
	}

	@Override
	public String updateStation(String station_name, String mobile, String alt_mobile, String email, Addresses address,
			PoliceStation ps) {
		return stationDao.updateStation(station_name, mobile, alt_mobile, email, address, ps);
	}

	@Override
	public PoliceStation fetchPoliceStationByCoordinates(double latitude, double longitude) {
		return stationDao.fetchPoliceStationByCoordinates(latitude, longitude);
	}

	@Override
	public List<Accidents> fetchAccidentbyID(PoliceStation p) {
		return stationDao.fetchAccidentbyID(p);
	}

	@Override
	public Hospital fetchHospitalByCoordinates(Double latitude, Double longitude) {
		return stationDao.fetchHospitalByCoordinates(latitude, longitude);
	}

}
