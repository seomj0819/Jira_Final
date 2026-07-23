package com.team.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    // 이메일 입력 화면
    @GetMapping("/login")
    public String loginPage() {
        return "Login";
    }

    // 이메일 -> 비밀번호 페이지
    @PostMapping("/login")
    public String loginEmail(@RequestParam String email, Model model) {
        model.addAttribute("email", email);
        return "Login_PassWord";
    }

    // 비밀번호 검사
    @PostMapping("/login/check")
    public String loginCheck(@RequestParam String email, @RequestParam String pw, HttpSession session) {

        Integer userNo = loginService.loginCheck(email, pw);

        if (userNo == null) {
            return "Login_Fail";
        }
        
        session.setAttribute("userNo", userNo);
        session.setAttribute("email", email);
        return "redirect:/board";
    }
    
    // 로그인 실패시 회원가입_email
    @PostMapping("/login_Fail")
    public String signUpEmail(String email, Model model) {
    	model.addAttribute("email", email);
    	return "Jira_SignUp";
    }
    
    // 로그인 실패시 회원가입_pw
    @PostMapping("/Jira_SignUp")
    public String sighUpPw(@RequestParam String email, String pw, Model model) {
    	model.addAttribute("email", email);
    	model.addAttribute("pw", pw);
    	
    	return "Login";
    }
}