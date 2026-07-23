package com.team.project;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.dto.SearchConditionAccessDto;
import com.team.dto.SearchConditionDto;
import com.team.dto.SearchCriteriaDto;
import com.team.service.SearchConditionService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class SearchConditionServiceTest {
	@Autowired
	SearchConditionService searchConditionService;
	
	// 1. 필터 생성 테스트
	@Test
	public void testCreateSearchCondition() {
		// Given
		List<String> list = new ArrayList<>();
		list.add("High");
		list.add("Medium");
		
		SearchConditionDto dto = new SearchConditionDto();
		dto.setSearchConditionTitle("Test02");
		dto.setOperatorPriority("=");
		dto.setPriorities(list);
		dto.setFavorite("N");
		dto.setAccessUserNo(1);
		dto.setAccessType("owner");
		
		// When
		searchConditionService.createSearchCondition(dto);
		
		// Then
	}
	
	// 2. 필터 삭제 테스트
	@Test
	public void testDeleteSearchCondition() {
		// Given
		SearchConditionAccessDto dto = new SearchConditionAccessDto();
		dto.setCurrentUserNo(2);
		dto.setSearchConditionNo(7);
		
		// When
		searchConditionService.deleteSearchCondition(dto);
		
		// Then
		
	}
	
	// 3. 필터 업데이트 테스트
	@Test
	public void testUpdateSearchCondition() {
		// Given
		SearchConditionDto dto = new SearchConditionDto();
		dto.setSearchConditionTitle("Test");
		dto.setSearchConditionNo(8);
		
		// When
		searchConditionService.updateSearchCondition(dto);
		
		// Then
		
	}
	
	// 4. 필터 권한 추가 테스트
	@Test
	public void testInsertSearchConditionAccess() {
		// Given
		SearchConditionAccessDto dto = new SearchConditionAccessDto();
		dto.setSearchConditionNo(8);
		dto.setAccessSpaceKey("ABCD");
		dto.setAccessType("viewer");
		
		// When
		searchConditionService.insertSearchConditionAccess(dto);
		
		// Then
		
	}
	
	// 5. 필터 권한 업데이트 테스트
	@Test
	public void testUpdateSearchConditionAccess() {
		// Given
		SearchConditionAccessDto dto = new SearchConditionAccessDto();
		dto.setSearchConditionNo(8);
		dto.setAccessSpaceKey("ABCD");
		dto.setAccessType("editor");
		
		// When
		searchConditionService.updateSearchConditionAccess(dto);
		
		// Then
		
	}
	
	// 6. 필터 권한 삭제 테스트
	@Test
	public void testDeleteSearchConditionAccess() {
		// Given
		SearchConditionAccessDto dto = new SearchConditionAccessDto();
		dto.setSearchConditionNo(8);
		dto.setAccessSpaceKey("ABCD");
		
		// When
		searchConditionService.deleteSearchConditionAccess(dto);
		
		// Then
		
	}
	
	// 7. 필터 즐겨찾기 테스트
	@Test
	public void testFavoriteSearchCondition() {
		// Given
		Map<String, Object> map = new HashMap<>();
		map.put("favorite", "Y");
		map.put("searchConditionNo", 8);
		
		// When
		searchConditionService.favoriteSearchCondition(map);
		
		// Then
		
	}
	
	// 8. 즐겨찾기 여부 조회 테스트
	@Test
	public void testIsFavorite() {
		// Given
		int searchConditionNo = 8;
		
		// When
		boolean favorite = searchConditionService.isFavorite(searchConditionNo);
		
		// Then
		assertNotNull(favorite);
		System.out.println(favorite);
	}
	
	// 9. 필터 목록 조회 테스트
	@Test
	public void testShowSearchConditoinList() {
		// Given
		int currentUserNo = 2;
		
		// When
		List<SearchConditionDto> list = searchConditionService.showSearchConditoinList(currentUserNo);
		
		// Then
		assertNotNull(list);
		System.out.println(list.isEmpty());
	}
	
	// 10. 생성자 이름으로 검색 테스트
	@Test
	public void testSearchCriteriaByOwner () {
		// Given
		SearchCriteriaDto dto = new SearchCriteriaDto();
		dto.setCurrentUserNo(2);
		dto.setSearchUserNo(2);
		
		// When
		List<SearchConditionDto> list = searchConditionService.searchCriteriaByOwner(dto);
		
		// Then
		assertNotNull(list);
		System.out.println(list.isEmpty());
	}
		
	// 11. 스페이스 이름으로 검색 테스트
	@Test
	public void testSearchCriteriaBySpace() {
		// Given
		SearchCriteriaDto dto = new SearchCriteriaDto();
		dto.setCurrentUserNo(2);
		dto.setSearchSpaceKey("ABCD");
		
		// When
		List<SearchConditionDto> list = searchConditionService.searchCriteriaBySpace(dto);
		
		// Then
		assertNotNull(list);
		System.out.println(list.isEmpty());
	}
	
	// 12. 필터 이름으로 검색 테스트
	@Test
	public void testSearchCriteriaByTitle() {
		// Given
		SearchCriteriaDto dto = new SearchCriteriaDto();
		dto.setCurrentUserNo(2);
		dto.setSearchKeyWord("Test");
		
		// When
		List<SearchConditionDto> list = searchConditionService.searchCriteriaByTitle(dto);
		
		// Then
		assertNotNull(list);
		System.out.println(list.isEmpty());
	}
}
