package com.app.dao;

import com.app.pojo.Admin;
import com.app.pojo.Hospital;
import com.app.pojo.PoliceStation;
import com.app.pojo.User;

public interface LoginDaoInterface {

	Admin validateAdmin(String email, String password);

	User validateUser(String email, String password);

	Hospital validateHospital(String email, String password);

	PoliceStation validateStation(String email, String password);

}
