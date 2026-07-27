package com.team.service;

import com.team.dto.AlarmChkDto;

public interface AlarmChkService {
	boolean CreateAlarmCheck(AlarmChkDto alarmchkDto);
	boolean DeleteAlarmCheck(AlarmChkDto alarmchkDto);
	int CountAlarmCheck(int user_no);
}
