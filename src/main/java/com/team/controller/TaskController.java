package com.team.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.dto.HistoryDto;
import com.team.dto.ReplyListDto;
import com.team.dto.TaskInfoDto;
import com.team.dto.UserInfoDto;
import com.team.service.HistoryService;
import com.team.service.LoginService;
import com.team.service.ReplyService;
import com.team.service.SpaceService;
import com.team.service.TaskService;

@Controller
public class TaskController {
	@Autowired
	TaskService taskService;
	@Autowired
	LoginService loginService;
	@Autowired
	ReplyService replyService;
	@Autowired
	SpaceService spaceService;
	@Autowired
	HistoryService historyService;
	
	@GetMapping("/board")
	public String board(HttpSession session, Model model) {
	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }

	    String spaceKey = (String) session.getAttribute("spaceKey");
	    if (spaceKey == null) {
	        return "redirect:/space/select"; 
	    }

	    model.addAttribute("taskList", taskService.showTaskList(spaceKey));
	    model.addAttribute("spaceList", spaceService.showSpaceList(userNo));
	    model.addAttribute("contentPage", "Main_board");
	    return "MainSides";
	}
	
	@GetMapping("/dashBoard")
	public String dashBoard(HttpSession session, Model model) {
	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }

	    String spaceKey = (String) session.getAttribute("spaceKey");
	    if (spaceKey == null) {
	        return "redirect:/space/select";
	    }

	    model.addAttribute("spaceList", spaceService.showSpaceList(userNo));
	    model.addAttribute("contentPage", "Main_dashboard");
	    
	    // FETCH...
	    return "MainSides";
	}
	
	@GetMapping("/taskCard")
	public String taskCard(@RequestParam("taskNo") int taskNo, HttpSession session, Model model) {
		// 1. 로그인 체크
		Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }
	    // 2. 세션에서 스페이스 키 가져오기
	    String spaceKey = (String) session.getAttribute("spaceKey");
	    if (spaceKey == null) {
	        return "redirect:/space/select";
	    }
	    
	    // 3. 복합키(spaceKey + taskNo) 조건 세팅
	 	TaskInfoDto dto = new TaskInfoDto();
	 	dto.setSpaceKey(spaceKey);
	 	dto.setTaskNo(taskNo);
	 		
	 	TaskInfoDto task = taskService.showTask(dto);
	 	if (task == null) {
	 		return "redirect:/board"; // 잘못된 접근 시 보드로 리다이렉트
	 	}
	 		
	 	// 4. 댓글 조회 조건 세팅
	 	ReplyListDto replyDto = new ReplyListDto();
	 	replyDto.setSpaceKey(spaceKey);
	 	replyDto.setTaskNo(taskNo);
	 		
	 	List<ReplyListDto> replyList = replyService.ShowReplyList(replyDto);

	 	// 5. 모델에 데이터 담기
	 	model.addAttribute("dto", task);
	 	model.addAttribute("creatorDto", loginService.getUserProfile(task.getCreatorNo()));
	 	model.addAttribute("replyList", replyList);
	 		
	 	// 댓글 작성자 목록 매핑
	 	List<UserInfoDto> writerList = new ArrayList<>();
	 	for(int i = 0; i < replyList.size(); i++) {
	 		writerList.add(loginService.getUserProfile(replyList.get(i).getWriterNo()));
	 	}
	 	model.addAttribute("writerList", writerList);
	 	
	 	HistoryDto historyDto = new HistoryDto();
	 	historyDto.setSpaceKey(spaceKey);
	 	historyDto.setTaskNo(taskNo);
	 	
	 	List<HistoryDto> historyList = historyService.ShowTaskHistory(historyDto);
	 	model.addAttribute("historyList", historyList);

	 	List<UserInfoDto> historyUserList = new ArrayList<>();
	 	for(int i = 0; i < historyList.size(); i++) {
	 		historyUserList.add(loginService.getUserProfile(historyList.get(i).getUserNo()));
	 	}
	 	model.addAttribute("historyUserList", historyUserList);
	 	
	 	model.addAttribute("lowerTaskList", taskService.showLowerTaskList(dto));
	 	
	 	session.setAttribute("spaceKey", spaceKey);
	 	session.setAttribute("userNo", userNo);
	 	return "TaskCard";
	}
	
	@ResponseBody
	@PostMapping("/deleteTask.do")
	public String deleteTask(@RequestParam("taskNo") int taskNo, HttpSession session) {
		 Integer userNo = (Integer) session.getAttribute("userNo");
		 if (userNo == null) {
		     return "fail_login"; // 로그인 세션이 만료된 경우
		 }
		 
		 String spaceKey = (String) session.getAttribute("spaceKey");
		 
		 taskService.deleteTask(spaceKey, taskNo);
		 
		 return "deleted";
	}
	
	@ResponseBody
	@PostMapping("/deleteReply.do")
	public String deleteReply(@RequestParam("replyNo") int replyNo, HttpSession session) {
	    
	    // 1. 세션에서 현재 로그인한 유저 번호 가져오기
	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "fail_login"; // 로그인 세션이 만료된 경우
	    }
	    
	    // 2. XML 쿼리(parameterType="com.team.dto.ReplyListDto")에 맞게 DTO 생성 및 값 세팅
	    ReplyListDto replyDto = new ReplyListDto();
	    replyDto.setReplyNo(replyNo);   // 뷰에서 넘어온 댓글 번호
	    replyDto.setWriterNo(userNo);   // 세션에 있는 로그인 유저 번호 (작성자 본인 검증용)
	    
	    // 3. 서비스 호출 (실제 delete 쿼리 실행)
	    boolean result = replyService.DeleteReply(replyDto); // 파라미터로 DTO 전달
	    
	    if(result) {
	        return "success"; 
	    } else {
	        return "fail_auth"; // 본인이 아니거나 삭제 실패 시
	    }
	}
	
	@ResponseBody
	@PostMapping("/createLowerTask.do")
	public String createLowerTask(@RequestParam("taskTitle") String taskTitle, 
	                              @RequestParam("upperTaskNo") int upperTaskNo, 
	                              HttpSession session) {
	    Integer userNo = (Integer) session.getAttribute("userNo");
	    String spaceKey = (String) session.getAttribute("spaceKey");
	    if (userNo == null) return "fail_login";

	    TaskInfoDto dto = new TaskInfoDto();
	    dto.setSpaceKey(spaceKey);
	    dto.setTaskTitle(taskTitle);
	    dto.setCreatorNo(userNo);
	    dto.setUpperTaskNo(upperTaskNo);
	    dto.setStatusNo(1); // 기본 상태값 설정

	    taskService.createTask(dto);
	    return "success";
	}

	@ResponseBody
	@PostMapping("/writeReply.do")
	public String writeReply(@RequestParam("task_no") int taskNo, 
	                         @RequestParam("reply_content") String replyContent, 
	                         HttpSession session) {
	    Integer userNo = (Integer) session.getAttribute("userNo");
	    String spaceKey = (String) session.getAttribute("spaceKey");
	    if (userNo == null) return "fail_login";

	    ReplyListDto dto = new ReplyListDto();
	    dto.setSpaceKey(spaceKey);
	    dto.setTaskNo(taskNo);
	    dto.setWriterNo(userNo);
	    dto.setReplyContent(replyContent);

	    boolean result = replyService.WriteReply(dto);
	    return result ? "success" : "fail";
	}

	@ResponseBody
	@PostMapping("/updateReply.do")
	public String updateReply(@RequestParam("reply_no") int replyNo, 
	                          @RequestParam("reply_content") String replyContent, 
	                          HttpSession session) {
	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) return "fail_login";

	    ReplyListDto dto = new ReplyListDto();
	    dto.setReplyNo(replyNo);
	    dto.setWriterNo(userNo);
	    dto.setReplyContent(replyContent);

	    boolean result = replyService.UpdateReply(dto);
	    return result ? "success" : "fail_auth";
	}
}