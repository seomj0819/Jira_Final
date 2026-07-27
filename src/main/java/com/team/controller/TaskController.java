package com.team.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.service.TaskService;

@Controller
public class TaskController {
	@Autowired
	TaskService taskService;
	
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
}
