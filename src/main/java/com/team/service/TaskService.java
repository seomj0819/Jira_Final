package com.team.service;

import java.util.List;

import com.team.dto.TaskInfoDto;
import com.team.dto.TaskOrderDto;
import com.team.dto.TaskSearchDto;

public interface TaskService {
	void createTask(TaskInfoDto dto);	// 테스크 생성
	void deleteTask(String spaceKey, int taskNo);	// 테스크 삭제
	List<TaskInfoDto> showTaskList(String currentSpaceKey);	// 해당 스페이스 TaskList 조회
	List<TaskInfoDto> showUpperTaskList(String currentSpaceKey);	// 해당 스페이스에 상위 TaskList 조회
	List<TaskInfoDto> showLowerTaskList(TaskInfoDto dto);	// 해당 스페이스에 하위 TaskList 조회
	void updateTask(TaskInfoDto dto);	// 테스크 업데이트
	List<TaskInfoDto> searchTask(TaskSearchDto dto);	// 조건에 맞는 테스크 조회
	boolean updateTaskOrder(TaskOrderDto dto);	// 테스크 순서 업데이트
}
