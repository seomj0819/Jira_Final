package com.team.dao;

import java.util.List;
import java.util.Map;

import com.team.dto.SearchConditionAccessDto;
import com.team.dto.SearchConditionDto;
import com.team.dto.SearchCriteriaDto;
import com.team.dto.UserInfoDto;

public interface SearchConditionDao {
	void createSearchCondition(SearchConditionDto dto);						// 필터 생성
	void deleteSearchCondition(SearchConditionAccessDto dto);				// 필터 삭제
	void updateSearchCondition(SearchConditionDto dto);						// 필터 업데이트
	void insertSearchConditionAccess(SearchConditionAccessDto dto);			// 필터 권한 추가
	void deleteSearchConditionAccess(SearchConditionAccessDto dto);			// 필터 권한 삭제
	List<SearchConditionDto> showSearchConditionList(int currentUserNo);	// 해당 유저가 접속 가능한 필터 리스트 출력
	void favoriteSearchCondition(Map<String, Object> map);					// 즐겨찾기 추가
	boolean isFavorite(int searchConditionNo);								// 필터가 즐겨찾기 되어있는지 조회
	List<SearchConditionDto> searchCriteriaByOwner(SearchCriteriaDto dto);	// 생성자로 필터 검색
	List<SearchConditionDto> searchCriteriaBySpace(SearchCriteriaDto dto);	// 스페이스별로 필터 검색
	List<SearchConditionDto> searchCriteriaByTitle(SearchCriteriaDto dto);	// 제목으로 필터 검색
	List<SearchConditionDto> showSearchConditionDetailByNo(int searchConditionNo);	// 필터 번호로 검색
	String showAccessTypeByUserNo (int searchConditionNo, int userNo);		// 현재 유저의 access_type 조회
	List<SearchConditionAccessDto> showAccessTypeList(int searchConditionNo);	// 해당 필터에 접근 가능 사용자 조회
	List<SearchConditionDto> searchCriteria(SearchCriteriaDto dto);			// 필터 검색
	List<UserInfoDto> showOwnerListByUserNo(int currentUserNo);				// 현재 접속중인 유저가 접근 가능한 Filter들의 ownerList 조회
}
