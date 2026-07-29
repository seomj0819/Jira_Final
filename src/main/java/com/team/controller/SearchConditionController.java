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
import com.team.service.SearchConditionService;

@Controller
public class SearchConditionController {
	@Autowired
	SearchConditionService searchConditionService;
	
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
	                           HttpSession session, Model model,
	                           HttpServletRequest request) {
	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }

	    String userRoll =
	        searchConditionService.showAccessTypeByUserNo(searchConditionNo, userNo);
	    List<SearchConditionDto> list =
	        searchConditionService.showSearchConditionDetailByNo(searchConditionNo);

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
	
}
