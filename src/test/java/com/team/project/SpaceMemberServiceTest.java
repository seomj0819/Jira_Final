package com.team.project;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.dto.SpaceMemberDto;
import com.team.dto.UserInfoDto;
import com.team.service.SpaceMemberService;
import com.team.util.RandomCodeUtil;

@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class SpaceMemberServiceTest {
	@Autowired
	SpaceMemberService spaceMemberSvc;
	
	// 1. 스페이스 멤버 중복 여부 확인 테스트
	@Test
	public void testIsSpaceMemberDuplicate() {
		// Given
		String spaceKey = "ABCD";
		int userNo = 2;
		
		// When
		boolean isDuplicate = spaceMemberSvc.isSpaceMemberDuplicate(spaceKey, userNo);
		
		// Then
		System.out.println(isDuplicate);
	}
	
	// 2. 초대 코드 생성 후 저장 테스트
	@Test
	public void testInsertInviteCode() {
		// Given
		SpaceMemberDto dto = new SpaceMemberDto();
		dto.setSpaceKey("ABCD");
		dto.setUserNo(4);
		dto.setUserRole("편집자");
		dto.setInviteCode(RandomCodeUtil.generateRandomCode());
		
		// When
		spaceMemberSvc.insertInviteCode(dto);
		
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
		boolean chk = spaceMemberSvc.checkInviteCode(dto);
		
		// Then
		assertNotNull(chk);
		
	}
	
	// 4. 회원 역할 조회 테스트
	@Test
	public void testSearchUserRoll() {
		// Given
		SpaceMemberDto dto = new SpaceMemberDto();
		dto.setSpaceKey("ABCD");
		dto.setUserNo(2);
		
		// When
		String roll = spaceMemberSvc.searchUserRoll(dto);
		
		// Then
		assertNotNull(roll);
		System.out.println(roll);
		
	}
	
	// 5. 회원 삭제 테스트
	@Test
	public void testDeleteSpaceMember() {
		// Given
		SpaceMemberDto dto = new SpaceMemberDto();
		dto.setSpaceKey("ABCD");
		dto.setUserNo(2);
		
		// When
		spaceMemberSvc.deleteSpaceMember(dto);
		
		// Then
		
	}
	
	// 6. 해당 스페이스에 본인을 제외한 멤버 조회 테스트
	@Test
	public void testGetSpaceMembers() {
		// Given
		int currentUserNo = 1;
		
		// When
		List<UserInfoDto> list = spaceMemberSvc.getSpaceMembers(currentUserNo);
		
		// Then
		for(UserInfoDto dto : list) {
			System.out.print("[" + dto.getUserNo() + ", ");
			System.out.print(dto.getUserName() + ", ");
			System.out.print(dto.getEmail() + ", ");
			System.out.println(dto.getImageNo() + "]");
		}
		
	}
	
	// 7. 해당 스페이스에 본인을 포함한 멤버 조회 테스트
	@Test
	public void testGetAllSpaceMembers() {
		// Given
		String spaceKey = "ABCD";
		
		// When
		List<UserInfoDto> list = spaceMemberSvc.getAllSpaceMembers(spaceKey);
		
		// Then
		for(UserInfoDto dto : list) {
			System.out.print("[" + dto.getUserNo() + ", ");
			System.out.print(dto.getUserName() + ", ");
			System.out.print(dto.getEmail() + ", ");
			System.out.println(dto.getImageNo() + "]");
		}
	}
	
}
