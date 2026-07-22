package com.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.HistoryDto;

@Repository
public class HistoryDaoImpl implements HistoryDao {
	@Autowired
	SqlSession sqlSession;
	
	//명세 9.1
	// input : space_key, task_no, reply_no, user_no, field_name, action_type, old_value, new_value
	// output : -
	@Override
	public boolean CreateHistory(HistoryDto historyDto) {
		boolean isCreated = false;

		try {
			int result = sqlSession.insert("com.team.mapper.HistoryMapper.createHistory", historyDto);

			if (result > 0) {
				isCreated = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isCreated;
	}
	
	//명세 9.2
	// input : user_no
	// output : List<HistoryDto>
	@Override
	public List<HistoryDto> ShowHistory(int user_no) {
		List<HistoryDto> list = null;

		try {
			list = sqlSession.selectList("com.team.mapper.HistoryMapper.showHistory", user_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	//명세 9.3
	// input : space_key, task_no
	// output : List<HistoryDto>
	@Override
	public List<HistoryDto> ShowTaskHistory(HistoryDto historyDto) {
		List<HistoryDto> list = null;
		
		try {
			list = sqlSession.selectList("com.team.mapper.HistoryMapper.showTaskHistory", historyDto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
}
