package com.team.service;

import java.util.List;
import java.util.Map;

import com.team.dto.StatusDto;

public interface StatusService {
	boolean CreateStatus(StatusDto statusDto);
	boolean UpdateStatus(Map<String, Object> paramMap);
	boolean ChangeOrderUp(Map<String, Object> paramMap);
	boolean ChangeOrderDown(Map<String, Object> paramMap);
	boolean ChangeOrder(Map<String, Object> paramMap);
	boolean UpdateTaskStatusFirstly(Map<String, Object> paramMap);
	boolean DownStatusOrderFirstly(int status_no);
	boolean DeleteStatus(int status_no);
	List<StatusDto> ShowStatus(String space_key);
}
