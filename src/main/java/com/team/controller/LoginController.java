package com.team.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.dto.SpaceMemberDto;
import com.team.service.LoginService;
import com.team.service.SpaceMemberService;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;
    
    @Autowired
    private SpaceMemberService spaceMemberService;

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
        
        if (loginService.checkGoogleLogin(email) > 0) {
            return "Login_Exist";
        }
        
        boolean exist = loginService.emailDuplicateCheck(email);
        if(!exist) {
        	return "Login_Fail";
        }
        
        return "Login_PassWord";
    }

    // 비밀번호 검사
    @PostMapping("/login/check")
    public String loginCheck(@RequestParam String email, @RequestParam String pw, HttpSession session, Model model) {

        Integer userNo = loginService.loginCheck(email, pw);

        if (userNo == null) {
            return "Login_Fail";
        }
        session.setAttribute("userNo", userNo);
        session.setAttribute("email", email);
        
        List<SpaceMemberDto> list = spaceMemberService.getSpacesByUserNo(userNo);
        
        if (!list.isEmpty()) {
            model.addAttribute("spaceList", list);
            return "Main_assigned";
        } else {
            return "CreateSpace";
        }
        
    }
    
    @PostMapping("/login_fail")
    public String signUpEmail(@RequestParam String email, Model model) {
        Map<String, String> codeMap = loginService.createVerificationCode();
        loginService.updateVerificationCode(codeMap);
        // TODO: 메일 발송

        model.addAttribute("email", email);
        return "Email_verification";
    }
    
    // 로그인 실패시 회원가입_pw
    @PostMapping("/jira_signUp")
    public String completeSignUp(@RequestParam String email, @RequestParam String pw, @RequestParam String name, HttpSession session) {
        loginService.localRegister(email, pw, name, 0);

        Integer userNo = loginService.findUserNoByEmail(email); // 추가 필요
        session.setAttribute("userNo", userNo);
        session.setAttribute("email", email);

        // 유효 초대 조회 후
        // 있으면 spaceKey 세션 + redirect:/board
        // 없으면 redirect:/space/create
        return "redirect:/space/create";
    }
    
    
    // 인증 확인
    @PostMapping("/sign_up/verify")
    public String verify(@RequestParam String email, @RequestParam String code, Model model) {
    	
        if (!loginService.verificationCodeCheck(email, code)) {
            model.addAttribute("email", email);
            return "Email_verification";
        }
        
        model.addAttribute("email", email);
        return "Jira_SignUp";
    }
    
}