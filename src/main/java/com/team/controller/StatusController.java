package com.team.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.service.StatusService;

@Controller
public class StatusController {
	@Autowired
	private StatusService stSvc;
	
	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
}
