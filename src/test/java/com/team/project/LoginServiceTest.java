package com.team.project;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.dto.UserInfoDto;
import com.team.service.LoginService;

@RunWith(SpringJUnit4ClassRunner.class) //	테스트를 스프링과 함께 실행 함
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class LoginServiceTest {
	@Autowired
	LoginService loginService;
	
	// 1. 로컬 로그인 성공 테스트
	@Test
	public void testLoginSuccessCheck() {
		// Given
		String email="admin@admin.com";
		String pw="0000";
		
		// When
		Integer userNo = loginService.loginCheck(email, pw);
		
		// Then
		System.out.println("userNo : " + userNo);
		System.out.println("Login Succcess");
		assertTrue(userNo > 0);
	}
	
	// 1-1. 로컬 로그인 실패 테스트
	@Test
	public void testLofinFailCheck() {
		// Given
		String email="XXX@XXX.com";
		String pw="1234";
		
		// When
		Integer userNo = loginService.loginCheck(email, pw);
		
		// Then
		System.out.println("Login Fail");
		assertFalse(userNo > 0);
	}
	
	// 2. 로컬 회원 등록 테스트
	@Test
	public void testRegisterUser() {
		// Given
		String email = "test01@test.com";
		String pw = "0000";
		String userName = "tester";
		int imageNo = 0000;
		
		// When
		loginService.localRegister(email, pw, userName, imageNo);
		
		// Then
		System.out.println("Register Complete");
	}
	
	// 4. 비밀번호 찾기
	@Test
	public void testFindPassword() {
		// Given
		String email = "admin@admin.com";
		
		// When
		String pw = loginService.findPassword(email);
		
		// Then
		System.out.println("PassWord : " + pw);
		assertNotNull(pw);
	}
	
	// 5. 인증코드 만들기
	@Test
	public void testCreateVerificationCode() {
		// Given
		
		// When
		Map<String, String> map = new HashMap<>();
		map = loginService.createVerificationCode();
		
		// Then
		System.out.println("Verification Code : " + map.get("verificationCode"));
		System.out.println("Expire Date : " + map.get("expireDate"));
		assertNotNull(map);
	}
	
	// 6. 인증코드 확인 성궁
	@Test
	public void testVerificationCodeSuccessCheck() {
		// Given
		String email = "test@test.com";
		String inputVerificationCode = "I0x7s8";
		
		// When
		boolean chk = loginService.verificationCodeCheck(email, inputVerificationCode);
		
		// Then
		System.out.println(chk);
		assertTrue(chk);
	}
	
	// 6-1. 인증코드 확인 실패
	@Test
	public void testVerificationCodeFailCheck() {
		// Given
		String email = "test@test.com";
		String inputVerificationCode = "I0x7s8";
		
		// When
		boolean chk = loginService.verificationCodeCheck(email, inputVerificationCode);
		
		// Then
		System.out.println(chk);
		assertFalse(chk);
	}
	
	// 7. 유저 정보 가져오기
	@Test
	public void testGetUserProfile() {
		// Given
		UserInfoDto dto = new UserInfoDto();
		int userNo = 1;
		
		// When
		dto = loginService.getUserProfile(userNo);
		
		// Then
		assertNotNull(dto);
	}
	
	// 8. 구글 회원 등록 테스트
	@Test
	public void testGoogleRegister() {
		// Given
		String email = "test3@test.com";
		String googleApi = "google_api";
		String userName = "tester3";
		int imageNo = 0;
		
		// When
		loginService.googleRegister(email, googleApi, userName, imageNo);
		
		// Then
	}
	
	// 9. 이메일 중복 확인 테슽
	@Test
	public void testEmailDuplicateCheck() {
		// Given
		String email = "test@test.com";
		
		// When
		boolean chk = loginService.emailDuplicateCheck(email);
		
		// Then
		System.out.println(chk);
	}
	
	// 10-1. Email로 UserNo 조회 성공 테스트
	@Test
	public void testFineUserNoByEmailSuccess() {
		// Given
		String email = "test@test.com";
		
		// When
		int userNo = loginService.findUserNoByEmail(email);
		
		// Then
		assertNotNull(userNo);
		System.out.println(userNo);
	}
	
	// 10-2. Email로 UserNo 조회 실패 테스트
	@Test
	public void testFineUserNoByEmailFail() {
		// Given
		String email = "test@test.com";
		
		// When
		int userNo = loginService.findUserNoByEmail(email);
		
		// Then
		assertNull(userNo);
	}
	
	// 11. Update verificationCode 
	@Test
	public void testUpdateVerificationCode() {
		// Given
		String email = "test@test.com";
		String verificationCode = "I0x7s8";
		
		Map<String, String> codeMap = new HashMap<>();
		codeMap.put("email", email);
		codeMap.put("verificationCode", verificationCode);
		
		// When
		loginService.updateVerificationCode(codeMap);
		
		// Then
		
	}
}
