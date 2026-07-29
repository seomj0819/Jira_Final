<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Jira Main Board Page</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/Main_board.css'/>"/>
</head>
<body>
	<form>
		<header id="header">
			<div id="title-container">
				<span id="title">스페이스</span>
			</div>
			<div id="space-title-container">
				<span><img src="../resources/img/space_sample.png"></span>
				<span id="space-title">Project Title</span>
				<button class="button"><img src="../resources/img/add_user.png"></button>
				<button class="button"><img src="../resources/img/more.png"></button>
			</div>
			<div id="menu-container">
				<button class="menu-button">
					<span><img src="../resources/img/dashboard.png"></span>
					<span>대시보드</span>
				</button>
				
				<button class="menu-button-on">
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
									<span><img src="../resources/img/calendar.png"></span>
									<span>YYYY-MM-DD</span>
								</div>
							</div>
							<div class="task-footer">
								<div class="task-id-container">
									<span><img src="../resources/img/check.png"></span>
									<span>TASK NO</span>
								</div>
								<div class="task-info-container">
									<span><img src=""></span>
									<span><img src="../resources/img/user.png"></span>
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
									<span><img src="../resources/img/calendar.png"></span>
									<span>YYYY-MM-DD</span>
								</div>
							</div>
							<div class="task-footer">
								<div class="task-id-container">
									<span><img src="../resources/img/check.png"></span>
									<span>TASK NO</span>
								</div>
								<div class="task-info-container">
									<span><img src="../resources/img/lowerTask.png"></span>
									<span><img src="../resources/img/user.png"></span>
								</div>
							</div>
						</button>
					</div>
					<div class="create-task-container">
						<button class="create-task">
							<span>+</span>
							<span>만들기</span>
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
									<span><img src="../resources/img/calendar.png"></span>
									<span>YYYY-MM-DD</span>
								</div>
							</div>
							<div class="task-footer">
								<div class="task-id-container">
									<span><img src="../resources/img/check.png"></span>
									<span>TASK NO</span>
								</div>
								<div class="task-info-container">
									<span><img src="../resources/img/lowerTask.png"></span>
									<span><img src="../resources/img/user.png"></span>
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
									<span><img src="../resources/img/calendar.png"></span>
									<span>YYYY-MM-DD</span>
								</div>
							</div>
							<div class="task-footer">
								<div class="task-id-container">
									<span><img src="../resources/img/check.png"></span>
									<span>TASK NO</span>
								</div>
								<div class="task-info-container">
									<span><img src=""></span>
									<span><img src="../resources/img/user.png"></span>
								</div>
							</div>
						</button>
					</div>
					<div class="create-task-container">
						<button class="create-task">
							<span>+</span>
							<span>만들기</span>
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
									<span><img src="../resources/img/calendar.png"></span>
									<span>YYYY-MM-DD</span>
								</div>
							</div>
							<div class="task-footer">
								<div class="task-id-container">
									<span><img src="../resources/img/check.png"></span>
									<span>TASK NO</span>
								</div>
								<div class="task-info-container">
									<span><img src="../resources/img/lowerTask.png"></span>
									<span><img src="../resources/img/user.png"></span>
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
									<span><img src="../resources/img/calendar.png"></span>
									<span>YYYY-MM-DD</span>
								</div>
							</div>
							<div class="task-footer">
								<div class="task-id-container">
									<span><img src="../resources/img/check.png"></span>
									<span>TASK NO</span>
								</div>
								<div class="task-info-container">
									<span><img src="../resources/img/lowerTask.png"></span>
									<span><img src="../resources/img/user.png"></span>
								</div>
							</div>
						</button>
					</div>
					<div class="create-task-container">
						<button class="create-task">
							<span>+</span>
							<span>만들기</span>
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