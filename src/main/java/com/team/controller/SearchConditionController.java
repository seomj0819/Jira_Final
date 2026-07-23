package com.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.team.service.SearchConditionService;

@Controller
public class SearchConditionController {
	@Autowired
	SearchConditionService searchConditionService;
}
