package com.team.service;

import java.util.List;

import com.team.dto.HistoryDto;

public interface HistoryService {
	boolean CreateHistory(HistoryDto historyDto);
	List<HistoryDto> ShowHistory(int userNo);
	List<HistoryDto> ShowTaskHistory(HistoryDto historyDto);
}
