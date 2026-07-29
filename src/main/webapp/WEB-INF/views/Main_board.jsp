<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/Main_board.css'/>"/>

	<meta charset="UTF-8">
	<title>Jira Main Board Page</title>
	<script>
	// 중복 이벤트 정리 후 아래 구조로 통합
	$(function() {
	    // 1. + 버튼 클릭 시 입력창 열기/닫기
	    $("#add-status-container").click(function() {
	        $("#createStasusIpt").toggle();
	    });

	    // 2. 확인 버튼 클릭 시 input 값을 읽어서 Fetch 전송
	    $("#btnCreateStatus").click(function(e) {
	        const statusTitle = $("input[name='statusTitle']").val().trim();
	        const statusColor = $("input[name='statusColor']").val().trim() || "#333333";
	        const statusOrder = $(".status-container").length + 1;

	        if(!statusTitle) {
	            alert("상태 제목을 입력해주세요.");
	            return;
	        }

	        fetch("createStatus.do", {
	            method: "POST",
	            headers: { "Content-Type": "application/x-www-form-urlencoded" },
	            body: "statusTitle=" + encodeURIComponent(statusTitle) + 
	                  "&statusOrder=" + statusOrder + 
	                  "&statusColor=" + encodeURIComponent(statusColor)
	        })
	        .then(response => response.text())
	        .then(result => {
	            const res = result.trim();
	            if(res === "success") {
	                alert("상태가 추가되었습니다.");
	                location.reload();
	            } else if(res === "fail_login") {
	                alert("로그인 정보가 만료되었습니다. 다시 로그인해주세요.");
	                location.href = "<c:url value='/login'/>";
	            } else {
	                alert("상태 추가에 실패했습니다.");
	            }
	        })
	        .catch(error => {
	            console.error("통신 에러:", error);
	            alert("통신 오류가 발생했습니다.");
	        });
	    });
	});
	</script>
	<form>
		<header id="header">
			<div id="title-container">
				<span id="title">스페이스</span>
			</div>
			<div id="space-title-container">
				<span><img src="../resources/img/space_sample.png"></span>
				<span id="space-title">${spaceDto.spaceTitle}</span>
				<button class="button"><img src="../resources/img/add_user.png"></button>
				<button class="button"><img src="../resources/img/more.png"></button>
			</div>
			<div id="menu-container">
				<button type="button" class="menu-button">
					<span><img src="../resources/img/dashboard.png"></span>
					<span>대시보드</span>
				</button>
				
				<button type="button" class="menu-button-on">
					<span><img src="../resources/img/clipboard.png"></span>
					<span>보드</span>
				</button>
			</div>
		</header>
		<main>
			<div id="sorting-container">
				<div id="search-box-container">
					<span>
						<img src="../resources/img/search.png">
						<input id="search-box" type="text" placeholder="보드 검색">
					</span>
				</div>
				<span>
					<button class="user-profile" type="button"><img src="../resources/img/user.png"></button>
				</span>
				<div>
					<select name="group-by" id="group">
						<option value="" disabled selected>그룹</option>
						<option value="none">없음</option>
						<option value="worker">담당자</option>
						<option value="lower-task">하위작업</option>
					</select>
				</div>
			</div>
			<div id="task-container">
				<c:forEach var="statusDto" items="${statusList}" varStatus="status">
				<div class="status-container">
					<div class="status-title-container">
						<span class="status-title">${statusDto.statusTitle}</span>
						<span class="task-cnt">${taskQty[status.index]}</span>
					</div>
					<c:forEach var="taskDto" items="${taskListGroup[status.index]}">
					<div class="task-card-container">
						<button type="button" class="task-card">
							<div class="task-header">
								<span class="task-title">${taskDto.taskTitle}</span>
							</div>
							<div class="task-body">
								<div class="duration">
									<span><img src="../resources/img/calendar.png"></span>
									<span>${taskDto.dueDate}</span>
								</div>
							</div>
							<div class="task-footer">
								<div class="task-id-container">
									<span><img src="../resources/img/check.png"></span>
									<span>${taskDto.spaceKey}-${taskDto.taskNo}</span>
								</div>
								<div class="task-info-container">
									<span><img src=""></span>
									<span><img src="../resources/img/user.png"></span>
								</div>
							</div>
						</button>
					</div>
					</c:forEach>
					<div class="create-task-container">
						<button class="create-task">
							<span>+</span>
							<span>만들기</span>
						</button>
					</div>	
				</div>
				</c:forEach>
				<div id="add-status-container">
					<button type="button" id="add-status">+</button>
				</div>
				<div id="createStasusIpt" style="display: none;">
    				상태 제목:<br/>
    				<input type="text" name="statusTitle" placeholder="제목 입력"/> <br/>
    				상태 색상: <br/>
    				<input type="text" name="statusColor" placeholder="색상 입력"/> <br/>
    				<button type="button" id="btnCreateStatus">확인</button>
				</div>
			</div>
		</main>
	</form>
