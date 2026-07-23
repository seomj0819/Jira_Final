<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Task History</title>
	<script src="js/jquery-4.0.0.min.js"></script>
	<style>
		* { box-sizing: border-box;}
		*{ font-family: "Atlassian Sans", ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Ubuntu, "Helvetica Neue", sans-serif; }
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
</head>
<body>
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
</body>
</html>