package com.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.dto.SearchConditionDto;
import com.team.service.SearchConditionService;
import com.team.service.SpaceMemberService;

@Controller
public class SearchConditionController {
	@Autowired
	SearchConditionService searchConditionService;
	
	@GetMapping("/filter/list")
	public String filterList(HttpSession session, Model model) {
		Integer userNo = (Integer) session.getAttribute("userNo");
		
		List<SearchConditionDto> list = searchConditionService.showSearchConditoinList(userNo);
		model.addAttribute(list);
		
		return "FilterList";
	}
	
	@GetMapping("filter/detail")
	public String filterDetail(@RequestParam int searchConditionNo, HttpSession session, Model model) {
		int userNo = (int) session.getAttribute("userNo");
		String userRoll = searchConditionService.showAccessTypeByUserNo(searchConditionNo, userNo);
		List<SearchConditionDto> list = searchConditionService.showSearchConditionDetailByNo(searchConditionNo);
		
		if(userRoll != "Viewer" && !userRoll.isEmpty()) {
			return "FilterDetail_Viewer";
		}
		model.addAttribute(userRoll);
		model.addAttribute(list);
		return "FilterDetail";
	}
	
}
