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
    
    // 로그인 실패시 회원가입_email
    @PostMapping("/login_fail")
    public String signUpEmail(String email, Model model) {
    	model.addAttribute("email", email);
    	return "Jira_SignUp";
    }
    
    // 로그인 실패시 회원가입_pw
    @PostMapping("/jira_signUp")
    public String sighUpPw(@RequestParam String email, String pw, Model model) {
    	model.addAttribute("email", email);
    	model.addAttribute("pw", pw);
    	
    	return "Login";
    }
    
    // 회원가입
    @PostMapping("/sign_up")
    public String signUp(@RequestParam String email, @RequestParam String pw, @RequestParam String name, Model model) {
    	loginService.localRegister(email, pw, name, 0);
    	
    	Map<String, String> codeMap = loginService.createVerificationCode();
    	// TODO: 이메일 전송 API로 codeMap.get("verificationCode") 발송
    	
    	model.addAttribute("email", email);
		return pw;
    }
    
    // 인증 확인
    @PostMapping("/sign_up/verify")
    public String verify(@RequestParam String email, @RequestParam String code, HttpSession Session) {
    	
    	if(!loginService.verificationCodeCheck(email, code)) {
    		return "Email_verification";
    	}
    	
    	return "";
    }
    
}