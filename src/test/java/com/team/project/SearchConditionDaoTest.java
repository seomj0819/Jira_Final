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

import com.team.dao.SearchConditionDao;
import com.team.dto.SearchConditionAccessDto;
import com.team.dto.SearchConditionDto;
import com.team.dto.SearchCriteriaDto;

@RunWith(SpringJUnit4ClassRunner.class) //	테스트를 스프링과 함께 실행 함
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class SearchConditionDaoTest {
	@Autowired
	SearchConditionDao searchDao;
	
	// 1. 필터 만들기 테스트
	@Test
	public void testCreateSearchCondition() {
		// Given
		List<String> list = new ArrayList<>();
		list.add("High");
		list.add("Medium");
		
		SearchConditionDto dto = new SearchConditionDto();
		dto.setSearchConditionTitle("Test");
		dto.setOperatorPriority("=");
		dto.setPriorities(list);
		dto.setFavorite("Y");
		dto.setAccessUserNo(2);
		dto.setAccessType("owner");
		
		// When
		searchDao.createSearchCondition(dto);
		
		// Then
		
	}
	
	// 2. 필터 업데이트 테스트
	@Test
	public void testUpdateSearchCondition() {
		// Given
		List<String> Plist = new ArrayList<>();
		Plist.add("High");
		
		List<String> Slist = new ArrayList<>();
		Slist.add("ABCD");
		
		SearchConditionDto dto = new SearchConditionDto();
		dto.setSearchConditionTitle("Test01");
		dto.setSearchConditionNo(7);
		dto.setOperatorPriority("=");
		dto.setPriorities(Plist);
		dto.setOperatorSpace("!=");
		dto.setSpaceKeys(Slist);
		dto.setFavorite("N");
		
		// When
		searchDao.updateSearchCondition(dto);
		
		// Then
		
	}
	
	// 3. 필터 삭제 테스트
	@Test
	public void testDeleteSearchCondition() {
		// Given
		SearchConditionAccessDto dto = new SearchConditionAccessDto();
		dto.setSearchConditionNo(6);
		dto.setCurrentUserNo(0);
		
		// When
		searchDao.deleteSearchCondition(dto);
		
		// Then
		
	}
	
	// 4. 필터 리스트 조회 테스트
	@Test
	public void testShowSearchConditoinList() {
		// Given
		int currentUserNo = 2;
		
		// When
		List<SearchConditionDto> list = searchDao.showSearchConditoinList(currentUserNo);
		
		// Then
		assertNotNull(list);
		System.out.println(list.isEmpty());
		
	}
	
	// 5. 필터 즐겨찾기 추가 테스트
	@Test
	public void testFavoriteSearchCondition() {
		// Given
		Map<String, Object> map = new HashMap<>();
		map.put("favorite", "Y");
		map.put("searchConditionNo", 7);
		
		// When
		searchDao.favoriteSearchCondition(map);
		
		// Then
		
	}
	
	// 6. 생성자 이름으로 검색 테스트
	@Test
	public void testSearchCriteriaByOwner () {
		// Given
		SearchCriteriaDto dto = new SearchCriteriaDto();
		dto.setCurrentUserNo(2);
		dto.setSearchUserNo(2);
		
		// When
		List<SearchConditionDto> list = searchDao.searchCriteriaByOwner(dto);
		
		// Then
		assertNotNull(list);
		System.out.println(list.isEmpty());
	}
	
	// 7. 스페이스 이름으로 검색 테스트
	@Test
	public void testSearchCriteriaBySpace() {
		// Given
		SearchCriteriaDto dto = new SearchCriteriaDto();
		dto.setCurrentUserNo(2);
		dto.setSearchSpaceKey("ABCD");
		
		// When
		List<SearchConditionDto> list = searchDao.searchCriteriaBySpace(dto);
		
		// Then
		assertNotNull(list);
		System.out.println(list.isEmpty());
	}
	
	// 8. 필터 이름으로 검색 테스트
	@Test
	public void testSearchCriteriaByTitle() {
		// Given
		SearchCriteriaDto dto = new SearchCriteriaDto();
		dto.setCurrentUserNo(2);
		dto.setSearchKeyWord("Test");
		
		// When
		List<SearchConditionDto> list = searchDao.searchCriteriaByTitle(dto);
		
		// Then
		assertNotNull(list);
		System.out.println(list.isEmpty());
	}
	
	// 9. 필터 접근 권한 추가 테스트
	@Test
	public void testInsertSearchConditionAccess() {
		// Given
		SearchConditionAccessDto dto = new SearchConditionAccessDto();
		dto.setSearchConditionNo(7);
//		dto.setAccessUserNo(2);
		dto.setAccessSpaceKey("ABCD");
		dto.setAccessType("editor");
		
		// When
		searchDao.insertSearchConditionAccess(dto);
		
		// Then
		
	}
	
	// 10. 필터 접근 권한 삭제 테스트
	@Test
	public void testDeleteSearchConditionAccess() {
		// Given
		SearchConditionAccessDto dto = new SearchConditionAccessDto();		
		dto.setSearchConditionNo(7);
		dto.setAccessSpaceKey("ABCD");
		
		// When
		searchDao.deleteSearchConditionAccess(dto);
		
		// Then
	}
}
