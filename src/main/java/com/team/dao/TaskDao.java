package com.team.dao;

import java.util.List;

import com.team.dto.TaskInfoDto;
import com.team.dto.TaskOrderDto;
import com.team.dto.TaskSearchDto;

public interface TaskDao {
	void createTask(TaskInfoDto dto);	// 테스크 생성
	void deleteTask(TaskInfoDto dto);	// 테스크 삭제
	List<TaskInfoDto> showTaskList(String currentSpaceKey);	// 해당 스페이스의 테스크 리스트
	List<TaskInfoDto> showUpperTaskList(String currentSpaceKey);	// 해당 스페이스의 상위 테스트 리스트
	List<TaskInfoDto> showLowerTaskList(TaskInfoDto dto);	// 해당 스페이스 상위 작업에 하위 테스크 리스트
	void updateTask(TaskInfoDto dto);	// 테스크 업데이트
	boolean updateTaskOrder(TaskOrderDto dto);	// 테스크 순서 업데이트
	List<TaskInfoDto> searchTask(TaskSearchDto dto);	// 테스크 필터링
}
