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

import com.team.dao.StatusDao;
import com.team.dto.StatusDto;

@RunWith(SpringJUnit4ClassRunner.class) //	테스트를 스프링과 함께 실행 함
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class StatusDaoTest {
	@Autowired
	StatusDao statusDao;
	
	// 1. 스테이터스 생성 테스트
	@Test
	public void testCreateStatus() {
		// Given
		StatusDto dto = new StatusDto();
		dto.setSpaceKey("ABCD");
		dto.setStatusOrder(2);
		dto.setStatusTitle("DOING");
		dto.setStatusColor("blue");
		// When
		boolean isCreated = statusDao.CreateStatus(dto);
		// Then
		assertTrue("failed", isCreated);
	}
	
	// 2. 스테이터스 업데이트 테스트
	@Test
	public void testUpdateStatus() {
		// Given
		StatusDto statusDto = new StatusDto();
		statusDto.setStatusTitle("DOING");
		statusDto.setStatusColor("blue");
		int status_no = 3;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("statusDto", statusDto);
		paramMap.put("status_no", status_no);
		// When
		boolean isDeleted = statusDao.UpdateStatus(paramMap);
		// Then
		assertTrue("failed", isDeleted);
	}
	
	// 3. 스테이터스 오더 업 테스트
	@Test
	public void testChangeOrderUp() {
		// Given
		int new_status_order = 1;
		int status_order = 2;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("new_status_order", new_status_order);
		paramMap.put("status_order", status_order);
		// When
		boolean isChanged = statusDao.ChangeOrderUp(paramMap);
		// Then
		assertTrue("failed", isChanged);
	}
	
	// 4. 스테이터스 오더 다운 테스트
	@Test
	public void testChangeOrderDown() {
		// Given
		int new_status_order = 1;
		int status_order = 2;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("new_status_order", new_status_order);
		paramMap.put("status_order", status_order);
		// When
		boolean isChanged = statusDao.ChangeOrderDown(paramMap);
		// Then
		assertTrue("failed", isChanged);
	}
	
	// 5. 스테이터스 오더 변경 테스트
	@Test
	public void testChangeOrder() {
		// Given
		int new_status_order = 1;
		int status_no = 1;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("new_status_order", new_status_order);
		paramMap.put("status_no", status_no);
		// When
		boolean isChanged = statusDao.ChangeOrder(paramMap);
		// Then
		assertTrue("failed", isChanged);
	}
	// 5. 스테이터스 삭제 전 테스크 스테이터스 이동 테스트
	@Test
	public void testShowSpaceList() {
		// Given
		int status_no = 1;
		int new_status_no = 3;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("status_no", status_no);
		paramMap.put("new_status_no", new_status_no);
		// When
		boolean TaskStatusUpdated = statusDao.UpdateTaskStatusFirstly(paramMap);
		// Then
		assertTrue("failed", TaskStatusUpdated);
	}
	
	// 6. 삭제 전 타 스테이터스 오더 다운 테스트
	@Test
	public void testDownStatusOrderFirstly() {
		// Given
		int status_no = 1;
		// When
		boolean StatusOrderDowned = statusDao.DownStatusOrderFirstly(status_no);
		// Then
		assertTrue("failed", StatusOrderDowned);
	}
	
	// 7. 스테이터스 삭제 테스트
	@Test
	public void testDeleteStatus() {
		// Given
		int status_no = 1;
		// When
		boolean isDeleted = statusDao.DeleteStatus(status_no);
		// Then
		assertTrue("failed", isDeleted);
	}
	
	// 8. 스테이터스 조회(해당 스페이스) 테스트
	@Test
	public void testShowStatus() {
		// Given
		String space_key = "ABCD";
		// When
		List<StatusDto> list = statusDao.ShowStatus(space_key);
		// Then
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getStatusNo()+"/"+list.get(i).getStatusTitle()+"/"+list.get(i).getStatusColor());
		}
	}
}
