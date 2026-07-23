package com.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.dao.TaskDao;
import com.team.dto.TaskInfoDto;
import com.team.dto.TaskOrderDto;
import com.team.dto.TaskSearchDto;

@Service
public class TaskServiceImpl implements TaskService {
	@Autowired
	TaskDao taskDao;

	@Override
	public void createTask(TaskInfoDto dto) {
		taskDao.createTask(dto);
	}

	@Override
	public void deleteTask(String spaceKey, int taskNo) {
		TaskInfoDto dto = new TaskInfoDto();
		dto.setSpaceKey(spaceKey);
		dto.setTaskNo(taskNo);
		
		taskDao.deleteTask(dto);
	}

	@Override
	public List<TaskInfoDto> showTaskList(String currentSpaceKey) {
		return taskDao.showTaskList(currentSpaceKey);
	}

	@Override
	public List<TaskInfoDto> showUpperTaskList(String currentSpaceKey) {
		return taskDao.showUpperTaskList(currentSpaceKey);
	}

	@Override
	public List<TaskInfoDto> showLowerTaskList(TaskInfoDto dto) {
		return taskDao.showLowerTaskList(dto);
	}

	@Override
	public void updateTask(TaskInfoDto dto) {
		taskDao.updateTask(dto);
	}

	@Override
	public List<TaskInfoDto> searchTask(TaskSearchDto dto) {
		return taskDao.searchTask(dto);
	}

	@Override
	public boolean updateTaskOrder(TaskOrderDto dto) {
		return taskDao.updateTaskOrder(dto);
	}
	
}
