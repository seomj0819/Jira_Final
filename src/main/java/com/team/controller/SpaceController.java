package com.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.team.service.SpaceMemberService;

@Controller
public class SpaceController {
	@Autowired
	SpaceMemberService spaceMemberService;
	

}
