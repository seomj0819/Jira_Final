package com.team.dao;

import java.util.List;

import com.team.dto.HistoryDto;

public interface HistoryDao {
	boolean CreateHistory(HistoryDto historyDto);
	List<HistoryDto> ShowHistory(int user_no);
	List<HistoryDto> ShowTaskHistory(HistoryDto historyDto);
}
