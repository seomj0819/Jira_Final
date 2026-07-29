package com.team.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.dto.SpaceListDto;
import com.team.dto.SpaceMemberDto;
import com.team.dto.TaskInfoDto;
import com.team.service.SearchConditionService;
import com.team.service.SpaceMemberService;
import com.team.service.SpaceService;
import com.team.service.StatusService;
import com.team.service.TaskService;

@Controller
public class SpaceController {
	@Autowired
	SpaceMemberService spaceMemberService;
	
	@Autowired
	SpaceService spaceService;
	
	@Autowired
	StatusService statusService;
	
	@Autowired
	TaskService taskService;
	
	@Autowired
	SearchConditionService searchConditionService;
	
	// 소속된 Space가 있을경우 Space 선택창으로 이동
	@GetMapping("/space/select")
	public String selectSpace(HttpSession session, Model model, HttpServletRequest request) {
	    Integer userNo = (Integer) session.getAttribute("userNo");
	    
	    if (userNo == null) {
	    	return "redirect:/login";
	    }

	    List<SpaceMemberDto> spaceMemberList = spaceMemberService.getSpacesByUserNo(userNo);
	    if (spaceMemberList == null || spaceMemberList.isEmpty()) {
	        return "redirect:/space/create";
	    }
	    model.addAttribute("spaceMemberList", spaceMemberList);
	    model.addAttribute("spaceList", spaceService.showSpaceList((Integer) session.getAttribute("userNo")));
	    model.addAttribute("searchConditionList", searchConditionService.showSearchConditionList((Integer) session.getAttribute("userNo")));
	    if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
	        return "Main_assigned";
	    }
	    model.addAttribute("contentPage", "Main_assigned");
	    return "MainSides";
	}
	
	// 소속된 Space가 없거나 Space 생성 버튼을 클릭 시 Space 생성창으로 이동
	@GetMapping("/space/create")
	public String createSpacePage(HttpSession session) {
		
	    if (session.getAttribute("userNo") == null) {
	    	return "redirect:/login";
	    }
	    
	    return "CreateSpace";
	}
	
	// Space 생성 후 Board로 이동
	@PostMapping("/space/create")
	public String createSpace(@RequestParam String spaceTitle,
	                          @RequestParam String spaceKey,
	                          HttpSession session) {

	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }

	    // space 테이블에 생성
	    SpaceListDto spaceDto = new SpaceListDto();
	    spaceDto.setSpaceKey(spaceKey);
	    spaceDto.setSpaceTitle(spaceTitle);
	    spaceDto.setSpaceStatus("Y");  

	    boolean created = spaceService.CreateSpace(spaceDto);
	    if (!created) {
	        return "redirect:/space/create";  
	    }

	    // 생성자를 owner로 등록
	    SpaceMemberDto memberDto = new SpaceMemberDto();
	    memberDto.setSpaceKey(spaceKey);
	    memberDto.setUserNo(userNo);
	    memberDto.setUserRole("admin"); 
	    memberDto.setInviteCode(null);  
	    spaceMemberService.insertInviteCode(memberDto);

	    // 3) 세션에 넣고 보드로
	    session.setAttribute("spaceKey", spaceKey);
	    return "redirect:/board";
	}

	// Space select 창에서 Space 선택후 Space/Board 페이지로 이동
	@PostMapping("/space/enter")
	public String enterSpace(@RequestParam String spaceKey, HttpSession session, Model model) {

	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }

	    // 이 스페이스 멤버인지 확인
	    boolean isMember = spaceMemberService.isSpaceMemberDuplicate(spaceKey, userNo);
	    if (!isMember) {
	        return "redirect:/space/select";
	    }
	    
	    List<List<TaskInfoDto>> taskListGroup = new ArrayList<>();
	    List<TaskInfoDto> taskListByStatus = new ArrayList<>();
	    List<Integer> taskQty = new ArrayList<>();
	    
	    for(int i=0; i<statusService.ShowStatus(spaceKey).size(); i++) {
	    	TaskInfoDto dto = new TaskInfoDto();
	    	dto.setSpaceKey(spaceKey);
	    	dto.setStatusNo(statusService.ShowStatus(spaceKey).get(i).getStatusNo());
	    	taskListByStatus = taskService.showTaskListByStatus(dto);
	    	taskQty.add(taskListByStatus.size());
	    	taskListGroup.add(taskListByStatus);
	    }
	    
	    model.addAttribute("spaceList", spaceService.showSpaceList((Integer) session.getAttribute("userNo")));
	    model.addAttribute("contentPage", "Main_board");
	    model.addAttribute("spaceDto", spaceService.showSpaceProfile(spaceKey));
	    model.addAttribute("statusList", statusService.ShowStatus(spaceKey));
	    model.addAttribute("taskQty", taskQty);
	    model.addAttribute("taskListGroup", taskListGroup);
	    model.addAttribute("searchConditionList", searchConditionService.showSearchConditionList((Integer) session.getAttribute("userNo")));
	    
	    session.setAttribute("spaceKey", spaceKey);
	    
	    return "MainSides";
	}
	
	// DashBoard 버튼 클릭 후 Space/DashBoard 페이지로 이동
	@PostMapping("/space/dashBoard")
	public String spaceDashBoard(@RequestParam String spaceKey, HttpSession session, Model model) {

	    if (session.getAttribute("userNo") == null) {
	        return "redirect:/login";
	    }
	    
	    model.addAttribute("contentPage", "Main_dashboard");
	    
	    session.setAttribute("spaceKey", spaceKey);
	    return "MainSides";
	}
}
