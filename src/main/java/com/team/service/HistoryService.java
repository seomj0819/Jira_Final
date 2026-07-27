package com.team.service;

import java.util.List;

import com.team.dto.HistoryDto;

public interface HistoryService {
	boolean CreateHistory(HistoryDto historyDto);
	List<HistoryDto> ShowHistory(int user_no);
	List<HistoryDto> ShowTaskHistory(HistoryDto historyDto);
}
