package com.team.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.dto.ReplyListDto;
import com.team.dto.TaskInfoDto;
import com.team.dto.UserInfoDto;
import com.team.service.LoginService;
import com.team.service.ReplyService;
import com.team.service.TaskService;

@Controller
public class TaskController {
	@Autowired
	TaskService taskService;
	@Autowired
	LoginService loginService;
	@Autowired
	ReplyService replyService;
	
	@GetMapping("/board")
	public String board(HttpSession session, Model model) {
	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }

	    String spaceKey = (String) session.getAttribute("spaceKey");
	    if (spaceKey == null) {
	        return "redirect:/space/select"; 
	    }

	    model.addAttribute("taskList", taskService.showTaskList(spaceKey));
	    return "Main_board";
	}
	
	@GetMapping("/dashBoard")
	public String dashBoard(HttpSession session, Model model) {
	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }

	    String spaceKey = (String) session.getAttribute("spaceKey");
	    if (spaceKey == null) {
	        return "redirect:/space/select";
	    }

	    // FETCH...
	    return "Main_dashboard";
	}
	
	@GetMapping("/taskCard")
	public String taskCard(HttpSession session, Model model) {
		Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }

	    String spaceKey = (String) session.getAttribute("spaceKey");
	    if (spaceKey == null) {
	        return "redirect:/space/select";
	    }
	    
		session.setAttribute("spaceKey", "ABCD");

		TaskInfoDto dto = new TaskInfoDto();
		dto.setSpaceKey((String)session.getAttribute("spaceKey"));
		dto.setTaskNo(1);
		
		ReplyListDto replyDto = new ReplyListDto();
		replyDto.setSpaceKey(dto.getSpaceKey());
		replyDto.setTaskNo(dto.getTaskNo());
		
		
		model.addAttribute("dto", taskService.showTask(dto));
		model.addAttribute("creatorDto", loginService.getUserProfile(taskService.showTask(dto).getCreatorNo()));
		model.addAttribute("replyList", replyService.ShowReplyList(replyDto));
		
		List<UserInfoDto> writerList = new ArrayList<>();
		for(int i=0; i<replyService.ShowReplyList(replyDto).size(); i++) {
			writerList.add(loginService.getUserProfile(replyService.ShowReplyList(replyDto).get(i).getWriterNo()));
		}
		model.addAttribute("writerList", writerList);
		return "TaskCard";
	}
}
