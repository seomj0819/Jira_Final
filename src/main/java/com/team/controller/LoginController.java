package com.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.service.LoginService;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping("/")
    public String home() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loginPage() {
    	return "Login";
    }
    
    @PostMapping("/login")
    public String loginPage(@RequestParam String email) {
    	System.out.println("Email : " + email);
        return "Login";
    }
}