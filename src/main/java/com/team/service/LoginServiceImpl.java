package com.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.dao.LoginDao;
import com.team.dto.UserInfoDto;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	LoginDao loginDao;

	@Override
	public boolean loginCheck(String email, String pw) {
		UserInfoDto dto = new UserInfoDto();
		dto.setEmail(email);
		dto.setPw(pw);
		
		Integer LoginCnt = loginDao.checkLocalLogin(dto);
		
		return (LoginCnt != null);
	}

}
