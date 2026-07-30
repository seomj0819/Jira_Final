package com.team.dao;

import java.util.List;

import com.team.dto.HistoryDto;

public interface HistoryDao {
	boolean CreateHistory(HistoryDto historyDto);
	List<HistoryDto> ShowHistory(int userNo);
	List<HistoryDto> ShowTaskHistory(HistoryDto historyDto);
}
