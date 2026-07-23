package com.team.project;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.dao.SpaceMemberDao;
import com.team.dto.SpaceMemberDto;
import com.team.dto.UserInfoDto;
import com.team.util.RandomCodeUtil;

@RunWith(SpringJUnit4ClassRunner.class) //	테스트를 스프링과 함께 실행 함
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class SpaceMemberDaoTest {
	@Autowired
	SpaceMemberDao spaceMemberDao;
	
	// 1. 해당 스페이스 멤버 중복 여부 테스트
	@Test
	public void testIsSpaceMemberDuplicate() {
		// Given
		SpaceMemberDto dto = new SpaceMemberDto();
		dto.setSpaceKey("ABCD");
		dto.setUserNo(4);
		
		// When
		boolean isDuplicate = spaceMemberDao.isSpaceMemberDuplicate(dto);
		System.out.println(isDuplicate);
		
		// Then
		assertNotNull(isDuplicate);
	}
	
	// 2. 초대 확인 코드 저장 테스트
	@Test
	public void testInsertInviteCode() {
		// Given
		SpaceMemberDto dto = new SpaceMemberDto();
		dto.setSpaceKey("ABCD");
		dto.setUserNo(4);
		dto.setUserRole("조회자");
		dto.setInviteCode(RandomCodeUtil.generateRandomCode());
		
		// When
		spaceMemberDao.insertInviteCode(dto);
		
		// Then
		
	}
	
	// 3. 초대 코드 확인 테스트
	@Test
	public void testCheckInviteCode() {
		// Given
		SpaceMemberDto dto = new SpaceMemberDto();
		dto.setSpaceKey("ABCD");
		dto.setUserNo(4);
		dto.setInviteCode("0dVZF9");
		
		// When
		int chk = spaceMemberDao.checkInviteCode(dto);
		
		// Then
		assertNotNull(chk);
		System.out.println(chk);
	}
	
	// 4. 초대코드 확인후 초대코드, 만료일 삭제 테스트
	@Test
	public void testUpdateSpaceMember() {
		// Given
		SpaceMemberDto dto = new SpaceMemberDto();
		dto.setSpaceKey("ABCD");
		dto.setUserNo(4);
		
		// When
		spaceMemberDao.updateSpaceMember(dto); 
		
		// Then
		
	}
	
	// 5. 초대코드 확인 실패후 회원정보 삭제 테스트
	@Test
	public void testDeleteSpaceMember() {
		// Given
		SpaceMemberDto dto = new SpaceMemberDto();
		dto.setSpaceKey("ABCD");
		dto.setUserNo(4);
		
		// When
		spaceMemberDao.deleteSpaceMember(dto);
		
		// Then
		
	}
	
	// 6. 회원 역할 조회 테스트
	@Test
	public void testSearchUserRole() {
		// Given
		SpaceMemberDto dto = new SpaceMemberDto();
		dto.setSpaceKey("ABCD");
		dto.setUserNo(2);
		
		// When
		String roll = spaceMemberDao.searchUserRole(dto);
		
		// Then
		assertNotNull(roll);
		System.out.println(roll);
	}
	
	// 7. 스페이스 회원 리스트 테스트 (접속중인 유저 제외)
	@Test
	public void testGetSpaceMembers() {
		// Given
		int currentUserNo = 2;
		
		// When
		List<UserInfoDto> list = spaceMemberDao.getSpaceMembers(currentUserNo);
		
		// Then
		for(UserInfoDto dto : list) {
			System.out.print("[" + dto.getUserNo() + ", ");
			System.out.print(dto.getUserName() + ", ");
			System.out.print(dto.getEmail() + ", ");
			System.out.println(dto.getImageNo() + "]");
		}
	}
	
	// 8. 스페이스 회원 리스트 테스트
	@Test
	public void testGetAllSpaceMembers() {
		// Given
		String spaceKey = "ABCD";
		
		// When
		List<UserInfoDto> list = spaceMemberDao.getAllSpaceMembers(spaceKey);
		
		// Then
		assertNotNull(list);
		for(UserInfoDto dto : list) {
			System.out.print("[" + dto.getUserNo() + ", ");
			System.out.print(dto.getUserName() + ", ");
			System.out.print(dto.getEmail() + ", ");
			System.out.println(dto.getImageNo() + "]");
		}
	}
	
}
