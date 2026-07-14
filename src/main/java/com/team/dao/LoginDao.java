package com.team.dao;

import com.team.dto.UserInfoDto;

public interface LoginDao {
	Integer checkLocalLogin(UserInfoDto dto);	// 로그인 체크 후 user_no를 return
	void localRegister(UserInfoDto dto);	// local 회원 정보 등록
}
