package com.team.dao;

import java.util.List;
import java.util.Map;

import com.team.dto.SearchConditionAccessDto;
import com.team.dto.SearchConditionDto;
import com.team.dto.SearchCriteriaDto;

public interface SearchConditionDao {
	void createSearchCondition(SearchConditionDto dto);
	void deleteSearchCondition(SearchConditionAccessDto dto);
	void updateSearchCondition(SearchConditionDto dto);
	void insertSearchConditionAccess(SearchConditionAccessDto dto);
	void deleteSearchConditionAccess(SearchConditionAccessDto dto);
	List<SearchConditionDto> showSearchConditoinList(int currentUserNo);
	void favoriteSearchCondition(Map<String, Object> map);
	boolean isFavorite(int searchConditionNo);
	List<SearchConditionDto> searchCriteriaByOwner(SearchCriteriaDto dto);
	List<SearchConditionDto> searchCriteriaBySpace(SearchCriteriaDto dto);
	List<SearchConditionDto> searchCriteriaByTitle(SearchCriteriaDto dto);
	
}
