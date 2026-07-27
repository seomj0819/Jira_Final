<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Task Card</title>
	<script src="resources/js/jquery-4.0.0.min.js"></script>
	<style>
		* { box-sizing: border-box; font-family: "Atlassian Sans", ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Ubuntu, "Helvetica Neue", sans-serif;}
		html, body {
			background-color: rgba(110,110,110,0.2);
		 	margin: 0;
		 	height: 100%;
		 	width: 100%;
		 	display: flex;
		 	align-items: center;
		 	justify-content: center;
		}
		.profile {
			height: 24px;
			margin-right: 5px;
			cursor: pointer;
		}
		#taskcard {
			background-color: white;
			opacity: 1.0;
			height: 80%;
			width: 67%;
			border: 1px solid gray;
			border-radius: 6px;
			margin-bottom: 3.4%;
			overflow: auto;
		}
		#header {
			height: 10.4%;
			width: 97%;
			display: flex;
			align-items: center;
			justify-content: space-between;
		}
		#taskId {
			cursor:pointer;
			margin-left: 48px;
		}
		#btns {
			display: flex;
			gap: 5px;
		}
		#btns > div > button {
			background-color: white;
			border: 1px solid gray;
			cursor: pointer;
		}
		#header2 {
			width: 74%;
			height: 8%;
			display: flex;
			align-items: center;
			justify-content: space-between;
		}
		#title {
			margin-left: 43px;
			font-size: 25px;
			font-weight: 600;
		}
		#selectStatus {
			background-color: #f5f5f5;
			width: 106px;
			height: 34px;
			border-radius: 3px;
			font-size: 15px;
			display: flex;
			align-items: center;
			justify-content: center;
			border: 1px solid #f5f5f5;
			padding-left: 4px;
			padding-right: 4px;
		}
		#main {
			width: 98%;
			display: flex;
			justify-content: space-between;
		}
		#main_left {
			width: 63%;
			margin-left: 43px;
		}
		#duedate {
			border: 1px solid white;
			
		}
		#main_right {
			width: 33%;
			height: 60%;
		}
		#explain {
			width: 100%;
			font-weight: 600;
		}
		#inputexp {
			width: 90%;
			height: 32px;
			border: 1px solid white;
		}
		#inputexp:hover {
			background-color: #f5f5f5;
		}
		#lowertask {
			width: 100%;
			font-weight: 600;
		}
		#inputlt {
			width: 90%;
			height: 32px;
			border: 1px solid white;
			cursor:pointer;
		}
		#inputlt:hover {
			background-color: #f5f5f5;
		}
		#task_info {
			width: 100%;
			height: 100%;
		}
		table {
			border-collapse: collapse;
			box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 10px;
			border-radius: 6px;
		}
		table th, table td {
			padding: 15px;
		}
		#footer {
			width: 98%;
			display: flex;
			justify-content: space-between;
		}
		#btnsrh {
			width: 84px;
			display:flex;
			gap: 0px;
			margin-top: 3px;
			border: 1px solid gray;
			box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 10px;
			border-radius: 4px;
		}
		#reply {
			margin-left: 43px;
			width: 63%;
		}
		#replybtn {
			background-color: white;
			border: 1px solid white;
			cursor:pointer;
			color: gray;
		}
		#replybtn:hover {
			background-color: #f5f5f5;
		}
		#replybtn:active {
			background-color: rgb(233, 242, 254);
			color: rgb(24, 104, 219);
			border: 1px solid rgb(24, 104, 219);
		}
		#historybtn {
			background-color: white;
			border: 1px solid white;
			cursor:pointer;
			color: gray;
		}
		#historybtn:hover {
			background-color: #f5f5f5;
		}
		#historybtn:active {
			background-color: rgb(233, 242, 254);
			color: rgb(24, 104, 219);
			border: 1px solid rgb(24, 104, 219);
		}
		#inputreply {
			width: 100%;
			height: 46.5%;
		}
		#replybox {
			min-width: 92%;
			padding-top: 12px;
			padding-bottom: 48px;
			padding-left: 15px;
			border-radius: 4px;
			border: 1px solid gray;
			overflow: auto;
			max-width: 721px;
			max-height: 97px;
			min-height: 100%;
		}
		#summary {
			width: 33%;
		}
		#AIsum {
			width: 100%;
			
		}
		#content {
			width: 100%;
		}
		#aiai {
			min-width: 100%;
			overflow: auto;
			min-height: 125px;
			max-height: 125px;
			max-width: 381px;
		}
		#btns {
			display:flex;
		}
		#replysubmit {
			display: none;
			margin-left: 35px;
			background-color: #1868db;
			color: white;
			border-radius: 3px;
			cursor: pointer;
			padding-top: 5px;
			padding-bottom: 5px;
			padding-left: 12px;
			padding-right: 12px;
			border: 1px solid #1868db;
			font-size: 15px;	
		}
		#replysubmit:hover {
			background-color: #1558bc;
		}
		#cancel {
			display: none;
			background-color: white;
			color: gray;
			border-radius: 3px;
			cursor: pointer;
			padding-top: 5px;
			padding-bottom: 5px;
			padding-left: 12px;
			padding-right: 12px;
			border: 1px solid white;
			font-size: 15px;	
		}
		#cancel:hover {
			background-color: #f5f5f5;
		}
		#replycontentarea {
			width: 63%;
			margin-left: 45px;
			overflow: auto;
		}
		.replyprofile {
			height: 32px;
			margin-right: 16px;
			margin-top: 6px;
			cursor: pointer;
		}
		.writer {
			display: flex;
			margin-bottom: 10px;
		}
		.grayletter {
			color: gray;
		}
		.replycontent {
			margin-left: 35px;
			margin-bottom: 10px;
			padding: 15px;
		}
		#todo:hover {
			background-color:rgb(41, 42, 46);
		}
		#now {
			background-color: rgb(102, 157, 241);
		}
		#now:hover {
			background-color: rgb(102, 157, 241);
		}
		#over {
			background-color: rgb(106, 154, 35);
		}
		#over:hover {
			background-color: rgb(106, 154, 35);
		}
		#expsubmit {
			display: none;
			margin-top: 10px;
			background-color: #1868db;
			color: white;
			border-radius: 3px;
			cursor: pointer;
			padding-top: 5px;
			padding-bottom: 5px;
			padding-left: 12px;
			padding-right: 12px;
			border: 1px solid #1868db;
			font-size: 15px;	
		}
		#expsubmit:hover {
			background-color: #1558bc;
		}
		#expcancel {
			display: none;
			background-color: white;
			color: gray;
			border-radius: 3px;
			cursor: pointer;
			padding-top: 5px;
			padding-bottom: 5px;
			padding-left: 12px;
			padding-right: 12px;
			border: 1px solid white;
			font-size: 15px;	
			margin-top: 10px;
		}
		#expcancel:hover {
			background-color: #f5f5f5;
		}
		#expbtns {
			display: flex;
			gap: 4px;
		}
		#TaskHistory {
			display: none;
		}
		.profile {
			height: 32px;
			margin-right: 12px;
			margin-top: 3px;
			cursor: pointer;
		}
		.header {
			display: flex;
		}
		.history_usernametitle {
			
		}
		.history_date {
			font-size: 12px;
			color: gray;
		}
		.history_detail {
			margin-left: 44px;
		}
	</style>
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
				confirm("테스크를 삭제 하시겠습니까?");
			});
			$("#exitbtn").click(function() {
				$(this).parent().parent().parent().parent().parent().parent().hide();
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
		});
	</script>
</head>
<body id="body">
	<div id="taskcard">
		<div id="header">
			<div id="taskId">
				<img id="taskmark" src="https://koreait.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10318?size=medium"/>
				ABCD-4
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
				작업4
			</div>
			<div id="status">
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
					<br/>
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
				<div id="lowertask">
					하위작업
					<br/>
					<br/>
					<input id="inputlt" type="text" name="inputlt" placeholder="하위작업 추가"/>
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
						<td><img class="profile" src="https://i0.wp.com/avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar-0.png?ssl=1"/>shangus</td>
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
						<div class="history_content">
							<div class="header">
								<div class="pimg">
									<img class="profile" src="https://i0.wp.com/avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar-0.png?ssl=1"/>
								</div>
								<div class="header_content">
									<div class="history_usernametitle"><b>金成官</b> 상태 변경됨</div>
									<div class="history_date">2026년 7월 3일 오후 4:38</div>
								</div>
							</div>
							<br/>
							<div class="history_detail">해야 할 일 → 진행중</div>
							<br/>
						</div>
						<div class="history_content">
							<div class="header">
								<div class="pimg">
									<img class="profile" src="https://i0.wp.com/avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar-0.png?ssl=1"/>
								</div>
								<div class="header_content">
									<div class="history_usernametitle"><b>username1</b> history title1</div>
									<div class="history_date">YYYY년 MM월 DD일 오전/오후 HH:MM</div>
								</div>
							</div>
							<br/>
							<div class="history_detail">history detail1</div>
							<br/>
						</div>
						<div class="history_content">
							<div class="header">
								<div class="pimg">
									<img class="profile" src="https://i0.wp.com/avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar-0.png?ssl=1"/>
								</div>
								<div class="header_content">
									<div class="history_usernametitle"><b>username2</b> history title2</div>
									<div class="history_date">YYYY년 MM월 DD일 오전/오후 HH:MM</div>
								</div>
							</div>
							<br/>
							<div class="history_detail">history detail2</div>
							<br/>
						</div>
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
		<div id="replycontentarea">
			<div class="writer">
				<img class="replyprofile" src="https://i0.wp.com/avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar-0.png?ssl=1"/>
				<div class="replyinfo"><b>username1</b><br/><span class="grayletter">writedate1</span></div>
			</div>
			<div class="replycontent">
				content1
			</div>
			<div class="writer">
				<img class="replyprofile" src="https://i0.wp.com/avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar-0.png?ssl=1"/>
				<div class="replyinfo"><b>Minjea Seo</b><br/><span class="grayletter">2026년 5월 14일</span></div>
			</div>
			<div class="replycontent">
				프로젝트 진행중.
			</div>
			<div class="writer">
				<img class="replyprofile" src="https://i0.wp.com/avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar-0.png?ssl=1"/>
				<div class="replyinfo"><b>username2</b><br/><span class="grayletter">writedate2</span></div>
			</div>
			<div class="replycontent">
				content2
			</div>
			<div class="writer">
				<img class="replyprofile" src="https://i0.wp.com/avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar-0.png?ssl=1"/>
				<div class="replyinfo"><b>username3</b><br/><span class="grayletter">writedate3</span></div>
			</div>
			<div class="replycontent">
				content3
			</div>
		</div>
	</div>
</body>
</html>