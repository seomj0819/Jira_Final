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

import com.team.dao.SpaceDao;
import com.team.dto.SpaceListDto;

@RunWith(SpringJUnit4ClassRunner.class) //	테스트를 스프링과 함께 실행 함
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class SpaceDaoTest {
	@Autowired
	SpaceDao spaceDao;
	
	// 1. 스페이스 생성 테스트
	@Test
	public void testCreateSpace() {
		// Given
		SpaceListDto dto = new SpaceListDto();
		dto.setSpaceKey("QWERtyty");
		dto.setSpaceTitle("abcdtitle");
		dto.setSpaceStatus("Y");
		// When
		boolean isCreated = spaceDao.CreateSpace(dto);
		// Then
		assertTrue("failed",isCreated);
	}
	
	// 2. 스페이스 멤버 먼저 삭제 테스트
	@Test
	public void testDeleteSpaceMemberFirstly() {
		// Given
		int userNo = 3;
		// When
		boolean isDeleted = spaceDao.DeleteSpaceMemberFirstly(userNo);
		// Then
		assertTrue("not administer", isDeleted);
	}
	
	// 3. 스페이스 삭제 테스트
	@Test
	public void testDeteleSpace() {
		// Given
		String spaceKey = "QWEA";
		// When
		boolean isDeleted = spaceDao.DeleteSpace(spaceKey);
		// Then
		assertTrue("failed", isDeleted);
	}
	
	// 4. 스페이스 업데이트 테스트
	@Test
	public void testUpdateSpace() {
		// Given
		SpaceListDto spaceDto = new SpaceListDto();
		spaceDto.setSpaceKey("ABCD");
		spaceDto.setSpaceTitle("proj55");
		spaceDto.setSpaceStatus("Y");
		spaceDto.setImageNo(1);
		int userNo = 1;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("spaceDto", spaceDto);
		paramMap.put("userNo", userNo);
		// When
		boolean isUpdated = spaceDao.UpdateSpace(paramMap);
		// Then
		assertTrue("failed", isUpdated);
	}
	
	// 5. 스페이스 리스트 조회
	@Test
	public void testShowSpaceList() {
		// Given
		int userNo = 1;
		// When
		List<SpaceListDto> list = spaceDao.showSpaceList(userNo);
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
		SpaceListDto spaceDto = spaceDao.showSpaceProfile(spaceKey);
		// Then
		System.out.println(spaceDto.getSpaceTitle()+"/"+spaceDto.getSpaceKey()+"/"+spaceDto.getSpaceStatus()+"/"+spaceDto.getImageNo());
	}

}
