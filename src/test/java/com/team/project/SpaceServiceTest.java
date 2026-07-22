package com.team.project;

import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 4. 스페이스 업데이트 테스트
	@Test
	public void testUpdateSpace() {
		// Given
		SpaceListDto spaceDto = new SpaceListDto();
		spaceDto.setSpaceKey("ABCD");
		spaceDto.setSpaceTitle("proj44");
		spaceDto.setSpaceStatus("Y");
		spaceDto.setImageNo(2);
		int userNo = 1;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("spaceDto", spaceDto);
		paramMap.put("userNo", userNo);
		// When
		boolean isUpdated = sSvc.UpdateSpace(paramMap);
		// Then
		assertTrue("failed", isUpdated);
	}
		
	// 5. 스페이스 리스트 조회
	@Test
	public void testShowSpaceList() {
		// Given
		int userNo = 1;
		// When
		List<SpaceListDto> list = sSvc.showSpaceList(userNo);
		// Then
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getSpaceKey()+"/"+list.get(i).getSpaceTitle()+"/"+list.get(i).getImageNo());
		}
	}
		
	// 6. 스페이스 상세 조회
	@Test
	public void testShowSpaceProfile() {
		// Given
		String spaceKey = "ABCD";
		// When
		SpaceListDto spaceDto = sSvc.showSpaceProfile(spaceKey);
		// Then
		System.out.println(spaceDto.getSpaceTitle()+"/"+spaceDto.getSpaceKey()+"/"+spaceDto.getSpaceStatus()+"/"+spaceDto.getImageNo());
	}
}
