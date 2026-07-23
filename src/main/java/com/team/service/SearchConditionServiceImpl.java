package com.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.dao.SearchConditionDao;
import com.team.dto.SearchConditionAccessDto;
import com.team.dto.SearchConditionDto;
import com.team.dto.SearchCriteriaDto;

@Service
public class SearchConditionServiceImpl implements SearchConditionService {
	@Autowired
	SearchConditionDao searchConditionDao;

	@Override
	public void createSearchCondition(SearchConditionDto dto) {
		searchConditionDao.createSearchCondition(dto);
	}

	@Override
	public void deleteSearchCondition(SearchConditionAccessDto dto) {
		searchConditionDao.deleteSearchCondition(dto);
	}

	@Override
	public void updateSearchCondition(SearchConditionDto dto) {
		searchConditionDao.updateSearchCondition(dto);
	}

	@Override
	public void insertSearchConditionAccess(SearchConditionAccessDto dto) {
		searchConditionDao.insertSearchConditionAccess(dto);
	}

	@Override
	public void deleteSearchConditionAccess(SearchConditionAccessDto dto) {
		searchConditionDao.deleteSearchConditionAccess(dto);
	}

	@Override
	public void updateSearchConditionAccess(SearchConditionAccessDto dto) {
		searchConditionDao.deleteSearchConditionAccess(dto);
		searchConditionDao.insertSearchConditionAccess(dto);
	}

	@Override
	public void favoriteSearchCondition(Map<String, Object> map) {
		searchConditionDao.favoriteSearchCondition(map);
	}

	@Override
	public boolean isFavorite(int searchConditionNo) {
		return searchConditionDao.isFavorite(searchConditionNo);
	}

	@Override
	public List<SearchConditionDto> showSearchConditoinList(int currentUserNo) {
		return searchConditionDao.showSearchConditoinList(currentUserNo);
	}

	@Override
	public List<SearchConditionDto> searchCriteriaByOwner(SearchCriteriaDto dto) {
		return searchConditionDao.searchCriteriaByOwner(dto);
	}

	@Override
	public List<SearchConditionDto> searchCriteriaBySpace(SearchCriteriaDto dto) {
		return searchConditionDao.searchCriteriaBySpace(dto);
	}

	@Override
	public List<SearchConditionDto> searchCriteriaByTitle(SearchCriteriaDto dto) {
		return searchConditionDao.searchCriteriaByTitle(dto);
	}

}
