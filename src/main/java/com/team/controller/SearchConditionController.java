package com.team.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.dto.SearchConditionAccessDto;
import com.team.dto.SearchConditionDto;
import com.team.dto.SearchCriteriaDto;
import com.team.dto.SpaceListDto;
import com.team.dto.StatusDto;
import com.team.dto.TaskSearchDto;
import com.team.service.SearchConditionService;
import com.team.service.SpaceMemberService;
import com.team.service.SpaceService;
import com.team.service.StatusService;
import com.team.service.TaskService;

@Controller
public class SearchConditionController {
	@Autowired
	SearchConditionService searchConditionService;

	@Autowired
	SpaceService spaceService;
	
	@Autowired
	TaskService taskService;
	
	@Autowired
	SpaceMemberService spaceMemberService;
	
	@Autowired
	StatusService statusService;

	@GetMapping("/filter/list")
	public String filterList(HttpSession session, Model model, HttpServletRequest request) {
		Integer userNo = (Integer) session.getAttribute("userNo");
		if (userNo == null) {
			return "redirect:/login";
		}

		List<SearchConditionDto> list = searchConditionService.showSearchConditionList(userNo);
		model.addAttribute("filterList", list);
		model.addAttribute("searchConditionList", list);
	    
	    // 현재 접속중인 유저가 속한 스페이스
	    model.addAttribute("spaceList", spaceService.showSpaceList(userNo));
	    
	    // 현재 접속중인 유저가 접근 가능한 필터의 소유자 List
	    model.addAttribute("ownerList", searchConditionService.showOwnerListByUserNo(userNo));
	    
	    if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
	        return "FilterList";
	    }
	    model.addAttribute("contentPage", "FilterList");
	    
	    return "MainSides";
	}

	@PostMapping("/filter/create")
	public String createFilter(
	        @RequestParam String searchConditionTitle,
	        @RequestParam(required = false) String searchConditionDescription,
	        HttpSession session) {

	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }

	    SearchConditionDto dto = new SearchConditionDto();
	    dto.setSearchConditionTitle(searchConditionTitle);
	    dto.setSearchConditionDescription(
	            searchConditionDescription != null ? searchConditionDescription : "");
	    dto.setOperatorSpace("=");
	    dto.setOperatorWorker("=");
	    dto.setOperatorCreator("=");
	    dto.setOperatorPriority("=");
	    dto.setOperatorStatus("=");
	    dto.setOperatorDueDate(">=");
	    dto.setFavorite("N");

	    // 생성한 사람을 owner로
	    dto.setAccessUserNo(userNo);
	    dto.setAccessType("owner");

	    searchConditionService.createSearchCondition(dto);

	    return "redirect:/filter/list/detail?searchConditionNo=" + dto.getSearchConditionNo();
	}
	
	@GetMapping("/filter/list/detail")
	public String filterDetail(@RequestParam int searchConditionNo, HttpSession session, Model model,
			HttpServletRequest request) {
		Integer userNo = (Integer) session.getAttribute("userNo");
		if (userNo == null) {
			return "redirect:/login";
		}

		String userRoll = searchConditionService.showAccessTypeByUserNo(searchConditionNo, userNo);
		List<SearchConditionDto> list = searchConditionService.showSearchConditionDetailByNo(searchConditionNo);

		model.addAttribute("userRoll", userRoll);
		model.addAttribute("list", list);

		List<SearchConditionDto> sideFilters = searchConditionService.showSearchConditionList(userNo);
		
		model.addAttribute("searchConditionList", sideFilters);
		model.addAttribute("spaceList", spaceService.showSpaceList(userNo));
		model.addAttribute("userList", spaceMemberService.getSpaceMembers(userNo));
		
		List<StatusDto> statusList = new ArrayList<StatusDto>();
		List<SpaceListDto> mySpaces = spaceService.showSpaceList(userNo);
		if (mySpaces == null) {
		    mySpaces = new ArrayList<SpaceListDto>();
		}
		for (int i = 0; i < mySpaces.size(); i++) {
		    String spaceKey = mySpaces.get(i).getSpaceKey();
		    List<StatusDto> oneSpaceStatus = statusService.ShowStatus(spaceKey);
		    if (oneSpaceStatus != null) {
		        statusList.addAll(oneSpaceStatus);
		    }
		}
		
		model.addAttribute("statusList", statusList);

		List<SearchConditionAccessDto> accessList =
		        searchConditionService.showAccessTypeList(searchConditionNo);
		model.addAttribute("accessList", accessList);
		
		String savedSpaceKey = searchConditionService.showDetailSpaceKeys(searchConditionNo);
		Integer savedCreatorNo = searchConditionService.showDetailCreatorNos(searchConditionNo);
		Integer savedWorkerNo = searchConditionService.showDetailWorkerNos(searchConditionNo);
		String savedPriority = searchConditionService.showDetailPriorities(searchConditionNo);
		Integer savedStatusNo = searchConditionService.showDetailStatusNos(searchConditionNo);
		String savedDueDate = searchConditionService.showDetailDueDates(searchConditionNo);

		model.addAttribute("savedSpaceKey", savedSpaceKey);
		model.addAttribute("savedCreatorNo", savedCreatorNo);
		model.addAttribute("savedWorkerNo", savedWorkerNo);
		model.addAttribute("savedPriority", savedPriority);
		model.addAttribute("savedStatusNo", savedStatusNo);
		model.addAttribute("savedDueDate", savedDueDate);

		SearchConditionDto filter = null;
		if (list != null && !list.isEmpty()) {
		    filter = list.get(0);
		}

		TaskSearchDto searchDto = new TaskSearchDto();
		searchDto.setCurrentUserNo(userNo);

		if (savedSpaceKey != null && !savedSpaceKey.equals("")) {
		    searchDto.setSearchSpaceKey(savedSpaceKey);
		    if (filter != null && filter.getOperatorSpace() != null) {
		        searchDto.setOperatorSpaceKey(filter.getOperatorSpace());
		    } else {
		        searchDto.setOperatorSpaceKey("=");
		    }
		}
		if (savedCreatorNo != null) {
		    searchDto.setSearchCreatorNo(savedCreatorNo);
		    if (filter != null && filter.getOperatorCreator() != null) {
		        searchDto.setOperatorCreatorNo(filter.getOperatorCreator());
		    } else {
		        searchDto.setOperatorCreatorNo("=");
		    }
		}
		if (savedWorkerNo != null) {
		    searchDto.setSearchWorkerNo(savedWorkerNo);
		    if (filter != null && filter.getOperatorWorker() != null) {
		        searchDto.setOperatorWorkerNo(filter.getOperatorWorker());
		    } else {
		        searchDto.setOperatorWorkerNo("=");
		    }
		}
		if (savedPriority != null && !savedPriority.equals("")) {
		    searchDto.setSearchPriority(savedPriority);
		    if (filter != null && filter.getOperatorPriority() != null) {
		        searchDto.setOperatorPriority(filter.getOperatorPriority());
		    } else {
		        searchDto.setOperatorPriority("=");
		    }
		}
		if (savedStatusNo != null) {
		    searchDto.setSearchStatusNo(savedStatusNo);
		    if (filter != null && filter.getOperatorStatus() != null) {
		        searchDto.setOperatorStatusNo(filter.getOperatorStatus());
		    } else {
		        searchDto.setOperatorStatusNo("=");
		    }
		}
		if (savedDueDate != null && !savedDueDate.equals("")) {
		    searchDto.setSearchDueDate(savedDueDate);
		    if (filter != null && filter.getOperatorDueDate() != null) {
		        searchDto.setOperatorDueDate(filter.getOperatorDueDate());
		    } else {
		        searchDto.setOperatorDueDate(">=");
		    }
		}

		model.addAttribute("taskList", taskService.searchTask(searchDto));

		if (list != null && !list.isEmpty()) {
		    model.addAttribute("filterTitle", list.get(0).getSearchConditionTitle());
		}
		
		String page = "FilterDetail";

		if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
			return page;
		}

		model.addAttribute("contentPage", page);
		return "MainSides";
	}

	@PostMapping("/filter/favorite")
	@ResponseBody
	public String favorite(@RequestParam int searchConditionNo, @RequestParam String favorite, HttpSession session) {
		Integer userNo = (Integer) session.getAttribute("userNo");
		if (userNo == null) {
			return "fail";
		}

		Map<String, Object> map = new HashMap<>();
		map.put("searchConditionNo", searchConditionNo);
		map.put("favorite", favorite); // "Y" or "N"

		searchConditionService.favoriteSearchCondition(map);
		return "ok";
	}

	// Filter 검색
	@GetMapping("/filter/list/search")
	public String searchFilter(@RequestParam(required = false) String keyword,
					           @RequestParam(required = false) String spaceKey, @RequestParam(required = false) String operatorSpaceKey,
					           @RequestParam(required = false) Integer ownerNo, @RequestParam(required = false) String operatorOwnerNo,
					           HttpSession session, Model model) {

	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }

	    SearchCriteriaDto dto = new SearchCriteriaDto();
	    dto.setCurrentUserNo(userNo);
	    dto.setSearchKeyWord(keyword);
	    dto.setSearchUserNo(ownerNo);
	    dto.setOperatorOwner(operatorOwnerNo);     // "=" or "!="
	    dto.setSearchSpaceKey(spaceKey);
	    dto.setOperatorSpace(operatorSpaceKey);    // "=" or "!="

	    List<SearchConditionDto> list =
	        searchConditionService.searchCriteria(dto);

	    model.addAttribute("filterList", list);
	    return "FilterSearchResult";
	}

	// Task 검색
	@GetMapping("/filter/list/detail/search")
	public String searchTask(
	        @RequestParam(required = false) String keyword,
	        @RequestParam(required = false) String spaceKey,
	        @RequestParam(required = false) String operatorSpaceKey,
	        @RequestParam(required = false) Integer creatorNo,
	        @RequestParam(required = false) String operatorCreatorNo,
	        @RequestParam(required = false) Integer workerNo,
	        @RequestParam(required = false) String operatorWorkerNo,
	        @RequestParam(required = false) String priority,
	        @RequestParam(required = false) String operatorPriority,
	        @RequestParam(required = false) Integer statusNo,
	        @RequestParam(required = false) String operatorStatusNo,
	        @RequestParam(required = false) String dueDate,
	        @RequestParam(required = false) String operatorDueDate,
	        HttpSession session, Model model) {

	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }

	    TaskSearchDto dto = new TaskSearchDto();
	    dto.setCurrentUserNo(userNo);
	    dto.setSearchKeyWord(keyword);
	    dto.setSearchSpaceKey(spaceKey);
	    dto.setOperatorSpaceKey(operatorSpaceKey);
	    dto.setSearchCreatorNo(creatorNo);
	    dto.setOperatorCreatorNo(operatorCreatorNo);
	    dto.setSearchWorkerNo(workerNo);
	    dto.setOperatorWorkerNo(operatorWorkerNo);
	    dto.setSearchPriority(priority);
	    dto.setOperatorPriority(operatorPriority);
	    dto.setSearchStatusNo(statusNo);
	    dto.setOperatorStatusNo(operatorStatusNo);
	    dto.setSearchDueDate(dueDate);
	    dto.setOperatorDueDate(operatorDueDate);

	    model.addAttribute("taskList", taskService.searchTask(dto));
	    model.addAttribute("spaceList", spaceService.showSpaceList(userNo));
	    model.addAttribute("userList", spaceMemberService.getSpaceMembers(userNo));
	    return "TaskSearchResult";
	}
	
	@PostMapping("/filter/list/detail/editInfo")
	public String filterInfoEdit(
	        @RequestParam int searchConditionNo,
	        @RequestParam(required = false) String searchConditionTitle,
	        @RequestParam(required = false) String searchConditionDescription,
	        @RequestParam(required = false) List<Integer> viewerUserNos,
	        @RequestParam(required = false) List<Integer> editorUserNos,
	        @RequestParam(required = false) List<String> viewerSpaceKeys,
	        @RequestParam(required = false) List<String> editorSpaceKeys,
	        HttpSession session) {
		Integer currentUserNo = (Integer) session.getAttribute("userNo");
		if (currentUserNo == null) {
	        return "redirect:/login";
	    }
	    // 제목/설명
	    SearchConditionDto dto = new SearchConditionDto();
	    dto.setSearchConditionNo(searchConditionNo);
	    dto.setSearchConditionTitle(searchConditionTitle);
	    dto.setSearchConditionDescription(searchConditionDescription);
	    
	    searchConditionService.updateSearchConditionInfo(dto);
	    
	    if (viewerUserNos == null) viewerUserNos = java.util.Collections.emptyList();
	    if (editorUserNos == null) editorUserNos = java.util.Collections.emptyList();
	    if (viewerSpaceKeys == null) viewerSpaceKeys = java.util.Collections.emptyList();
	    if (editorSpaceKeys == null) editorSpaceKeys = java.util.Collections.emptyList();
	    
	    // 기존 조회자/편집자 권한 삭제 (owner는 남김)
	    
	    List<SearchConditionAccessDto> oldList =
	            searchConditionService.showAccessTypeList(searchConditionNo);
	    for (SearchConditionAccessDto old : oldList) {
	        if ("owner".equals(old.getAccessType())) {
	            continue;
	        }
	        SearchConditionAccessDto del = new SearchConditionAccessDto();
	        del.setSearchConditionNo(searchConditionNo);
	        // 사용자 권한
	        if (old.getAccessUserNo() != 0) {
	            del.setAccessUserNo(old.getAccessUserNo());
	            searchConditionService.deleteSearchConditionAccess(del);
	        }
	        // 스페이스 권한
	        else if (old.getAccessSpaceKey() != null && !old.getAccessSpaceKey().isEmpty()) {
	            del.setAccessSpaceKey(old.getAccessSpaceKey());
	            searchConditionService.deleteSearchConditionAccess(del);
	        }
	    }
	    
	    // 3) 조회자(user) 추가
	    for (Integer userNo : viewerUserNos) {
	        SearchConditionAccessDto access = new SearchConditionAccessDto();
	        access.setSearchConditionNo(searchConditionNo);
	        access.setAccessUserNo(userNo);
	        access.setAccessType("viewer");
	        searchConditionService.insertSearchConditionAccess(access);
	    }
	    
	    // 4) 편집자(user) 추가
	    for (Integer userNo : editorUserNos) {
	        SearchConditionAccessDto access = new SearchConditionAccessDto();
	        access.setSearchConditionNo(searchConditionNo);
	        access.setAccessUserNo(userNo);
	        access.setAccessType("editor");
	        searchConditionService.insertSearchConditionAccess(access);
	    }
	    
	    // 5) 조회자(space) 추가
	    for (String spaceKey : viewerSpaceKeys) {
	        SearchConditionAccessDto access = new SearchConditionAccessDto();
	        access.setSearchConditionNo(searchConditionNo);
	        access.setAccessSpaceKey(spaceKey);
	        access.setAccessType("viewer");
	        searchConditionService.insertSearchConditionAccess(access);
	    }
	    
	    // 6) 편집자(space) 추가
	    for (String spaceKey : editorSpaceKeys) {
	        SearchConditionAccessDto access = new SearchConditionAccessDto();
	        access.setSearchConditionNo(searchConditionNo);
	        access.setAccessSpaceKey(spaceKey);
	        access.setAccessType("editor");
	        searchConditionService.insertSearchConditionAccess(access);
	    }
	    return "redirect:/filter/list/detail?searchConditionNo=" + searchConditionNo;
	}
	
	@PostMapping("/filter/list/detail/save")
	public String saveFilterCondition(
	        @RequestParam int searchConditionNo,
	        @RequestParam(required = false) String spaceKey,
	        @RequestParam(required = false) String operatorSpace,
	        @RequestParam(required = false) Integer creatorNo,
	        @RequestParam(required = false) String operatorCreator,
	        @RequestParam(required = false) Integer workerNo,
	        @RequestParam(required = false) String operatorWorker,
	        @RequestParam(required = false) String priority,
	        @RequestParam(required = false) String operatorPriority,
	        @RequestParam(required = false) Integer statusNo,
	        @RequestParam(required = false) String operatorStatus,
	        @RequestParam(required = false) String dueDate,
	        @RequestParam(required = false) String operatorDueDate,
	        HttpSession session) {

	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }

	    List<SearchConditionDto> list =
	            searchConditionService.showSearchConditionDetailByNo(searchConditionNo);
	    SearchConditionDto old = list.get(0);

	    SearchConditionDto dto = new SearchConditionDto();
	    dto.setSearchConditionNo(searchConditionNo);
	    dto.setSearchConditionTitle(old.getSearchConditionTitle());
	    dto.setSearchConditionDescription(old.getSearchConditionDescription());
	    dto.setFavorite(old.getFavorite());

	    dto.setOperatorSpace(operatorSpace != null ? operatorSpace : "=");
	    dto.setOperatorCreator(operatorCreator != null ? operatorCreator : "=");
	    dto.setOperatorWorker(operatorWorker != null ? operatorWorker : "=");
	    dto.setOperatorPriority(operatorPriority != null ? operatorPriority : "=");
	    dto.setOperatorStatus(operatorStatus != null ? operatorStatus : "=");
	    dto.setOperatorDueDate(operatorDueDate != null ? operatorDueDate : ">=");

	    if (spaceKey != null && !spaceKey.equals("")) {
	        List<String> spaceKeys = new java.util.ArrayList<String>();
	        spaceKeys.add(spaceKey);
	        dto.setSpaceKeys(spaceKeys);
	    }
	    if (creatorNo != null) {
	        List<Integer> creatorNos = new java.util.ArrayList<Integer>();
	        creatorNos.add(creatorNo);
	        dto.setCreatorNos(creatorNos);
	    }
	    if (workerNo != null) {
	        List<Integer> workerNos = new java.util.ArrayList<Integer>();
	        workerNos.add(workerNo);
	        dto.setWorkerNos(workerNos);
	    }
	    if (priority != null && !priority.equals("")) {
	        List<String> priorities = new java.util.ArrayList<String>();
	        priorities.add(priority);
	        dto.setPriorities(priorities);
	    }
	    if (statusNo != null) {
	        List<Integer> statusNos = new java.util.ArrayList<Integer>();
	        statusNos.add(statusNo);
	        dto.setStatusNos(statusNos);
	    }
	    if (dueDate != null && !dueDate.equals("")) {
	        List<String> dueDates = new java.util.ArrayList<String>();
	        dueDates.add(dueDate);
	        dto.setDueDates(dueDates);
	    }

	    searchConditionService.updateSearchCondition(dto);

	    return "redirect:/filter/list/detail?searchConditionNo=" + searchConditionNo;
	}
	
	@PostMapping("/filter/list/detail/delete")
	public String deleteFilter(
	        @RequestParam int searchConditionNo,
	        HttpSession session) {

	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }

	    SearchConditionAccessDto dto = new SearchConditionAccessDto();
	    dto.setSearchConditionNo(searchConditionNo);
	    dto.setCurrentUserNo(userNo);

	    String userRoll = searchConditionService.showAccessTypeByUserNo(searchConditionNo, userNo);
	    if (userRoll == null || !userRoll.equals("owner")) {
	        return "redirect:/filter/list/detail?searchConditionNo=" + searchConditionNo;
	    }
	    
	    searchConditionService.deleteSearchCondition(dto);

	    return "redirect:/filter/list";
	}
}
