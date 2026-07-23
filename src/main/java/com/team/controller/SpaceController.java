package com.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.dto.SpaceListDto;
import com.team.service.SpaceService;

@Controller
public class SpaceController {
	@Autowired
	private SpaceService sSvc;
	
	@RequestMapping("/rowsandstatus")
	public String RowsAndStatus(Model model) {
		
		String space_title = sSvc.showSpaceProfile("ABCD").getSpaceTitle();
		
		model.addAttribute("space_title", space_title);
		
		return "RowsAndStatus";
	}
	
	@RequestMapping("/spacedetail")
	public String SpaceDetail(Model model) {
		
		SpaceListDto dto = sSvc.showSpaceProfile("ABCD");
		List<SpaceListDto> list = sSvc.showSpaceList(1);
		
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		
		return "SpaceDetail";
	}
	
}
