package com.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.dao.SearchConditionDao;
import com.team.dto.SearchConditionAccessDto;
import com.team.dto.SearchConditionDto;
import com.team.dto.SearchCriteriaDto;
import com.team.dto.UserInfoDto;

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
	public List<SearchConditionDto> showSearchConditionList(int currentUserNo) {
		return searchConditionDao.showSearchConditionList(currentUserNo);
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

	@Override
	public List<SearchConditionDto> showSearchConditionDetailByNo(int searchConditionNo) {
		return searchConditionDao.showSearchConditionDetailByNo(searchConditionNo);
	}
	
	@Override
	public String showAccessTypeByUserNo(int searchConditionNo, int userNo) {
		return searchConditionDao.showAccessTypeByUserNo(searchConditionNo, userNo);
	}

	@Override
	public List<SearchConditionAccessDto> showAccessTypeList(int searchConditionNo) {
		return searchConditionDao.showAccessTypeList(searchConditionNo);
	}

	@Override
	public List<SearchConditionDto> searchCriteria(SearchCriteriaDto dto) {
		return searchConditionDao.searchCriteria(dto);
	}

	@Override
	public List<UserInfoDto> showOwnerListByUserNo(int currentUserNo) {
		return searchConditionDao.showOwnerListByUserNo(currentUserNo);
	}

	@Override
	public String showDetailSpaceKeys(int searchConditionNo) {
		return searchConditionDao.showDetailSpaceKeys(searchConditionNo);
	}

	@Override
	public Integer showDetailCreatorNos(int searchConditionNo) {
		return searchConditionDao.showDetailCreatorNos(searchConditionNo);
	}

	@Override
	public Integer showDetailWorkerNos(int searchConditionNo) {
		return searchConditionDao.showDetailWorkerNos(searchConditionNo);
	}

	@Override
	public String showDetailPriorities(int searchConditionNo) {
		return searchConditionDao.showDetailPriorities(searchConditionNo);
	}

	@Override
	public Integer showDetailStatusNos(int searchConditionNo) {
		return searchConditionDao.showDetailStatusNos(searchConditionNo);
	}

	@Override
	public String showDetailDueDates(int searchConditionNo) {
		return searchConditionDao.showDetailDueDates(searchConditionNo);
	}

	@Override
	public void updateSearchConditionInfo(SearchConditionDto dto) {
		searchConditionDao.updateSearchConditionInfo(dto);
	}

}
