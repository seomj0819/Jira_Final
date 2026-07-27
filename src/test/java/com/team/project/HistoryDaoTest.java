package com.team.project;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.dao.HistoryDao;
import com.team.dto.HistoryDto;

@RunWith(SpringJUnit4ClassRunner.class) //	테스트를 스프링과 함께 실행 함
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class HistoryDaoTest {
	@Autowired
	HistoryDao historyDao;
	
	// 1. 히스토리 생성 테스트
	@Test
	public void testCreateHistory() {
		// Given
		HistoryDto dto = new HistoryDto();
		dto.setSpace_key("ABCD");
		dto.setTask_no(1);
		dto.setReply_no(null);
		dto.setUser_no(1);
		dto.setField_name("task");
		dto.setAction_type("create");
		dto.setOld_value(null);
		dto.setNew_value("new1111");
		// When
		boolean isCreated = historyDao.CreateHistory(dto);
		// Then
		assertTrue("failed", isCreated);
	}
	
	// 2. 히스토리 조회 테스트
	@Test
	public void testShowHistory() {
		// Given
		int user_no = 1;
		// When
		List<HistoryDto> list = historyDao.ShowHistory(user_no);
		// Then
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getHistory_no()+"/"+list.get(i).getSpace_key()+"/"+list.get(i).getTask_no()+"/"+list.get(i).getReply_no()+"/"+list.get(i).getUser_no()+"/"+list.get(i).getField_name()+"/"+list.get(i).getAction_type()+"/"+list.get(i).getCreated_at()+"/"+list.get(i).getOld_value()+"/"+list.get(i).getNew_value());
		}
	}
	
	// 3. 테스크 히스토리 조회 테스트
	@Test
	public void testShowTaskHistory() {
		// Given
		HistoryDto dto = new HistoryDto();
		dto.setSpace_key("ABCD");
		dto.setTask_no(1);
		// When
		List<HistoryDto> list = historyDao.ShowTaskHistory(dto);
		// Then
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getHistory_no()+"/"+list.get(i).getReply_no()+"/"+list.get(i).getUser_no()+"/"+list.get(i).getField_name()+"/"+list.get(i).getAction_type()+"/"+list.get(i).getCreated_at()+"/"+list.get(i).getOld_value()+"/"+list.get(i).getNew_value());
		}
	}
	
}
