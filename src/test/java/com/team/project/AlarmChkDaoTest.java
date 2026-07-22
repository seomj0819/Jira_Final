package com.team.project;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.dao.AlarmChkDao;
import com.team.dto.AlarmChkDto;

@RunWith(SpringJUnit4ClassRunner.class) //	테스트를 스프링과 함께 실행 함
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class AlarmChkDaoTest {
	@Autowired
	AlarmChkDao alarmchkDao;
	
	// 1. 알람 체크 생성 테스트
	@Test
	public void testCreateAlarmCheck() {
		// Given
		AlarmChkDto dto = new AlarmChkDto();
		dto.setHistory_no(2);
		dto.setUser_no(2);
		// When
		boolean isCreated = alarmchkDao.CreateAlarmCheck(dto);
		// Then
		assertTrue("failed", isCreated);
	}
	
	// 2. 알람 체크 삭제 테스트
	@Test
	public void testDeleteAlarmCheck() {
		// Given
		AlarmChkDto dto = new AlarmChkDto();
		dto.setHistory_no(2);
		dto.setUser_no(2);
		// When
		boolean isDeleted = alarmchkDao.DeleteAlarmCheck(dto);
		// Then
		assertTrue("failed", isDeleted);
	}
	
	// 3. 알람 개수 조회 테스트
	@Test
	public void testCountAlarXtmCheck() {
		// Given
		int user_no = 1;
		// When
		int cnt = alarmchkDao.CountAlarmCheck(user_no);
		// Then
		System.out.println(cnt);
		assertTrue("none", cnt >=1 );
	}
}
