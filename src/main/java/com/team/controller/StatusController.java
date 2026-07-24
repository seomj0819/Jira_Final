package com.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.dto.SpaceListDto;
import com.team.dto.StatusDto;
import com.team.service.SpaceService;
import com.team.service.StatusService;

@Controller
public class StatusController {
	@Autowired
	private StatusService stSvc;
	@Autowired
	private SpaceService sSvc;
	
	@RequestMapping("/rowedit")
	public String RowEdit(Model model) {
		
		List<StatusDto> list = stSvc.ShowStatus("ABCD");
		model.addAttribute("list", list);
		
		return "RowEdit";
	}
	
	@RequestMapping("/rowsandstatus")
	public String RowsAndStatus(Model model) {
		
		SpaceListDto dto = sSvc.showSpaceProfile("ABCD");
		List<SpaceListDto> list = sSvc.showSpaceList(1);
		List<StatusDto> stlist = stSvc.ShowStatus("ABCD");
		String todo = stlist.get(0).getStatusTitle();
		String doing = stlist.get(1).getStatusTitle();
		String check = stlist.get(stlist.size()-2).getStatusTitle();
		String clear = stlist.get(stlist.size()-1).getStatusTitle();
		
		
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		model.addAttribute("stlist", stlist);
		model.addAttribute("todo", todo);
		model.addAttribute("doing", doing);
		model.addAttribute("check", check);
		model.addAttribute("clear", clear);
		
		return "RowsAndStatus";
	}
	
}
