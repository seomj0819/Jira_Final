<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/Main_board.css'/>"/>

	<meta charset="UTF-8">
	<title>Jira Main Board Page</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
	<script>
	$(function() {
	    // 1. + 버튼 클릭 시 입력창 열기/닫기
	    $("#add-status-container").click(function() {
	        $("#createStasusIpt").toggle();
	    });
	    
	    // 1.5 색상 선택 시
	    $(".selectStatusColor").click(function() {
	        $(".selectStatusColor").css("border", "none").removeClass("active");
	        $(this).css("border", "2px solid black").addClass("active");
	    });
	    
	    // 2. 상태 생성 버튼 클릭
	    $("#btnCreateStatus").click(function(e) {
	        const statusTitle = $("input[name='statusTitle']").val().trim();
	        const statusColor = $(".selectStatusColor.active").val();
	        const statusOrder = $(".status-container").length + 1;
	        
	        if(!statusTitle) {
	            alert("상태 제목을 입력해주세요.");
	            return;
	        }
	        if(!statusColor) {
	            alert("상태 색상을 선택해주세요.");
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
	    
	    // 3. 태스크 카드 클릭 시 이동 (드래그 중 클릭 방지 처리 포함)
	    let isDragging = false;
	    
	    $(".task-card-container").click(function(e) {
	        if (isDragging) return; // 드래그 중이었다면 클릭 이동 방지
	        
	        var taskId = $(this).find(".showTaskId").text().trim();
	        var taskNo = taskId.split("-")[1];
	        
	        location.href = "/taskCard?taskNo=" + taskNo;
	    });
	    
	    // 4. 태스크 생성 폼 토글 및 작성
	    $(".create-task").click(function() {
	        $(this).parent().parent().find(".create-task-form").toggle();
	    });
	    
	    $(".createTaskBtn").click(async function() {
	        const newTitle = $(this).parent().find(".newTitle").val().trim();
	        const statusOrder = $(this).closest(".create-task-form").data("statusorder");
	        var spaceKey = $("#title-container").data("spacekey");
	        
	        if(newTitle === "") {
	            alert("제목을 입력하세요");
	            $(this).parent().find(".newTitle").focus();
	            return;
	        }
	        
	        try {
	            const reqData = {"taskTitle": newTitle, "statusNo": statusOrder};
	            
	            const response = await fetch("<c:url value='/space/createTask.do'/>", {
	                method: "POST",
	                headers: { "Content-Type": "application/json" },
	                body: JSON.stringify(reqData)
	            });
	            const resp = await response.text();
	            if(resp.trim() === "success") {
	                alert("태스크 생성됨");
	                $(this).parent().find(".newTitle").val("");
	                location.href = "/space/enter?spaceKey=" + spaceKey;
	            } else {
	                alert("등록 실패");
	            }
	        } catch(error) {
	            console.error("error", error);
	        }
	    });

	    // =========================================================
	    // 5. 드래그 앤 드롭 (Drag & Drop) 설정
	    // =========================================================

	    // 카드를 드래그 가능하게 설정
	 // [수정 후] 기존 드래그/드롭 코드를 아래로 대체
	    $(".task-card-container").draggable({
	        revert: "invalid",
	        helper: "clone", // 드래그 시 분신을 만들어 부드럽게 이동
	        appendTo: "body",
	        cursor: "move",
	        start: function() {
	            isDragging = true;
	        },
	        stop: function() {
	            setTimeout(function() { isDragging = false; }, 100);
	        }
	    });

	    $(".status-container").droppable({
	        accept: ".task-card-container",
	        hoverClass: "ui-state-hover",
	        drop: async function(event, ui) {
	            const $droppedCard = ui.draggable;
	            const taskId = $droppedCard.find(".showTaskId").text().trim();
	            const taskNo = taskId.split("-")[1];
	            
	            const targetStatusNo = $(this).find(".create-task-form").data("statusorder");
	            const spaceKey = $("#title-container").data("spacekey");

	            // 이동한 카드를 현재 컬럼으로 이동
	            $droppedCard.insertBefore($(this).find(".create-task-container"));

	            // 서버 전송
	            try {
	                const reqData = {
	                    "taskNo": taskNo,
	                    "spaceKey": spaceKey,
	                    "statusNo": targetStatusNo
	                };
	                
	                const response = await fetch("<c:url value='/updateTaskStatus.do'/>", {
	                    method: "POST",
	                    headers: { "Content-Type": "application/json" },
	                    body: JSON.stringify(reqData)
	                });
	                
	                const result = await response.text();
	                if(result.trim() === "success") {
	                    location.reload();
	                } else {
	                    alert("상태 변경 실패");
	                    location.reload();
	                }
	            } catch(error) {
	                console.error("드롭 통신 에러:", error);
	                alert("상태 업데이트 중 오류가 발생했습니다.");
	                location.reload();
	            }
	        }
	    });
	});
	    </script>
	<form>
		<header id="header">
			<div id="title-container" data-spacekey="${spaceDto.spaceKey}">
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
						<div class="task-card">
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
									<span class="showTaskId">${taskDto.spaceKey}-${taskDto.taskNo}</span>
								</div>
								<div class="task-info-container">
									<span><img src=""></span>
									<span><img src="../resources/img/user.png"></span>
								</div>
							</div>
						</div>>
					</div>
					</c:forEach>
					<div class="create-task-container">
						<button type="button" class="create-task">
							<span>+</span>
							<span>만들기</span>
						</button>
					</div>
					<div class="create-task-form" data-statusorder="${status.count}">
						<label for="newTitle">제목:</label>
						<input type="text" name="newTitle" class="newTitle" placeholder="작업의 제목을 입력"/>
						<button type="button" class="createTaskBtn">확인</button>
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
    				<c:forEach var="colorDto" items="${colorList}">
    					<button type="button" class="selectStatusColor" value="${colorDto.colorName}" style="background-color: ${colorDto.colorCode}; width: 15px; height: 15px; border: none; cursor: pointer"></button>
    				</c:forEach> <br/>
    				<button type="button" id="btnCreateStatus">확인</button>
				</div>
			</div>
		</main>
	</form>
