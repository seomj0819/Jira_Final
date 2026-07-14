package com.team.project;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.service.LoginService;

@RunWith(SpringJUnit4ClassRunner.class) //	테스트를 스프링과 함께 실행 함
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class LoginServiceTest {
	@Autowired
	LoginService lSvc;
	
	// 1. 로컬 로그인 성공 테스트
	@Test
	public void testLoginCheck() {
		// Given
		String email="admin@admin.com";
		String pw="0000";
		
		// When
		boolean loginCnt = lSvc.loginCheck(email, pw);
		
		// Then
		assertTrue(loginCnt);
		System.out.println("Login Succcess");
	}
	
	// 2. 로컬 로그인 실패 테스트
	@Test
	public void testRegisterUser() {
		// Given
		String email="XXX@XXX.com";
		String pw="1234";
		
		// When
		boolean loginCnt = lSvc.loginCheck(email, pw);
		
		// Then
		assertFalse(loginCnt);
		System.out.println("Login Fail");
	}
}
