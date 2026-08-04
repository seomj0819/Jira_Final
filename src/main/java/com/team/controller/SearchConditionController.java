package com.team.controller;

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

import com.team.dto.SearchConditionDto;
import com.team.dto.SearchCriteriaDto;
import com.team.dto.TaskInfoDto;
import com.team.dto.TaskSearchDto;
import com.team.service.SearchConditionService;
import com.team.service.SpaceMemberService;
import com.team.service.SpaceService;
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
		
		TaskSearchDto searchDto = new TaskSearchDto();
		searchDto.setCurrentUserNo(userNo);
		List<TaskInfoDto> taskList = taskService.searchTask(searchDto);

		model.addAttribute("taskList", taskList);

		if (list != null && !list.isEmpty()) {
		    model.addAttribute("filterTitle", list.get(0).getSearchConditionTitle());
		}
		
		String page = "viewer".equals(userRoll) ? "FilterDetail_Viewer" : "FilterDetail";

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

}
