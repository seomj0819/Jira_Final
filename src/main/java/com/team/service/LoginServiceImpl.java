package com.team.service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.dao.LoginDao;
import com.team.dto.UserInfoDto;
import com.team.util.RandomCodeUtil;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	LoginDao loginDao;

	 // LoginCheck
	@Override
	public Integer loginCheck(String email, String pw) {
		UserInfoDto dto = new UserInfoDto();
		dto.setEmail(email);
		dto.setPw(pw);
		
		Integer userNo = loginDao.checkLocalLogin(dto);
		
		return userNo;
	}

	// Register User Info (Local)
	@Override
	public void localRegister(String email, String pw, String userName, int imageNo) {
		UserInfoDto dto = new UserInfoDto();
		dto.setEmail(email);
		dto.setPw(pw);
		dto.setUserName(userName);
		dto.setImageNo(imageNo);
		
		loginDao.checkLocalLogin(dto);
	}

	// Find Password
	@Override
	public String findPassword(String email) {
		return loginDao.findPassword(email);
	}

	/*	Create VerificationCode
	*	resultType = Map
	*/
	@Override
	public Map<String, String> createVerificationCode() {
		// Create Code
		Map<String, String> map = new HashMap<>();
		LocalDateTime expireDate = LocalDateTime.now().plusMinutes(5);
		String verificationCode = "";
		try {
			verificationCode = RandomCodeUtil.generateRandomCode();
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("verificationCode", verificationCode);
		map.put("expireDate", expireDate.toString());
		return map;
	}
	
	// 인증 코드 확인
	@Override
	public boolean verificationCodeCheck(String email, String inputVerificationCode) {
		// Get Verification Code
		UserInfoDto dto = new UserInfoDto();
		LocalDateTime now = LocalDateTime.now();
		boolean isVerificated = false;
		dto = loginDao.checkVerificationCode(email);
		dto.setExpireDate(dto.getExpireDate().replace(" ", "T"));
		LocalDateTime expireDate = LocalDateTime.parse(dto.getExpireDate());
		
		try {
			if(dto.getVerificationCode() == inputVerificationCode) {
				if(now.isBefore(expireDate)) {
					isVerificated = true;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return isVerificated;
	}

	// 유저 정보
	@Override
	public UserInfoDto getUserProfile(int userNo) {
		return loginDao.getUserProfile(userNo);
	}

	// 구글 회원 등록
	@Override
	public void googleRegister(String email, String googleApi, String userName, int imageNo) {
		UserInfoDto dto = new UserInfoDto();
		dto.setEmail(email);
		dto.setGoogleApi(googleApi);
		dto.setUserName(userName);
		dto.setImageNo(imageNo);
		
		loginDao.googleRegister(dto);
	}

	@Override
	public boolean emailDuplicateCheck(String email) {
		return loginDao.emailDuplicateCheck(email);
	}

	@Override
	public int checkGoogleLogin(String email) {
		return loginDao.checkGoogleLogin(email);
	}
	
	// UserNo로 Email 조회
	@Override
	public Integer findUserNoByEmail(String email) {
		return loginDao.findUserNoByEmail(email);
	}

	@Override
	public void updateVerificationCode(Map<String, String> codeMap) {
		loginDao.updateVerificationCode(codeMap);
	}

}
