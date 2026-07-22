package com.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.dao.AlarmChkDao;
import com.team.dto.AlarmChkDto;

@Service
public class AlarmChkServiceImpl implements AlarmChkService {
	@Autowired
	AlarmChkDao alarmchkDao;
	
	@Override
	public boolean CreateAlarmCheck(AlarmChkDto alarmchkDto) {
		return alarmchkDao.CreateAlarmCheck(alarmchkDto);
	}
	@Override
	public boolean DeleteAlarmCheck(AlarmChkDto alarmchkDto) {
		return alarmchkDao.DeleteAlarmCheck(alarmchkDto);
	}
	@Override
	public int CountAlarmCheck(int user_no) {
		return alarmchkDao.CountAlarmCheck(user_no);
	}

}
