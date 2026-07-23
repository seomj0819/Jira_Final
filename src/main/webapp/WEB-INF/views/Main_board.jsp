<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Jira Main Board Page</title>
	</head>
	<style>
		*{ font-family: "Atlassian Sans", ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Ubuntu, "Helvetica Neue", sans-serif; }
		#header {
			border-bottom: 1px solid rgba(11, 18, 14, 0.19);
			padding: 10px;
		}
		#title {
			font-size: 14px;
			color: rgb(107, 110, 118);
		}
		#title-container {
			margin-bottom: 7px;
		}
		#space-title-container > span > img {
			width: 20px;
		}
		#space-title {
			font-size: 20px;
			font-weight: 653;
		}
		.button {
			width: 32px;
			height: 32px;
			border-color: rgba(11, 18, 14, 0.19);
			border-radius: 3px;
		}
		.button > img {
			width: 16px;
			cursor: pointer;
		}
		.menu-button > span > img {
			width: 24px;
			height: 24px;
			margin: 0px 4px -6px 0px;
		}
		.menu-button-on > span > img {
			width: 24px;
			height: 24px;
			margin: 0px 4px -6px 0px;
		}
		#space-title-container {
			margin-bottom: 10px;
		}
		.menu-button {
			border: none;
			cursor: pointer;
			margin-right: 10px;
			height: 43px;
			width: 100px;
			background-color: transparent;
		}
		.menu-button-on {
			border: none;
			cursor: pointer;
			margin-right: 10px;
			color: rgb(24, 104, 219);
			border-bottom: 2px solid rgb(24, 104, 219);
			height: 43px;
			width: 100px;
			filter: invert(34%) sepia(83%) saturate(1091%) hue-rotate(192deg) brightness(87%) contrast(109%);
			background-color: transparent;
		}
		#search-box-container > span > img {
			width: 18px;
			margin-left: 5px;
			margin-bottom: -4px;
		}
		#search-box {
			border: none;
			width: 132px;
			height: 28px;
			outline: none;
		}
		#search-box-container {
			border: 1px solid rgba(11, 18, 14, 0.19);
			width: 165px;
			height: 30px;
			align-content: center;
			border-radius: 3px;
		}
		#sorting-container {
			padding: 20px;
			display: flex;
		}
		.user-profile > img {
			width: 30px;
		}
		.user-profile {
			border: none;
			background-color: transparent;
			cursor: pointer;
			padding: 0px 14px;
		}
		#menu-container {
			height: 32px;
		}
		#group {
			border: 1px solid rgba(11, 18, 14, 0.19);
			width: 65px;
			height: 32px;
			border-radius: 3px;
			text-align: center;
			font-size: 14px;
			padding: 0px 10px;
			cursor: pointer;
		}
		#sorting-container > div:last-child {
	    	margin-left: auto;
		}
		.status-container {
			border-radius: 6px;
			background-color: rgba(5, 21, 36, 0.08);
			height: fit-content;
		}
		#task-container {
			display: flex;
			gap: 7px;
		}
		.status-title-container {
			width: 270px;
			height: 48px;
			cursor: grab;
			align-content: center;
		}
		.status-title {
			margin-left: 15px;
		}
		.task-card-container {
			border-radius: 4px;
			margin-top: 2px;
			width: 260px;
			height: 84px;
			justify-self: center;
			margin-bottom: 2px;
		}
		.task-card {
			width: 100%;
			height: 100%;
			border: none;
			border-radius: 4px;
			box-shadow: rgba(30, 31, 33, 0.25) 0px 1px 1px 0px, rgba(30, 31, 33, 0.31) 0px 0px 1px 0px;
			cursor: pointer;
			border-color: rgb(41, 42, 46);
		}
		.create-task-container {
			width: 100%;
			height: 40px;
			border-radius: 3px;
			margin-top: 10px;
		}
		.create-task-container:hover {
			background-color: rgba(5, 21, 36, 0.06);
		}
		.create-task {
			border: none;
			background-color: transparent;
			cursor: pointer;
			width: 100%;
			height: fit-content;
			text-align: left;
			margin: 6px 0px 0px;
			padding: 8px 12px;
		}
		.task-cnt {
			background-color: rgba(5, 21, 36, 0.08);
			border-radius: 4px;
			text-align: center;
		}
		.task-title {
			font-size: 14px;
		}
		.task-header {
			height: 16px;
			display: flex;
			padding: 5px;
		}
		.duration > span > img{
			width: 16px;
			margin-bottom: -3px;
		}
		.duration {
			border: 1px solid rgba(11, 18, 14, 0.19);
			border-radius: 4px;
			width: fit-content;
	   	 	padding: 2px 6px;
		}
		.task-id-container > span > img {
			width: 18px;
			margin-bottom: -4px;
		}
		.task-info-container > span > img {
			width: 20px;
		}
		.task-footer {
			display: flex;
			justify-content: space-between;
			padding: 5px;
		}
		.task-body {
			padding: 0px 5px;
		}
		.task-id-container {
			margin-top: 5px;
		}
		#add-status {
			border: 1px solid rgba(11, 18, 14, 0.14);
			border-radius: 8px;
			width: 40px;
			height: 40px;
			cursor: pointer;
			display: flex;
			font-size: 32px;
			color: rgb(80, 82, 88);
			font-weight: 400;
			align-items: center;
	    	justify-content: center;
	    	padding-bottom: 9px;
		}
		#add-status:hover {
			background-color: rgba(5, 21, 36, 0.10);
		}
		.task-card-container > button:hover {
			background-color: rgba(5, 21, 36, 0.10);
		}
		.status-title:hover {
			background-color: rgba(5, 21, 36, 0.10);
		}
	</style>
<body>
	<form>
		<header id="header">
			<div id="title-container">
				<span id="title">ì¤íì´ì¤</span>
			</div>
			<div id="space-title-container">
				<span><img src="img/space_sample.png"></span>
				<span id="space-title">Project Title</span>
				<button class="button"><img src="img/add_user.png"></button>
				<button class="button"><img src="img/more.png"></button>
			</div>
			<div id="menu-container">
				<button class="menu-button">
					<span><img src="img/dashboard.png"></span>
					<span>ëìë³´ë</span>
				</button>
				
				<button class="menu-button-on">
					<span><img src="img/clipboard.png"></span>
					<span>ë³´ë</span>
				</button>
			</div>
		</header>
		<main>
			<div id="sorting-container">
				<div id="search-box-container">
					<span>
						<img src="img/search.png">
						<input id="search-box" type="text" placeholder="ë³´ë ê²ì">
					</span>
				</div>
				<span>
					<button class="user-profile" type="button"><img src="img/user.png"></button>
				</span>
				<div>
					<select name="group-by" id="group">
						<option value="" disabled selected>ê·¸ë£¹</option>
						<option value="none">ìì</option>
						<option value="worker">ë´ë¹ì</option>
						<option value="lower-task">íììì</option>
					</select>
				</div>
			</div>
			<div id="task-container">
				<div class="status-container">
					<div class="status-title-container">
						<span class="status-title">status</span>
						<span class="task-cnt">cnt</span>
					</div>
					<div class="task-card-container">
						<button type="button" class="task-card">
							<div class="task-header">
								<span class="task-title">TASK TITLE</span>
							</div>
							<div class="task-body">
								<div class="duration">
									<span><img src="img/calendar.png"></span>
									<span>YYYY-MM-DD</span>
								</div>
							</div>
							<div class="task-footer">
								<div class="task-id-container">
									<span><img src="img/check.png"></span>
									<span>TASK NO</span>
								</div>
								<div class="task-info-container">
									<span><img src=""></span>
									<span><img src="img/user.png"></span>
								</div>
							</div>
						</button>
					</div>
					<div class="task-card-container">
						<button type="button" class="task-card">
							<div class="task-header">
								<span class="task-title">TASK TITLE</span>
							</div>
							<div class="task-body">
								<div class="duration">
									<span><img src="img/calendar.png"></span>
									<span>YYYY-MM-DD</span>
								</div>
							</div>
							<div class="task-footer">
								<div class="task-id-container">
									<span><img src="img/check.png"></span>
									<span>TASK NO</span>
								</div>
								<div class="task-info-container">
									<span><img src="img/lowerTask.png"></span>
									<span><img src="img/user.png"></span>
								</div>
							</div>
						</button>
					</div>
					<div class="create-task-container">
						<button class="create-task">
							<span>+</span>
							<span>ë§ë¤ê¸°</span>
						</button>
					</div>
				</div>
				<div class="status-container">
					<div class="status-title-container">
						<span class="status-title">status</span>
						<span class="task-cnt">cnt</span>
					</div>
					<div class="task-card-container">
						<button type="button" class="task-card">
							<div class="task-header">
								<span class="task-title">TASK TITLE</span>
							</div>
							<div class="task-body">
								<div class="duration">
									<span><img src="img/calendar.png"></span>
									<span>YYYY-MM-DD</span>
								</div>
							</div>
							<div class="task-footer">
								<div class="task-id-container">
									<span><img src="img/check.png"></span>
									<span>TASK NO</span>
								</div>
								<div class="task-info-container">
									<span><img src="img/lowerTask.png"></span>
									<span><img src="img/user.png"></span>
								</div>
							</div>
						</button>
					</div>
					<div class="task-card-container">
						<button type="button" class="task-card">
							<div class="task-header">
								<span class="task-title">TASK TITLE</span>
							</div>
							<div class="task-body">
								<div class="duration">
									<span><img src="img/calendar.png"></span>
									<span>YYYY-MM-DD</span>
								</div>
							</div>
							<div class="task-footer">
								<div class="task-id-container">
									<span><img src="img/check.png"></span>
									<span>TASK NO</span>
								</div>
								<div class="task-info-container">
									<span><img src=""></span>
									<span><img src="img/user.png"></span>
								</div>
							</div>
						</button>
					</div>
					<div class="create-task-container">
						<button class="create-task">
							<span>+</span>
							<span>ë§ë¤ê¸°</span>
						</button>
					</div>
				</div>
				<div class="status-container">
					<div class="status-title-container">
						<span class="status-title">status</span>
						<span class="task-cnt">cnt</span>
					</div>
					<div class="task-card-container">
						<button type="button" class="task-card">
							<div class="task-header">
								<span class="task-title">TASK TITLE</span>
							</div>
							<div class="task-body">
								<div class="duration">
									<span><img src="img/calendar.png"></span>
									<span>YYYY-MM-DD</span>
								</div>
							</div>
							<div class="task-footer">
								<div class="task-id-container">
									<span><img src="img/check.png"></span>
									<span>TASK NO</span>
								</div>
								<div class="task-info-container">
									<span><img src="img/lowerTask.png"></span>
									<span><img src="img/user.png"></span>
								</div>
							</div>
						</button>
					</div>
					<div class="task-card-container">
						<button type="button" class="task-card">
							<div class="task-header">
								<span class="task-title">TASK TITLE</span>
							</div>
							<div class="task-body">
								<div class="duration">
									<span><img src="img/calendar.png"></span>
									<span>YYYY-MM-DD</span>
								</div>
							</div>
							<div class="task-footer">
								<div class="task-id-container">
									<span><img src="img/check.png"></span>
									<span>TASK NO</span>
								</div>
								<div class="task-info-container">
									<span><img src="img/lowerTask.png"></span>
									<span><img src="img/user.png"></span>
								</div>
							</div>
						</button>
					</div>
					<div class="create-task-container">
						<button class="create-task">
							<span>+</span>
							<span>ë§ë¤ê¸°</span>
						</button>
					</div>
				</div>
				<div id="add-status-container">
					<button type="button" id="add-status">+</button>
				</div>
			</div>
		</main>
	</form>
</body>
</html>