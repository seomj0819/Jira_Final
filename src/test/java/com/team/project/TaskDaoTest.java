package com.team.project;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.dao.TaskDao;
import com.team.dto.TaskInfoDto;
import com.team.dto.TaskOrderDto;
import com.team.dto.TaskSearchDto;

@RunWith(SpringJUnit4ClassRunner.class) //	테스트를 스프링과 함께 실행 함
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class TaskDaoTest {
	@Autowired
	TaskDao taskDao;
	
	// 1. Task 생성 테스트
	@Test
	public void testCreateTask() {
		// Given
		TaskInfoDto dto = new TaskInfoDto();
		dto.setSpaceKey("ABCD");
		dto.setCreatorNo(1);
		dto.setTaskTitle("화장실 가기");
		dto.setStatusNo(2);
		dto.setPriority("High");
		
		// When
		taskDao.createTask(dto);
		
		// Then
	}
	
	// 2. Task 삭제 테스트
	@Test
	public void testDeleteTask() {
		// Given
		TaskInfoDto dto = new TaskInfoDto();
		dto.setSpaceKey("ABCD");
		dto.setTaskNo(27);
		
		// When
		taskDao.deleteTask(dto);
		
		// Then
	}
	
	// 3. 현재 Space에 Task List 조회 테스트
	@Test
	public void testShowTaskList() {
		// Given
		String currentSpaceKey = "ABCD";
		
		// When
		List<TaskInfoDto> list = taskDao.showTaskList(currentSpaceKey);
		
		// Then
		assertNotNull(list);
		for(TaskInfoDto dto : list) {
			System.out.print("[ " + dto.getSpaceKey());
			System.out.print(", " + dto.getTaskNo());
			System.out.print(", " + dto.getCreatorNo());
			System.out.print(", " + dto.getWorkerNo());
			System.out.print(", " + dto.getTaskTitle());
			System.out.print(", " + dto.getTaskDescription());
			System.out.print(", " + dto.getDueDate());
			System.out.print(", " + dto.getLabelTitle());
			System.out.print(", " + dto.getPriority());
			System.out.print(", " + dto.getUpperTaskNo());
			System.out.print(", " + dto.getTaskOrder());
			System.out.print(", " + dto.getImageNo());
			System.out.println(", " + dto.getSummary() + " ] ");
		}
	}
	
	// 4. 현재 스페이스에 상위 테스크 리스트 조회 테스트
	@Test
	public void testShowUpperTaskList() {
		// Given
		String currentSpaceKey = "ABCD";
		
		// When
		List<TaskInfoDto> list = taskDao.showUpperTaskList(currentSpaceKey);
		
		// Then
		assertNotNull(list);
		for(TaskInfoDto dto : list) {
			System.out.print("[ " + dto.getSpaceKey());
			System.out.print(", " + dto.getTaskNo());
			System.out.print(", " + dto.getCreatorNo());
			System.out.print(", " + dto.getWorkerNo());
			System.out.print(", " + dto.getTaskTitle());
			System.out.print(", " + dto.getTaskDescription());
			System.out.print(", " + dto.getDueDate());
			System.out.print(", " + dto.getLabelTitle());
			System.out.print(", " + dto.getPriority());
			System.out.print(", " + dto.getUpperTaskNo());
			System.out.print(", " + dto.getTaskOrder());
			System.out.print(", " + dto.getImageNo());
			System.out.println(", " + dto.getSummary() + " ] ");
		}
	}
	
	// 5. 해당 테스크의 하위 테스크 리스트 조회 테스트
	@Test
	public void testShowLowerTaskList() {
		// Given
		TaskInfoDto dto1 = new TaskInfoDto();
		dto1.setSpaceKey("ABCD");
		dto1.setUpperTaskNo(7);
		
		// When
		List<TaskInfoDto> list = taskDao.showLowerTaskList(dto1);
		
		// Then
		assertNotNull(list);
		for(TaskInfoDto dto2 : list) {
			System.out.print("[ " + dto2.getSpaceKey());
			System.out.print(", " + dto2.getTaskNo());
			System.out.print(", " + dto2.getCreatorNo());
			System.out.print(", " + dto2.getWorkerNo());
			System.out.print(", " + dto2.getTaskTitle());
			System.out.print(", " + dto2.getTaskDescription());
			System.out.print(", " + dto2.getDueDate());
			System.out.print(", " + dto2.getLabelTitle());
			System.out.print(", " + dto2.getPriority());
			System.out.print(", " + dto2.getUpperTaskNo());
			System.out.print(", " + dto2.getTaskOrder());
			System.out.print(", " + dto2.getImageNo());
			System.out.println(", " + dto2.getSummary() + " ] ");
		}
	}
	
	// 6. 테스크 업데이트 테스트
	@Test
	public void testUpdateTask() {
		// Given
		TaskInfoDto dto = new TaskInfoDto();
		dto.setSpaceKey("ABCD");
		dto.setTaskNo(7);
		dto.setTaskTitle("아무것도 안하기");
		dto.setTaskDescription("그냥 가만히 있어");
		
		// When
		taskDao.updateTask(dto);
		
		// Then
		
	}
	
	// 7. Task Order 업데이트 테스트
	@Test
	public void testUpdateTaskOrder() {
		// Given
		TaskOrderDto dto = new TaskOrderDto();
		dto.setStatusNo(0);
		dto.setSpaceKey("ABCD");
		dto.setTaskNo(8);
		dto.setBeforeTaskOrder(2);
		dto.setAfterTaskOrder(1);
		
		// When
		boolean chk = taskDao.updateTaskOrder(dto);
		
		// Then
		assertTrue(chk);
	}
	
	// 8. 테스크 검색 테스트
	@Test
	public void testSearchTask() {
		// Given
		TaskSearchDto dto = new TaskSearchDto();
		dto.setCurrentUserNo(2);
		dto.setSearchKeyWord("아무것도");
		
		// When
		List<TaskInfoDto> taskList = taskDao.searchTask(dto);
		System.out.println(taskList.isEmpty());
		
		// Then
		for(TaskInfoDto dto2 : taskList) {
			System.out.print("[ " + dto2.getSpaceKey());
			System.out.print(", " + dto2.getTaskNo());
			System.out.print(", " + dto2.getCreatorNo());
			System.out.print(", " + dto2.getWorkerNo());
			System.out.print(", " + dto2.getTaskTitle());
			System.out.print(", " + dto2.getTaskDescription());
			System.out.print(", " + dto2.getDueDate());
			System.out.print(", " + dto2.getLabelTitle());
			System.out.print(", " + dto2.getPriority());
			System.out.print(", " + dto2.getUpperTaskNo());
			System.out.print(", " + dto2.getTaskOrder());
			System.out.print(", " + dto2.getImageNo());
			System.out.println(", " + dto2.getSummary() + " ] ");
		}
	}
	
}
