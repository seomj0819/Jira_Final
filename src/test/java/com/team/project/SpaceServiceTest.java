package com.team.project;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.dto.SpaceListDto;
import com.team.service.SpaceService;

@RunWith(SpringJUnit4ClassRunner.class) //	테스트를 스프링과 함께 실행 함
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class SpaceServiceTest {
	@Autowired
	SpaceService sSvc;
	
	// 1. 스페이스 생성 테스트
	@Test
	public void testCreateSpace() {
		// Given
		SpaceListDto dto = new SpaceListDto();
		dto.setSpaceKey("QWEA");
		dto.setSpaceTitle("qweatitle");
		dto.setSpaceStatus("Y");
		// When
		boolean isCreated = sSvc.CreateSpace(dto);
		// Then
		assertTrue("failed", isCreated);
	}
	
	// 2. 스페이스 멤버 먼저 삭제 테스트
	@Test
	public void testDeleteSpaceMemberFirstly() {
		// Given
		int userNO = 3;
		
		// When
		boolean isDeleted = sSvc.DeleteSpaceMemberFirstly(userNO);
		
		// Then
		assertTrue("not administer", isDeleted);
	}
	
	// 3. 스페이스 삭제 테스트
	@Test
	public void testDeleteSpace() {
		// Given
		String spaceKey = "QWEA";
		
		// When
		boolean isDeleted = sSvc.DeleteSpace(spaceKey);
		
		// Then
		assertTrue("failed", isDeleted);
	}
}
