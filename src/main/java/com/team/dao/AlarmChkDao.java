package com.team.dao;

import com.team.dto.AlarmChkDto;

public interface AlarmChkDao {
	boolean CreateAlarmCheck(AlarmChkDto alarmchkDto);
	boolean DeleteAlarmCheck(AlarmChkDto alarmchkDto);
	int CountAlarmCheck(int user_no);
}
