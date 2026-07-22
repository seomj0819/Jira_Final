package com.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.dao.HistoryDao;
import com.team.dto.HistoryDto;

@Service
public class HistoryServiceImpl implements HistoryService {
	@Autowired
	HistoryDao historyDao;
	
	@Override
	public boolean CreateHistory(HistoryDto historyDto) {
		return historyDao.CreateHistory(historyDto);
	}

	@Override
	public List<HistoryDto> ShowHistory(int user_no) {
		return historyDao.ShowHistory(user_no);
	}

	@Override
	public List<HistoryDto> ShowTaskHistory(HistoryDto historyDto) {
		return historyDao.ShowTaskHistory(historyDto);
	}

}
