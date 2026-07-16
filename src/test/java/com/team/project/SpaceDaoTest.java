package com.team.project;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.dao.SpaceDao;
import com.team.dto.SpaceListDto;
import com.team.dto.UserInfoDto;

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
}
