package com.team.project;

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
	
	// 2. 로컬 로그인 실패 테스트
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
	
	// 3. 로컬 회원 정보 등록
	@Test
	public void testLocalRegister() {
		// Given
		UserInfoDto dto = new UserInfoDto();
		dto.setEmail("test@test.com");
		
		// When
		
		// Then
		
	}
}
