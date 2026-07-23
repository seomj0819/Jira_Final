package com.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.dto.SpaceMemberDto;
import com.team.service.SpaceMemberService;

@Controller
public class SpaceController {
	@Autowired
	SpaceMemberService spaceMemberService;
	
	@GetMapping("/space/select")
	public String selectSpace(HttpSession session, Model model) {
	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) return "redirect:/login";

	    List<SpaceMemberDto> spaceList = spaceMemberService.getSpacesByUserNo(userNo);
	    if (spaceList == null || spaceList.isEmpty()) {
	        return "redirect:/space/create";
	    }
	    model.addAttribute("spaceList", spaceList);
	    return "Main_assigned";
	}

	@GetMapping("/space/create")
	public String createSpacePage(HttpSession session) {
	    if (session.getAttribute("userNo") == null) return "redirect:/login";
	    return "CreateSpace";
	}

	@PostMapping("/space/enter")
	public String enterSpace(@RequestParam String spaceKey, HttpSession session) {
	    if (session.getAttribute("userNo") == null) return "redirect:/login";
	    session.setAttribute("spaceKey", spaceKey);
	    return "redirect:/board";
	}
}
