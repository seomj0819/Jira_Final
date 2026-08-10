package com.team.service;

import java.util.List;
import java.util.Map;

import com.team.dto.SearchConditionAccessDto;
import com.team.dto.SearchConditionDto;
import com.team.dto.SearchCriteriaDto;
import com.team.dto.UserInfoDto;

public interface SearchConditionService {
	void createSearchCondition(SearchConditionDto dto);
	void deleteSearchCondition(SearchConditionAccessDto dto);
	void updateSearchCondition(SearchConditionDto dto);
	void insertSearchConditionAccess(SearchConditionAccessDto dto);
	void deleteSearchConditionAccess(SearchConditionAccessDto dto);
	void updateSearchConditionAccess(SearchConditionAccessDto dto);
	void favoriteSearchCondition(Map<String, Object> map);
	boolean isFavorite(int searchConditionNo);
	List<SearchConditionDto> showSearchConditionList(int currentUserNo);
	List<SearchConditionDto> searchCriteriaByOwner(SearchCriteriaDto dto);
	List<SearchConditionDto> searchCriteriaBySpace(SearchCriteriaDto dto);
	List<SearchConditionDto> searchCriteriaByTitle(SearchCriteriaDto dto);
	List<SearchConditionDto> showSearchConditionDetailByNo(int searchConditionNo);
	String showAccessTypeByUserNo (int searchConditionNo, int userNo);	
	List<SearchConditionAccessDto> showAccessTypeList(int searchConditionNo);
	List<SearchConditionDto> searchCriteria(SearchCriteriaDto dto);
	List<UserInfoDto> showOwnerListByUserNo(int currentUserNo);
	String showDetailSpaceKeys(int searchConditionNo);						// 검색 조건중 스페이스키 조회
	Integer showDetailCreatorNos(int searchConditionNo);						// 검색 조건중 소유자 조회
	Integer showDetailWorkerNos(int searchConditionNo);						// 검색 조건중 작업자 조회
	String showDetailPriorities(int searchConditionNo);						// 검색 조건중 우선순위 조회
	Integer showDetailStatusNos(int searchConditionNo);						// 검색 조건중 상태 조회
	String showDetailDueDates(int searchConditionNo);						// 검색 조건중 기한 조회
	void updateSearchConditionInfo(SearchConditionDto dto);
	void deleteAllSearchConditionAccess(int searchConditionNo);
}
