package com.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.TaskInfoDto;
import com.team.dto.TaskOrderDto;
import com.team.dto.TaskSearchDto;

@Repository
public class TaskDaoImpl implements TaskDao{
	@Autowired
	SqlSession sqlSession;

	@Override
	public void createTask(TaskInfoDto dto) {
		sqlSession.insert("com.team.mapper.TaskInfoMapper.createTask", dto);
	}

	@Override
	public void deleteTask(TaskInfoDto dto) {
		sqlSession.delete("com.team.mapper.TaskInfoMapper.deleteTask", dto);
	}

	@Override
	public List<TaskInfoDto> showTaskList(String currentSpaceKey) {
		return sqlSession.selectList("com.team.mapper.TaskInfoMapper.showTaskList", currentSpaceKey);
	}

	@Override
	public List<TaskInfoDto> showUpperTaskList(String currentSpaceKey) {
		return sqlSession.selectList("com.team.mapper.TaskInfoMapper.showUpperTaskList", currentSpaceKey);
	}

	@Override
	public List<TaskInfoDto> showLowerTaskList(TaskInfoDto dto) {
		return sqlSession.selectList("com.team.mapper.TaskInfoMapper.showLowerTaskList", dto);
	}

	@Override
	public void updateTask(TaskInfoDto dto) {
		sqlSession.update("com.team.mapper.TaskInfoMapper.updateTask", dto);
	}

	@Override
	public boolean updateTaskOrder(TaskOrderDto dto) {
		sqlSession.update("com.team.mapper.TaskInfoMapper.increaseTaskOrder", dto);
		sqlSession.update("com.team.mapper.TaskInfoMapper.decreaseTaskOrder", dto);
		int chk = sqlSession.update("com.team.mapper.TaskInfoMapper.updateTaskOrder", dto);
		return chk > 0;
	}

	@Override
	public List<TaskInfoDto> searchTask(TaskSearchDto dto) {
		return sqlSession.selectList("com.team.mapper.TaskInfoMapper.searchTaskBySearchCondition", dto);
	}
	
}
