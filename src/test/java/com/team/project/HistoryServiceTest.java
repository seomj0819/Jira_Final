package com.team.project;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.dto.HistoryDto;
import com.team.service.HistoryService;

@RunWith(SpringJUnit4ClassRunner.class) //	테스트를 스프링과 함께 실행 함
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class HistoryServiceTest {
	@Autowired
	HistoryService hSvc;
	
	// 1. 히스토리 생성 테스트
	@Test
	public void testCreateHistory() {
		// Given
		HistoryDto dto = new HistoryDto();
		dto.setSpaceKey("ABCD");
		dto.setTaskNo(1);
		dto.setReplyNo(null);
		dto.setUserNo(1);
		dto.setFieldName("task");
		dto.setActionType("create");
		dto.setOldValue(null);
		dto.setNewValue("new1111");
		// When
		boolean isCreated = hSvc.CreateHistory(dto);
		// Then
		assertTrue("failed", isCreated);
	}
	
	// 2. 히스토리 조회 테스트
	@Test
	public void testShowHistory() {
		// Given
		int userNo = 1;
		// When
		List<HistoryDto> list = hSvc.ShowHistory(userNo);
		// Then
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getHistoryNo()+"/"+list.get(i).getSpaceKey()+"/"+list.get(i).getTaskNo()+"/"+list.get(i).getReplyNo()+"/"+list.get(i).getUserNo()+"/"+list.get(i).getFieldName()+"/"+list.get(i).getActionType()+"/"+list.get(i).getCreatedAt()+"/"+list.get(i).getOldValue()+"/"+list.get(i).getNewValue());
		}
	}
	
	// 3. 테스크 히스토리 조회 테스트
	@Test
	public void testShowTaskHistory() {
		// Given
		HistoryDto dto = new HistoryDto();
		dto.setSpaceKey("ABCD");
		dto.setTaskNo(1);
		// When
		List<HistoryDto> list = hSvc.ShowTaskHistory(dto);
		// Then
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getHistoryNo()+"/"+list.get(i).getReplyNo()+"/"+list.get(i).getUserNo()+"/"+list.get(i).getFieldName()+"/"+list.get(i).getActionType()+"/"+list.get(i).getCreatedAt()+"/"+list.get(i).getOldValue()+"/"+list.get(i).getNewValue());
		}
	}
	
}
