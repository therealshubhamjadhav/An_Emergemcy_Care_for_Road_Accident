package com.app.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.LoginDaoInterface;
import com.app.pojo.Admin;
import com.app.pojo.Hospital;
import com.app.pojo.PoliceStation;
import com.app.pojo.User;

@Transactional
@Service
public class LoginService implements LoginServiceInterface {

	@Autowired
	private LoginDaoInterface loginDao;

	@Override
	public Admin validateAdmin(String email, String password) {
		System.out.println("in login service");
		return loginDao.validateAdmin(email, password);
	}

	@Override
	public User validateUser(String email, String password) {
		return loginDao.validateUser(email, password);
	}

	@Override
	public Hospital validateHospital(String email, String password) {
		return loginDao.validateHospital(email, password);
	}

	@Override
	public PoliceStation validateStation(String email, String password) {
		return loginDao.validateStation(email, password);
	}

}
