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
    @PostMapping("/login/check")
    public String loginEmail( @RequestParam String email, Model model ) { 
    	model.addAttribute("email", email);
        return "Login_PassWord";
    }

    // 비밀번호 검사
    @PostMapping("/login")
    public String loginCheck( @RequestParam String email, @RequestParam String pw, HttpSession session ) {
        Integer userNo = loginService.loginCheck(email, pw);

        if (userNo == null) {
            // 실패
            return "Login_Fail";
        }

        // 성공: 로그인 상태 저장
        session.setAttribute("userNo", userNo);
        session.setAttribute("email", email);

        return "Main_board";
    }
}