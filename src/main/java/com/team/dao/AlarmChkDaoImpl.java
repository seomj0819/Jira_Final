package com.team.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.AlarmChkDto;

@Repository
public class AlarmChkDaoImpl implements AlarmChkDao{
	@Autowired
	SqlSession sqlSession;

	// 명세 10.1
	// input : history_no, user_no
	// output : -
	public boolean CreateAlarmCheck(AlarmChkDto alarmchkDto) {
		boolean isCreated = false;

		try {
			int result = sqlSession.insert("com.team.mapper.AlarmChkMapper.createAlarmCheck", alarmchkDto);

			if (result > 0) {
				isCreated = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isCreated;
	}

	// 명세 10.2
	// input : history_no, user_no
	// output : -
	public boolean DeleteAlarmCheck(AlarmChkDto alarmchkDto) {
		boolean isDeleted = false;

		try {
			int result = sqlSession.delete("com.team.mapper.AlarmChkMapper.deleteAlarmCheck", alarmchkDto);

			if (result > 0) {
				isDeleted = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isDeleted;
	}

	// 명세 10.3
	// input : user_no
	// output : int
	public int CountAlarmCheck(int user_no) {
		int cnt = 0;
		
		try {
			cnt = sqlSession.selectOne("com.team.mapper.AlarmChkMapper.countAlarmCheck", user_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}

}
