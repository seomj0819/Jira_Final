package com.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.dao.StatusDao;
import com.team.dto.StatusDto;

@Service
public class StatusServiceImpl implements StatusService {
	@Autowired
	StatusDao statusDao;

	@Override
	public boolean CreateStatus(StatusDto statusDto) {
		return statusDao.CreateStatus(statusDto);
	}

	@Override
	public boolean UpdateStatus(Map<String, Object> paramMap) {
		return statusDao.UpdateStatus(paramMap);
	}

	@Override
	public boolean ChangeOrderUp(Map<String, Object> paramMap) {
		return statusDao.ChangeOrderUp(paramMap);
	}

	@Override
	public boolean ChangeOrderDown(Map<String, Object> paramMap) {
		return statusDao.ChangeOrderDown(paramMap);
	}

	@Override
	public boolean ChangeOrder(Map<String, Object> paramMap) {
		return statusDao.ChangeOrder(paramMap);
	}

	@Override
	public boolean UpdateTaskStatusFirstly(Map<String, Object> paramMap) {
		return statusDao.UpdateTaskStatusFirstly(paramMap);
	}

	@Override
	public boolean DownStatusOrderFirstly(int status_no) {
		return statusDao.DownStatusOrderFirstly(status_no);
	}

	@Override
	public boolean DeleteStatus(int status_no) {
		return statusDao.DeleteStatus(status_no);
	}

	@Override
	public List<StatusDto> ShowStatus(String space_key) {
		return statusDao.ShowStatus(space_key);
	}
}
