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
	public boolean emailDuplicateCheck(String email) {
		int cnt = sqlSession.selectOne("com.team.mapper.UserInfoMapper.emailDuplicateCheck", email);
		return cnt > 0;
	}
	
	@Override
	public void localRegister(UserInfoDto dto) {
		sqlSession.selectOne("com.team.mapper.UserInfoMapper.localRegister", dto);
	}

	@Override
	public String findPassword(String email) {
		return sqlSession.selectOne("com.team.mapper.UserInfoMapper.findPassword", email);
	}

	@Override
	public void updateVerificationCode(UserInfoDto dto) {
		sqlSession.update("com.team.mapper.UserInfoMapper.updateVerificationCode", dto);
	}

	@Override
	public UserInfoDto checkVerificationCode(String email) {
		return sqlSession.selectOne("com.team.mapper.UserInfoMapper.checkVerificationCode", email);
	}

	@Override
	public void deleteVerificationCode(String email) {
		sqlSession.update("com.team.mapper.UserInfoMapper.deleteVerificationCode", email);
	}

	@Override
	public void deleteUser(int userNo) {
		sqlSession.delete("com.team.mapper.UserInfoMapper.deleteUser", userNo);
	}

	@Override
	public void changePw(int userNo, String newPw) {
		sqlSession.update("com.team.mapper.UserInfoMapper.changePw", newPw);
	}

	@Override
	public UserInfoDto getUserProfile(int userNo) {
		return sqlSession.selectOne("com.team.mapper.UserInfoMapper.getUserProfile", userNo);
	}

	@Override
	public int checkGoogleLogin(String email) {
		return sqlSession.selectOne("com.team.mapper.UserInfoMapper.checkGoogleLogin", email);
	}

	@Override
	public void googleRegister(UserInfoDto dto) {
		sqlSession.insert("com.team.mapper.UserInfoMapper.googleRegister", dto);
	}

	@Override
	public Integer findUserNoByEmail(String email) {
		return sqlSession.selectOne("com.team.mapper.UserInfoMapper.findUserNoByEmail", email);
	}

}
