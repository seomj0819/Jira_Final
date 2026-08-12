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
import com.team.dto.UserInfoDto;

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
		List<SearchConditionDto> list = searchDao.showSearchConditionList(currentUserNo);
		
		// Then
		assertNotNull(list);
		System.out.println(list.isEmpty());
		
	}

	// 6. 생성자 이름으로 검색 테스트
	@Test
	public void testSearchCriteriaByOwner () {
		// Given
		SearchCriteriaDto dto = new SearchCriteriaDto();
		dto.setCurrentUserNo(2);
		dto.setSearchCreatorNo(2);
		
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
	
	// 11. 필터 상세 조회 테스트
	@Test
	public void testShowSearchConditionDetailByNo() {
		// Given
		int searchConditionNo = 8;
		
		// When
		List<SearchConditionDto> list = searchDao.showSearchConditionDetailByNo(searchConditionNo);
		
		// Then
		assertNotNull(list);
	}
	
	// 12. 해당 필터 현재 유저 권한 조회 테스트
	@Test
	public void testShowAccessTypeByUserNo() {
		// Given
		int searchConditionNo = 8; 
		int userNo = 1;
		
		// When
		String userRoll = searchDao.showAccessTypeByUserNo(searchConditionNo, userNo);
		
		// Then
		assertNotNull(userRoll);
		System.out.println(userRoll);
	}
	
	// 13. 해당 필터 전체 유저 권한 조회 테스트
	@Test
	public void testShowAccessTypeList() {
		// Given
		int searchConditionNo = 8;
		
		// When
		List<SearchConditionAccessDto> list = searchDao.showAccessTypeList(searchConditionNo);
		
		// Then
		assertNotNull(list);
	}
	
	// 14. 현재 접속중인 유저가 접근 가능한 Filter들의 ownerList 조회 테스트
	@Test
	public void testShowOwnerListByUserNo() {
		// Given
		int currentUserNo = 2;
		
		// When
		List<UserInfoDto> list = searchDao.showOwnerListByUserNo(currentUserNo);
		
		// Then
		assertNotNull(2);
		for(UserInfoDto dto : list) {
			System.out.print("[" + dto.getUserNo() + ", ");
			System.out.print(dto.getUserName() + ", ");
			System.out.print(dto.getEmail() + ", ");
			System.out.println(dto.getImageNo() + "]");
		}
	}
	
	// 15. 검색 조건중 스페이스키 조회 테스트
	@Test
	public void testShowDetailSpaceKeys() {
		// Given
		int searcnConditionNo = 8;
		
		// When
		String spaceKey = searchDao.showDetailSpaceKeys(searcnConditionNo);
		
		// Then
		assertNotNull(spaceKey);
		System.out.println(spaceKey);
	}
	
	// 16. 검색 조건중 소유자 조회 테스트
	@Test
	public void testShowDetailCreatorNos() {
		// Given
		int searcnConditionNo = 8;
		
		// When
		Integer creatorNo = searchDao.showDetailCreatorNos(searcnConditionNo);
		
		// Then
		assertNotNull(creatorNo);
		System.out.println(creatorNo);
	}
	
	// 17. 검색 조건중 작업자 조회 테스트
	@Test
	public void testShowDetailWorkerNos() {
		// Given
		int searcnConditionNo = 8;
		
		// When
		Integer workerNo = searchDao.showDetailWorkerNos(searcnConditionNo);
		
		// Then
		assertNotNull(workerNo);
		System.out.println(workerNo);
	}
	
	// 18. 검색 조건중 우선순위 조회 테스트
	@Test
	public void testShowDetailPriorities() {
		// Given
		int searcnConditionNo = 8;
		
		// When
		String priority = searchDao.showDetailPriorities(searcnConditionNo);
		
		// Then
		assertNotNull(priority);
		System.out.println(priority);
	}
	
	// 19. 검색 조건중 상태 조회 테스트
	@Test
	public void testShowDetailStatusNos() {
		// Given
		int searcnConditionNo = 8;
		
		// When
		Integer statusNo = searchDao.showDetailStatusNos(searcnConditionNo);
		
		// Then
		assertNotNull(statusNo);
		System.out.println(statusNo);
	}
	
	// 20. 검색 조건중 우선순위 조회 테스트
	@Test
	public void testShowDetailDueDates() {
		// Given
		int searcnConditionNo = 8;
		
		// When
		String dueDate = searchDao.showDetailDueDates(searcnConditionNo);
		
		// Then
		assertNotNull(dueDate);
		System.out.println(dueDate);
	}
	
	// 21. 필터 편집 테스트
	@Test
	public void testUpdateSearchConditionInfo() {
		// Given
		SearchConditionDto dto = new SearchConditionDto();
		dto.setSearchConditionTitle("EditedTitle");
		dto.setSearchConditionDescription("Filter Description");
		dto.setAccessUserNo(1);
		dto.setAccessType("viewer");
		
		// When
		searchDao.updateSearchConditionInfo(dto);
		
		// Then
		
	}
	
	// 22. 필터 전체 유저권한 삭제 테스트
	@Test
	public void deleteAllSearchConditionAccess() {
		// Given
		int searchConditionNo = 8;
		
		// When
		searchDao.deleteAllSearchConditionAccess(searchConditionNo);
		
		// Then
		
	}
	
}
