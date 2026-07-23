package com.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
