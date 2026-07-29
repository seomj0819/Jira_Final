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
import com.team.service.TaskService;

@Controller
public class SearchConditionController {
	@Autowired
	SearchConditionService searchConditionService;
	
	@Autowired
	TaskService taskService;
	
	@GetMapping("/filter/list")
	public String filterList(HttpSession session, Model model,
	                         HttpServletRequest request) {
	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }

	    List<SearchConditionDto> list =
	        searchConditionService.showSearchConditionList(userNo);
	    model.addAttribute("filterList", list);

	    if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
	        return "FilterList";
	    }

	    model.addAttribute("contentPage", "FilterList");
	    return "MainSides";
	}

	@GetMapping("/filter/list/detail")
	public String filterDetail(@RequestParam int searchConditionNo,
	                           HttpSession session, Model model, HttpServletRequest request) {
	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }

	    String userRoll = searchConditionService.showAccessTypeByUserNo(searchConditionNo, userNo);
	    List<SearchConditionDto> list = searchConditionService.showSearchConditionDetailByNo(searchConditionNo);

	    model.addAttribute("userRoll", userRoll);
	    model.addAttribute("list", list);

	    String page = "viewer".equals(userRoll) ? "FilterDetail_Viewer" : "FilterDetail";

	    if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
	        return page;
	    }

	    model.addAttribute("contentPage", page);
	    return "MainSides";
	}
	
	@PostMapping("/filter/favorite")
	@ResponseBody
	public String favorite(@RequestParam int searchConditionNo, 
						   @RequestParam String favorite, 
						   HttpSession session) {
		Integer userNo = (Integer) session.getAttribute("userNo");
		if(userNo == null) {
			return "fail";
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchConditionNo", searchConditionNo);
		map.put("favorite", favorite);	// "Y" or "N"
		
		searchConditionService.favoriteSearchCondition(map);
		return "ok";
	}
	
	@GetMapping("/filter/list/search")
	public String searchFilter(@RequestParam(required = false) Integer searchConditionNo,
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
		if(userNo == null) {
			return"redirect:/login";
		}
		
//		TaskSearchDto dto = new SearchCriteriaDto();
//		dto.setCurrentUserNo(userNo);
//		dto.setSearchSpaceKey(spaceKey);
//		dto.setOperatorSpace(operatorSpaceKey);
//		dto.setSearchKeyWord(keyword);
//		dto.setSearchCreatorNo(creatorNo);
//		dto.setOperatorCreator(operatorCreatorNo);
//		dto.setSearchWorkerNo(workerNo);
//		dto.setOperatorWorker(operatorWorkerNo);
//		dto.setSearchPriority(priority);
//		dto.setOperatorPriority(operatorPriority);
//		dto.setSearchStatusNo(statusNo);
//		dto.setOperatorStatusNo(operatorStatusNo);
//		dto.setSearchDueDate(dueDate);
//		dto.setOperatorDueDate(operatorDueDate);
		
//		List<TaskInfoDto> list = taskService.searchTask(dto);
		
		return "";
	}
			
	// Task 검색
	@GetMapping("/filter/list/detail/search")
	public String searchTasj(@RequestParam(required = false) String keyword, 
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
		if(userNo == null) {
			return "redirect:/login";
		}
		
		SearchCriteriaDto dto = new SearchCriteriaDto();
		dto.setCurrentUserNo(userNo);
		dto.setSearchSpaceKey(spaceKey);
		dto.setOperatorSpace(operatorSpaceKey);
		dto.setSearchKeyWord(keyword);
		dto.setSearchCreatorNo(creatorNo);
		dto.setOperatorCreator(operatorCreatorNo);
		dto.setSearchWorkerNo(workerNo);
		dto.setOperatorWorker(operatorWorkerNo);
		dto.setSearchPriority(priority);
		dto.setOperatorPriority(operatorPriority);
		dto.setSearchStatusNo(statusNo);
		dto.setOperatorStatusNo(operatorStatusNo);
		dto.setSearchDueDate(dueDate);
		dto.setOperatorDueDate(operatorDueDate);
		
		List<SearchConditionDto> list = searchConditionService.searchCriteria(dto);
		
		model.addAttribute("filterList", list);
		return "FilterSearchResult";
	}
	
}
