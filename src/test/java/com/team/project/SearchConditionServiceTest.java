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
		List<SearchConditionDto> list = searchConditionService.showSearchConditionList(currentUserNo);
		
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
		dto.setSearchCreatorNo(2);
		
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
	
	// 13. 필터 상세 검색 테스트
	@Test
	public void testShowSearchConditionDetailByNo() {
		// Given
		int searchConditionNo = 8;
		
		// When
		List<SearchConditionDto> list = searchConditionService.showSearchConditionDetailByNo(searchConditionNo);
		
		// Then
		assertNotNull(list);
	}
	
	// 14. 해당 필터 현재 유저 권한 조회 테스트
	@Test
	public void testShowAccessTypeByUserNo() {
		// Given
		int searchConditionNo = 8; 
		int userNo = 1;
		
		// When
		String userRoll = searchConditionService.showAccessTypeByUserNo(searchConditionNo, userNo);
		
		// Then
		assertNotNull(userRoll);
		System.out.println(userRoll);
	}
	
	// 15. 해당 필터 전체 유저 권한 조회 테스트
	@Test
	public void testShowAccessTypeList() {
		// Given
		int searchConditionNo = 8;
		
		// When
		List<SearchConditionAccessDto> list = searchConditionService.showAccessTypeList(searchConditionNo);
		
		// Then
		assertNotNull(list);
	}
	
	// 16. 검색 조건중 스페이스키 조회 테스트
	@Test
	public void testShowDetailSpaceKeys() {
		// Given
		int searcnConditionNo = 8;
		
		// When
		String spaceKey = searchConditionService.showDetailSpaceKeys(searcnConditionNo);
		
		// Then
		assertNotNull(spaceKey);
		System.out.println(spaceKey);
	}
	
	// 17. 검색 조건중 소유자 조회 테스트
	@Test
	public void testShowDetailCreatorNos() {
		// Given
		int searcnConditionNo = 8;
		
		// When
		Integer creatorNo = searchConditionService.showDetailCreatorNos(searcnConditionNo);
		
		// Then
		assertNotNull(creatorNo);
		System.out.println(creatorNo);
	}
	
	// 18. 검색 조건중 작업자 조회 테스트
	@Test
	public void testShowDetailWorkerNos() {
		// Given
		int searcnConditionNo = 8;
		
		// When
		Integer workerNo = searchConditionService.showDetailWorkerNos(searcnConditionNo);
		
		// Then
		assertNotNull(workerNo);
		System.out.println(workerNo);
	}
	
	// 19. 검색 조건중 우선순위 조회 테스트
	@Test
	public void testShowDetailPriorities() {
		// Given
		int searcnConditionNo = 8;
		
		// When
		String priority = searchConditionService.showDetailPriorities(searcnConditionNo);
		
		// Then
		assertNotNull(priority);
		System.out.println(priority);
	}
	
	// 20. 검색 조건중 상태 조회 테스트
	@Test
	public void testShowDetailStatusNos() {
		// Given
		int searcnConditionNo = 8;
		
		// When
		Integer statusNo = searchConditionService.showDetailStatusNos(searcnConditionNo);
		
		// Then
		assertNotNull(statusNo);
		System.out.println(statusNo);
	}
	
	// 21. 검색 조건중 우선순위 조회 테스트
	@Test
	public void testShowDetailDueDates() {
		// Given
		int searcnConditionNo = 8;
		
		// When
		String dueDate = searchConditionService.showDetailDueDates(searcnConditionNo);
		
		// Then
		assertNotNull(dueDate);
		System.out.println(dueDate);
	}

}
