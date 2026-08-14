package com.team.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
		// 1. �｡懋ｷｸ�攤 �ｲｴ增ｬ
		Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "redirect:/login";
	    }
	    // 2. �┷��們乱��� �侃寬們擽�侃 墲､ �ｰ���ｸ�丶�ｸｰ
	    String spaceKey = (String) session.getAttribute("spaceKey");
	    if (spaceKey == null) {
	        return "redirect:/space/select";
	    }
	    
	    // 3. �ｳｵ﨑ｩ墲､(spaceKey + taskNo) �｡ｰ�ｱｴ �┷甯�
	 	TaskInfoDto dto = new TaskInfoDto();
	 	dto.setSpaceKey(spaceKey);
	 	dto.setTaskNo(taskNo);
	 	
	 	TaskInfoDto task = taskService.showTask(dto);
	 	if (task == null) {
	 		return "redirect:/board"; // �椈�ｪｻ�頗 ��滝ｷｼ �亨 �ｳｴ�糖�｡� �ｦｬ�共�擽��駕敢
	 	}
	 		
	 	// 4. �兼�ｸ� �｡ｰ巐� �｡ｰ�ｱｴ �┷甯�
	 	ReplyListDto replyDto = new ReplyListDto();
	 	replyDto.setSpaceKey(spaceKey);
	 	replyDto.setTaskNo(taskNo);
	 		
	 	List<ReplyListDto> replyList = replyService.ShowReplyList(replyDto);

	 	// 5. �ｪｨ�査�乱 �魂�擽奓ｰ �橋�ｸｰ
	 	model.addAttribute("dto", task);
	 	model.addAttribute("creatorDto", loginService.getUserProfile(task.getCreatorNo()));
	 	model.addAttribute("replyList", replyList);
	 		
	 	// �兼�ｸ� �梠�┳�梵 �ｪｩ�｡� �ｧ､﨑�
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
	 	
	 	TaskInfoDto ltdto = new TaskInfoDto();
	 	ltdto.setSpaceKey(spaceKey);
	 	ltdto.setUpperTaskNo(taskNo);
	 	List<TaskInfoDto> lowerTaskList = taskService.showLowerTaskList(ltdto);
	 	System.out.println("★ lowerTaskListの件数: " + (lowerTaskList != null ? lowerTaskList.size() : "null"));
	 	model.addAttribute("lowerTaskList", taskService.showLowerTaskList(ltdto));
	 	
	 	session.setAttribute("spaceKey", spaceKey);
	 	session.setAttribute("userNo", userNo);
	 	return "TaskCard";
	}
	
	@ResponseBody
	@PostMapping("/deleteTask.do")
	public String deleteTask(@RequestParam("taskNo") int taskNo, HttpSession session) {
		 Integer userNo = (Integer) session.getAttribute("userNo");
		 if (userNo == null) {
		     return "fail_login"; // �｡懋ｷｸ�攤 �┷��們擽 �ｧ誤｣誤頗 �ｲｽ�垈
		 }
		 
		 String spaceKey = (String) session.getAttribute("spaceKey");
		 
		 taskService.deleteTask(spaceKey, taskNo);
		 
		 return "deleted";
	}
	
	@ResponseBody
	@PostMapping("/deleteReply.do")
	public String deleteReply(@RequestParam("replyNo") int replyNo, HttpSession session) {
	    
	    // 1. �┷��們乱��� 嶸�椪 �｡懋ｷｸ�攤﨑� �悛��� �ｲ逸从 �ｰ���ｸ�丶�ｸｰ
	    Integer userNo = (Integer) session.getAttribute("userNo");
	    if (userNo == null) {
	        return "fail_login"; // �｡懋ｷｸ�攤 �┷��們擽 �ｧ誤｣誤頗 �ｲｽ�垈
	    }

	    // 2. XML �ｿｼ�ｦｬ(parameterType="com.team.dto.ReplyListDto")�乱 �ｧ樓ｲ� DTO ��晧┳ �ｰ� �ｰ� �┷甯�
	    ReplyListDto replyDto = new ReplyListDto();
	    replyDto.setReplyNo(replyNo);   // �ｷｰ�乱��� ��們牟�乖 �兼�ｸ� �ｲ逸从
	    replyDto.setWriterNo(userNo);   // �┷��們乱 �梭�株 �｡懋ｷｸ�攤 �悛��� �ｲ逸从 (�梠�┳�梵 �ｳｸ�攤 �ｲ��ｦ晧圸)

	    // 3. ��罹ｹ�侃 嶸ｸ�ｶ� (�共��� delete �ｿｼ�ｦｬ �共嵂�)
	    boolean result = replyService.DeleteReply(replyDto); // 甯誤攵�ｯｸ奓ｰ�｡� DTO ���峡

	    if(result) {
	        return "success"; 
	    } else {
	        return "fail_auth"; // �ｳｸ�攤�擽 �符�笈�ｱｰ�ｘ �く��� �共甯ｨ �亨
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
	    dto.setStatusNo(1); // �ｸｰ�ｳｸ �メ夋懋ｰ� �└���

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
	
	@ResponseBody
	@PostMapping("/updateExp.do")
	public ResponseEntity<String> updateExp(@RequestBody TaskInfoDto taskDto, HttpSession session) {
		taskDto.setSpaceKey((String)session.getAttribute("spaceKey"));
		try {
			taskService.updateTask(taskDto);
			return ResponseEntity.ok("success");
			
		} catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.ok("fail");
		}
		
	}
	
	@ResponseBody
	@PostMapping("/updateDuedate.do")
	public String updateDuedate(@RequestBody TaskInfoDto taskDto, HttpSession session) {
		taskDto.setSpaceKey((String)session.getAttribute("spaceKey"));
		try {
			taskService.updateTask(taskDto);
			return "success";
		} catch(Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	@ResponseBody
	@PostMapping("/updateTaskStatus.do")
	public String updateTaskStatus(@RequestBody TaskInfoDto taskDto, HttpSession session) {
		taskDto.setSpaceKey((String)session.getAttribute("spaceKey"));
		try {
			taskService.updateTask(taskDto);
			return "success";
		} catch(Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
}