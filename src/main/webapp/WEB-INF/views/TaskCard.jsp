<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Task Card</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/TaskCard.css'/>"/>
	<script src="resources/js/jquery-4.0.0.min.js"></script>
	<script>
		$(function() {
			$("#replybox").click(function() {
				$("#replysubmit").show();
				$("#cancel").show();
			});
			$("#cancel").click(function() {
				$("#replysubmit").hide();
				$("#cancel").hide();
				$(this).parent().parent().find("#inputreply").find("#replybox").val("");
			});
			$("#inputexp").click(function() {
				$("#expsubmit").show();
				$("#expcancel").show();
			});
			$("#expcancel").click(function() {
				$("#expsubmit").hide();
				$("#expcancel").hide();
				$(this).parent().parent().find("#inputexp").val("");
			});
			$("#deletebtn").click(function() {
				if(confirm("테스크를 삭제 하시겠습니까?")) {
					// 1. 현재 주소의 파라미터 분석 객체 생성
					var urlParams = new URLSearchParams(window.location.search);

					// 2. 원하는 파라미터 명으로 값 읽기 (.get() 사용)
					var taskNo = urlParams.get("taskNo");
					var spaceKey = "${sessionScope.spaceKey}";
					 fetch("deleteTask.do", {
				            method: "POST",
				            headers: {
				                "Content-Type": "application/x-www-form-urlencoded",
				            },
				            body: "taskNo=" + taskNo
				        })
				        .then(response => response.text())
				        .then(result => {
				            const res = result.trim();
				            if(res === "deleted") {
				            	alert("삭제되었습니다!");
				            	// 세션에서 가져온 spaceKey를 쿼리스트링에 붙여서 이동.
				                if(spaceKey) {
				                    location.href = "<c:url value='/space/enter'/>?spaceKey=" + encodeURIComponent(spaceKey);
				                } else {
				                    location.href = "<c:url value='/space/select'/>";
				                }

				            }  else if(res === "fail_login") {
				                alert("로그인 정보가 만료되었습니다. 다시 로그인해주세요.");
				                location.href = "login";
				            } else {
				                alert("테스크 삭제에 실패했습니다.");
				            }
				        })
				        .catch(error => {
				            console.error("통신 에러:", error);
				            alert("통신 오류가 발생했습니다.");
				        });
				}
			});
			$("#exitbtn").click(function() {
				$(this).parent().parent().parent().parent().parent().parent().hide();
				history.back();
			});
			$("#historybtn").click(function() {
				$(this).parent().parent().find("#inputreply").css("display", "none");
				$(this).parent().parent().find("#btns").css("display", "none");
				$(this).parent().parent().parent().parent().find("#replycontentarea").css("display", "none");
				$(this).parent().parent().find("#TaskHistory").css("display", "block");
			});
			$("#replybtn").click(function() {
				$(this).parent().parent().find("#inputreply").show();
				$(this).parent().parent().find("#btns").show();
				$(this).parent().parent().parent().parent().find("#replycontentarea").show();
				$(this).parent().parent().find("#TaskHistory").css("display", "none");
			});
			$(".replycontent").hover(function() {
				$(this).find(".deleteReply").toggle();
			});
			$(".deleteReply").click(function() {
			    if(confirm("댓글이 삭제 됩니다.")) {
			        const $contentDiv = $(this).parent(); 
			        const replyNo = $contentDiv.data("rno"); 
			        const $writerDiv = $contentDiv.prev(".writer"); 

			        // 서버 통신 (Fetch API)
			        fetch("deleteReply.do", {
			            method: "POST",
			            headers: {
			                "Content-Type": "application/x-www-form-urlencoded",
			            },
			            body: "replyNo=" + replyNo // 댓글 번호만 전송 (로그인 유저는 서버 세션에서 처리)
			        })
			        .then(response => response.text())
			        .then(result => {
			            const res = result.trim();
			            if(res === "success") {
			                // 본인 글이 맞아서 정상 삭제된 경우
			                $writerDiv.fadeOut(200, function() { $(this).remove(); });
			                $contentDiv.fadeOut(200, function() { $(this).remove(); });
			            } else if(res === "fail_auth") {
			                alert("본인이 작성한 댓글만 삭제할 수 있습니다.");
			            } else if(res === "fail_login") {
			                alert("로그인 정보가 만료되었습니다. 다시 로그인해주세요.");
			                location.href = "login";
			            } else {
			                alert("댓글 삭제에 실패했습니다.");
			            }
			        })
			        .catch(error => {
			            console.error("통신 에러:", error);
			            alert("통신 오류가 발생했습니다.");
			        });
			    }
			});
			
			    // 하위작업 인풋 클릭 시 저장/취소 버튼 노출 (설명 편집과 동일한 방식)
			    $("#inputlt").click(function() {
			        $("#ltsubmit").show();
			        $("#ltcancel").show();
			    });
			    
			    // 취소 버튼 클릭 시 숨김 및 초기화
			    $("#ltcancel").click(function() {
			        $("#ltsubmit").hide();
			        $("#ltcancel").hide();
			        $(this).parent().parent().find("#inputlt").val("");
			    });

			    // 기존 설명 편집 이벤트
			    $("#inputexp").click(function() {
			        $("#expsubmit").show();
			        $("#expcancel").show();
			    });
			    $("#expcancel").click(function() {
			        $("#expsubmit").hide();
			        $("#expcancel").hide();
			        $(this).parent().parent().find("#inputexp").val("");
			    });

			    //  하위작업 등록 (DB 연동)
			    $("#ltsubmit").click(function() {
			        var ltContent = $("#inputlt").val();
			        var urlParams = new URLSearchParams(window.location.search);
			        var taskNo = urlParams.get("taskNo");
					var lowertask = $("#lowertask").html();
			        
			        if(!ltContent.trim()) {
			            alert("하위작업 내용을 입력해주세요.");
			            return;
			        }

			        fetch("createLowerTask.do", {
			            method: "POST",
			            headers: { "Content-Type": "application/x-www-form-urlencoded" },
			            body: "taskTitle=" + encodeURIComponent(ltContent) + "&upperTaskNo=" + taskNo
			        })
			        .then(response => response.text())
			        .then(result => {
			            if(result.trim() === "success") {
			                alert("하위작업이 등록되었습니다!");
			                location.reload();
			                
			            } else {
			                alert("하위작업 등록에 실패했습니다.");
			            }
			        });
			    });

			    //  댓글 등록 (DB 연동)
			    $("#replysubmit").click(function() {
			        var replyContent = $("#replybox").val();
			        var urlParams = new URLSearchParams(window.location.search);
			        var taskNo = urlParams.get("taskNo");

			        if(!replyContent.trim()) {
			            alert("댓글 내용을 입력해주세요.");
			            return;
			        }

			        fetch("writeReply.do", {
			            method: "POST",
			            headers: { "Content-Type": "application/x-www-form-urlencoded" },
			            body: "task_no=" + taskNo + "&reply_content=" + encodeURIComponent(replyContent)
			        })
			        .then(response => response.text())
			        .then(result => {
			            if(result.trim() === "success") {
			                location.reload();
			            } else {
			                alert("댓글 등록에 실패했습니다.");
			            }
			        });
			    });

			    //  댓글 ... 메뉴 토글
			    $(document).on("click", ".menu-btn", function(e) {
			        e.stopPropagation();
			        $(".menu-dropdown").not($(this).next(".menu-dropdown")).hide();
			        $(this).next(".menu-dropdown").toggle();
			    });
			    $(document).click(function() {
			        $(".menu-dropdown").hide();
			    });

			    //  댓글 수정 모드 전환
			    $(document).on("click", ".editReplyBtn", function() {
			        const $item = $(this).closest(".reply-item");
			        $item.find(".text-content").hide();
			        $item.find(".edit-reply-box, .edit-btns").show();
			        $(".menu-dropdown").hide();
			    });

			    //  댓글 수정 취소
			    $(document).on("click", ".editCancelBtn", function() {
			        const $item = $(this).closest(".reply-item");
			        $item.find(".text-content").show();
			        $item.find(".edit-reply-box, .edit-btns").hide();
			    });

			    //  댓글 수정 저장 (DB 연동)
			    $(document).on("click", ".editSaveBtn", function() {
			        const $item = $(this).closest(".reply-item");
			        const replyNo = $item.data("rno");
			        const newContent = $item.find(".edit-reply-box").val();

			        if(!newContent.trim()) {
			            alert("댓글 내용을 입력해주세요.");
			            return;
			        }

			        fetch("updateReply.do", {
			            method: "POST",
			            headers: { "Content-Type": "application/x-www-form-urlencoded" },
			            body: "reply_no=" + replyNo + "&reply_content=" + encodeURIComponent(newContent)
			        })
			        .then(response => response.text())
			        .then(result => {
			            if(result.trim() === "success") {
			                alert("댓글이 수정되었습니다.");
			                location.reload();
			            } else if(result.trim() === "fail_auth") {
			                alert("본인이 작성한 댓글만 수정할 수 있습니다.");
			            } else {
			                alert("댓글 수정에 실패했습니다.");
			            }
			        });
			    });


			    $(document).on("click", ".deleteReplyBtn", function() {
			        const $item = $(this).closest(".reply-item");
			        const replyNo = $item.data("rno");

			        if(confirm("댓글을 삭제하시겠습니까?")) {
			            fetch("deleteReply.do", {
			                method: "POST",
			                headers: { "Content-Type": "application/x-www-form-urlencoded" },
			                body: "replyNo=" + replyNo
			            })
			            .then(response => response.text())
			            .then(result => {
			                if(result.trim() === "success") {
			                    alert("삭제되었습니다.");
			                    location.reload();
			                } else if(result.trim() === "fail_auth") {
			                    alert("본인이 작성한 댓글만 삭제할 수 있습니다.");
			                } else {
			                    alert("댓글 삭제에 실패했습니다.");
			                }
			            });
			        }
			    });
			    
			    $("#expsubmit").click(async function() {
			    	
			    	const $btn = $(this);
			        const $parent = $btn.parent().parent();
			        
			    	// 1. 현재 주소의 파라미터 분석 객체 생성
					var urlParams = new URLSearchParams(window.location.search);

					// 2. 원하는 파라미터 명으로 값 읽기 (.get() 사용)
					var taskNo = urlParams.get("taskNo");
					var spaceKey = "${sessionScope.spaceKey}";
					const $exp = $parent.find("#inputexp").val().trim();
			    	
			    	if(!$exp) {	//$exp===""
			    		alert("설명을 입력하세요.");
			    		$parent.find("#inputexp").focus();
			    		return;
			    	}
			    	
			    	try {
			    		const reqData = { "taskNo" : taskNo, "spaceKey" : spaceKey, "taskDescription" : $exp };
			    		
			    		const response = await fetch("<c:url value='/updateExp.do'/>", {
			    			method:"POST",
			    			headers: {
			    				"Content-Type":"application/json",
			    			},
			    			body:JSON.stringify(reqData)
			    		});
			    		
			    		if(!response.ok) {
			    			alert("Error!!");
			    			return;
			    		}
			    		
			    		const result = await response.text();
			    		const res = result.trim();
			    		console.log("【取得した値】:", JSON.stringify(res));
			    		if(res === "success") {
			    			alert("설명이 등록되었습니다.");
			    			$parent.find("#inputexp").val("");
			    			
			    			const newExp = $("<div>", {
			    				class: "task-exp",
			    				text: $exp
			    			});
			    			
			    			$parent.find("#expArea").empty().append(newExp);
			    			
			    		} else {
			    			alert("설명 등록 실패.");
			    			return;
			    		}
			    	} catch(error) {
			    		console.error("error", error);
			    		alert("오류 발생");
			    	}  
			    	
			    });
		});
	</script>
</head>
<body id="body">
	<div id="taskcard">
		<div id="header">
			<div id="taskId">
				<img id="taskmark" src="https://koreait.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10318?size=medium"/>
				${dto.getSpaceKey()}-${dto.getTaskNo()}
			</div>
			<div id="btns">
				<div id="delete">
					<button id="deletebtn">
						삭제
					</button>
				</div>
				<div id="exit">
					<button id="exitbtn">
						X
					</button>
				</div>
			</div>
		</div>
		<div id="header2">
			<div id="title">
				${dto.getTaskTitle()}
			</div>
			<div id="status" data-statusNo="${dto.getStatusNo()}">
				<select id="selectStatus">
					<option id="todo" value="todo" selected>해야 할 일</option>
					<option id="now" value="now">진행중</option>
					<option id="over" value="over">완료	</option>	<!-- 테스크 해당 스테이터스에 selected -->
				</select> 
			</div>
		</div>
		<div id="main">
			<div id="main_left">
				<div id="explain">
					설명
					<br/>
					<div id="expArea">${dto.taskDescription}</div>
					<input id="inputexp" type="text" name="inputExp" placeholder="설명 편집"/>
					<div id="expbtns">
						<button id="expsubmit">저장</button>
						<button id="expcancel">취소</button>
					</div>
				</div>
				<br/>
				<br/>
				<br/>
				<br/>
				<!-- 하위작업 영역 -->
				<div id="lowertask">
				    하위작업
				    <br/><br/>
				    <div class="lowerTaskCard">
				    	<table>
				    		<c:forEach var="lowerTaskDto" items="${lowerTaskList}">
				    			<tr>
				    				<td>${lowerTaskDto.spaceKey}-${lowerTaskDto.taskNo}</td>
				    				<td>${lowerTaskDto.taskTitle}</td>
				    			</tr>
				    		</c:forEach>
				    	</table>
				    </div>
				    <input id="inputlt" type="text" name="inputlt" placeholder="하위작업 추가"/>
				    <div id="ltbtns">
				        <button id="ltsubmit">저장</button>
				        <button id="ltcancel">취소</button>
				    </div>
				</div>
			</div>
			<div id="main_right">
				<table id="task_info">
					<tr>
						<th>V 세부사항</th>
						<th></th>
					</tr>
					<tr>
						<td>담당자</td>
						<td><img class="profile" src="https://i0.wp.com/avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar-0.png?ssl=1"/>할당되지 않음</td>
					</tr>
					<tr>
						<td>레이블</td>
						<td>없음</td>
					</tr>
					<tr>
						<td>상위항목</td>
						<td>없음</td>
					</tr>
					<tr>
						<td>기한</td>
						<td><input id="duedate" type="date" name="dueDate" value=""/></td>
					</tr>
					<tr>
						<td>우선 순위</td>
						<td>Medium</td>
					</tr>
					<tr>
						<td>보고자</td>
						<td><img class="profile" src="https://i0.wp.com/avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar-0.png?ssl=1"/>${creatorDto.getUserName()}</td>
					</tr>
				</table>
			</div>
		</div>
		<br/>
		<div id="footer">
			<div id="reply">
				활동
				<br/>
				<div id="btnsrh">
					<button id="replybtn">댓글</button>
					<button id="historybtn">기록</button>
				</div>
				<br/>
				<div id="inputreply">
					<img class="profile" src="https://i0.wp.com/avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar-0.png?ssl=1"/>
					<textarea id="replybox" name="replyContent" placeholder="댓글 추가..."></textarea>
				</div>
				<div id="TaskHistory">
					<div id="task_history">
						<c:forEach var="historyDto" items="${historyList}" varStatus="historyStatus">
						<div class="history_content">
							<div class="header">
								<div class="pimg">
									<img class="profile" src="https://i0.wp.com/avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar-0.png?ssl=1"/>
								</div>
								<div class="header_content">
									<div class="history_usernametitle">
									    <b>${historyUserList[historyStatus.index].userName}</b>
									    ${historyDto.fieldName}, ${historyDto.actionType}
									</div>
									<div class="history_date">${historyDto.createdAt}</div>
								</div>
							</div>
							<br/>
							<div class="history_detail">${historyDto.oldValue} -> ${historyDto.newValue}</div>
							<br/>
						</div>
						</c:forEach>
					</div>
				</div>
				<div id="btns">
					<button id="replysubmit">저장</button>
					<button id="cancel">취소</button>
				</div>
			</div>
			<div id="summary">
				<table id="AIsum">
					<tr>
						<th>댓글 요약</th>
					</tr>
					<tr>
						<td id="content"><textarea id="aiai" name="aiAi" readonly>(AISum)</textarea></td>
					</tr>
				</table>
			</div>
		</div>

<!-- 댓글 리스트 영역 -->
<div id="replycontentarea">
    <c:forEach var="replyDto" items="${replyList}" varStatus="status">
    <div class="reply-item" data-rno="${replyDto.replyNo}">
        <div class="writer">
            <div style="display:flex; align-items:center;">
                <img class="replyprofile" src="https://i0.wp.com/avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar-0.png?ssl=1"/>
                <div class="replyinfo"><b>${writerList[status.index].userName}</b><br/><span class="grayletter">${replyDto.createdAt}</span></div>
            </div>
            
            <div class="reply-menu-wrap">
                <button class="menu-btn">...</button>
                <div class="menu-dropdown">
                    <button class="editReplyBtn">수정</button>
                    <button class="deleteReplyBtn">삭제</button>
                </div>
            </div>
        </div>
        <div class="replycontent">
            <span class="text-content">${replyDto.replyContent}</span>
            
            <textarea class="edit-reply-box" style="display:none; width:100%; min-height:60px;">${replyDto.replyContent}</textarea>
            <div class="edit-btns" style="display:none; margin-top:5px;">
                <button class="editSaveBtn" style="background:#1868db; color:white; border:none; padding:4px 10px; border-radius:3px; cursor:pointer;">저장</button>
                <button class="editCancelBtn" style="background:white; color:gray; border:1px solid #ccc; padding:4px 10px; border-radius:3px; cursor:pointer;">취소</button>
            </div>
        </div>
    </div>
    </c:forEach>
</div>
	</div>
</body>
</html>