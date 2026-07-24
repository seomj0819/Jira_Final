package com.team.dao;

import java.util.Map;

import com.team.dto.UserInfoDto;

public interface LoginDao {
	Integer checkLocalLogin(UserInfoDto dto);	// 로그인 체크 후 user_no를 return
	boolean emailDuplicateCheck(String email);	// email 중복 체크
	void localRegister(UserInfoDto dto);	// local 회원 정보 등록
	String findPassword(String email);		// pw 찾기
	void updateVerificationCode(Map<String, String> codeMap);	// 인증 코드 업데이트
	UserInfoDto checkVerificationCode(String email);	// 인증 코드 확인
	void deleteVerificationCode(String email);	// 인증 코드 삭제
	void deleteUser(int userNo);	// 회원 탈퇴
	void changePw(int userNo, String newPw);	// 비밀번호 변경
	UserInfoDto getUserProfile(int userNo);	// 유저 정보 가져오기
	int checkGoogleLogin(String email);	// 이메일 입력시 구글로그인인지 조회
	void googleRegister(UserInfoDto dto);	// 구글 로그인 회원 가입
	Integer findUserNoByEmail(String email);	// Email로 UserNo 조회
}
