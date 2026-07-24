package com.team.service;

import java.util.Map;

import com.team.dto.UserInfoDto;

public interface LoginService {
	Integer loginCheck(String email, String pw);	// 로그인 여부
	void localRegister(String email, String pw, String userName, int imageNo);	// 로컬 회원 등록
	String findPassword(String email);	// 비밀번호 찾기
	Map<String, String> createVerificationCode();	// 인증 코드 생성
	boolean verificationCodeCheck(String email, String inputVerificationCode);	// 인증 코드 확인
	UserInfoDto getUserProfile(int userNo);	// 유저 정보 가져오기
	void googleRegister(String email, String googleApi, String userName, int imageNo);	// 구글 회원 등록
	boolean emailDuplicateCheck(String email);	// 이메일 중복 여부 확인
	int checkGoogleLogin(String email);	
	Integer findUserNoByEmail(String email);	// Email로 UserNo 조회
}
