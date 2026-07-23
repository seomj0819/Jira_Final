package com.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.team.service.TaskService;

@Controller
public class TaskController {
	@Autowired
	TaskService taskService;
}
