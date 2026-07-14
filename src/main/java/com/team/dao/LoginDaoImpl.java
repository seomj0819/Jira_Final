package com.team.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.UserInfoDto;

@Repository
public class LoginDaoImpl implements LoginDao{
	@Autowired
	SqlSession sqlSession;

	@Override
	public Integer checkLocalLogin(UserInfoDto dto) {
		return sqlSession.selectOne("com.team.mapper.UserInfoMapper.checkLocalLogin", dto);
	}

	@Override
	public void localRegister(UserInfoDto dto) {
		sqlSession.selectOne("com.team.mapper.UserInfoMapper.localRegister", dto);
	}

}
