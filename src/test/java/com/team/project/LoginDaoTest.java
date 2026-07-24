package com.team.project;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.dao.LoginDao;
import com.team.dto.UserInfoDto;

@RunWith(SpringJUnit4ClassRunner.class) //	테스트를 스프링과 함께 실행 함
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class LoginDaoTest {
	@Autowired
	LoginDao loginDao;
	
	// 1. 로컬 로그인 성공 테스트
	@Test
	public void testLocalLoginSuccess() {
		// Given
		UserInfoDto dto = new UserInfoDto();
		dto.setEmail("admin@admin.com");
		dto.setPw("0000");
		
		// When
		Integer userNo = loginDao.checkLocalLogin(dto);
		
		// Then
		assertTrue(userNo > 0);
		System.out.println("Login Success");
	}
	
	// 1-1. 로컬 로그인 실패 테스트
	@Test
	public void testLocalLoginFail() {
		// Given
		UserInfoDto dto = new UserInfoDto();
		dto.setEmail("XXX@XXX.com");
		dto.setPw("1234");
		
		// When
		Integer userNo = loginDao.checkLocalLogin(dto);
		
		// Then
		assertTrue(userNo <= 0);
		System.out.println("Login Fail");
	}
	
	// 2. 이메일 중목 체크 테스트
	// 중복시 True
	@Test
	public void testEmailDuplicateTrueCheck() {
		// Given
		String email = "admin@admin.com";
		
		// When
		boolean isDuplicate = loginDao.emailDuplicateCheck(email);
		
		// Then
		assertTrue(isDuplicate);
		System.out.println(isDuplicate);
	}
	
	// 2. 이메일 중목 체크 테스트
	// 중복시 True
	@Test
	public void testEmailDuplicateFalseCheck() {
		// Given
		String email = "XXX@XXX.com";
		
		// When
		boolean isDuplicate = loginDao.emailDuplicateCheck(email);
		
		// Then
		assertFalse(isDuplicate);
		System.out.println(isDuplicate);
	}
	
	// 3. 로컬 회원 정보 등록 테스트
	@Test
	public void testLocalRegister() {
		// Given
		UserInfoDto dto = new UserInfoDto();
		dto.setEmail("test@test.com");
		dto.setPw("1234");
		dto.setUserName("tester");
		dto.setImageNo(0000);
		
		// When
		loginDao.localRegister(dto);
		
		// Then
		System.out.println("Register complete");
	}
	
	// 4. 비밀번호 찾기 테스트
	@Test
	public void testFindPassword() {
		// Given
		String email = "admin@admin.com";
		
		// When
		String pw = loginDao.findPassword(email);
		
		// Then
		assertNotNull(pw);
		System.out.println("PassWord : " + pw);
	}
	
	// 5. 인증 코드 저장 테스트
	@Test
	public void testUpdateVerificationCode() {
		// Given
		UserInfoDto dto = new UserInfoDto();
		dto.setEmail("test@test.com");
		dto.setVerificationCode("I0x7s8");
		
		// When
		loginDao.updateVerificationCode(dto);
		
		// Then
		
	}
	
	// 6. 인증 코드 확인 테스트
	@Test
	public void testCheckVerificationCode() {
		// Given
		UserInfoDto dto = new UserInfoDto();
		String email = "test@test.com";
		
		// When
		dto = loginDao.checkVerificationCode(email);
		dto.setEmail(email);
		
		// Then
		System.out.println(dto.getEmail());
		System.out.println(dto.getVerificationCode());
		System.out.println(dto.getExpireDate());
		assertNotNull(dto);
	}
	
	// 7. 회원 탈퇴 테스트
	@Test
	public void testDeleteUser() {
		// Given
		int userNo = 5;
		
		// When
		loginDao.deleteUser(userNo);
		
		// Then
	}
	
	// 8. 비밀번호 변경 테스트
	@Test
	public void testChangePw() {
		// Given
		int userNo = 3;
		String newPw = "0000";
		
		// When
		loginDao.changePw(userNo, newPw);
		
		// Then
		
	}
	
	//  9. 유저 정보 가져오기 테스트
	@Test
	public void testGetUserProfile() {
		// Given
		UserInfoDto dto = new UserInfoDto();
		int userNo = 1;
		
		// When
		dto = loginDao.getUserProfile(userNo);
		
		// Then
		assertNotNull(dto);
		System.out.println(dto.getEmail());
		System.out.println(dto.getImageNo());
		System.out.println(dto.getUserName());
	}
	
	// 10. 구글로그인 회원인지 조회 성공 테스트
	@Test
	public void testCheckGoogleLoginSuccess() {
		// Given
		String email = "abc@abc.com";
			
		// When
		int check = loginDao.checkGoogleLogin(email);
			
		// Then
		assertTrue(check > 0);
	}
	
	// 10-1. 구글로그인 회원인지 조회 실패 테스트
	@Test
	public void testCheckGoogleLoginFail() {
		// Given
		String email = "test@test.com";
		
		// When
		int check = loginDao.checkGoogleLogin(email);
		
		// Then
		assertTrue(check <= 0);
	}
	
	// 11. 구글 회원가입 테스트
	@Test
	public void testGoogleRegister() {
		// Given
		UserInfoDto dto = new UserInfoDto();
		dto.setEmail("test2@test.com");
		dto.setGoogleApi("google_api");
		dto.setUserName("tester2");
		dto.setImageNo(0);
		
		// When
		loginDao.googleRegister(dto);
		
		// Then
		assertNotNull(dto);
	}
	
	// 12. Email로 UserNo 조회 성공 테스트
	@Test
	public void testFineUserNoByEmailSuccess() {
		// Given
		String email = "test@test.com";
		
		// When
		int userNo = loginDao.findUserNoByEmail(email);
		
		// Then
		assertNotNull(userNo);
		System.out.println(userNo);
	}
	
	// 13. Email로 UserNo 조회 실패 테스트
	@Test
	public void testFineUserNoByEmailFail() {
		// Given
		String email = "test@test.com";
		
		// When
		int userNo = loginDao.findUserNoByEmail(email);
		
		// Then
		assertNull(userNo);
	}
}	





