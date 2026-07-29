<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Jira Main_assigned Page</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/Main_assigned.css'/>"/>
</head>
<body>
	<div id="main">
		<div id="space-list">
			<div class="header-row">
				<span class="title">추천 스페이스</span>
				<a class="content">모든 스페이스 보기</a>
			</div>
			<div id="body-row">
				<div id="space-card-list">
					<c:forEach var="space" items="${spaceList}">
						<form action="<c:url value='/space/enter'/>" method="post">
							<input type="hidden" name="spaceKey" value="${space.spaceKey}">
     							<button type="submit" class="space-card" style="background:none;">
     								<img src="<c:url value='../resources/img/space_sample.png'/>">
       							<div class="space-title-container">
       								<span class="space-title">${space.spaceKey}</span>
        								<p class="space-detail">Software Project</p>
       							</div>
       						</button>
						</form>
					</c:forEach>
					
				</div>
			</div>
				<div id="recommend">
					<div class="header-row">
						<span class="title">추천 항목</span>
						<div id="button-container">
							<button class="button-on" value="assigned">나에게 할당</button>
							<button class="button" value="workedon">작업</button>
							<button class="button" value="notion">알림</button>
						</div>
					</div>
					<hr/>
					<div id="body-row">
						<div class="status">
							<a>진행 중</a>
						</div>
						<div class="task">
							<div class="task-img">
								<img src="img/check.png">									
							</div>
							<div class="task-detail">
								<p class="task-title">TASK TITLE</p>
								<a class="task-position">task ㆍ space key ㆍ space title</a>
							</div>
							<div class="status-styled">
								<span class="status-txt">task status</span>
							</div>
						</div>
						<div class="status">
							<a>해야 할 일</a>
						</div>
						<div class="task">
							<div class="task-img">
								<img src="img/check.png">									
							</div>
							<div class="task-detail">
								<p class="task-title">TASK TITLE</p>
								<a class="task-position">task ㆍ space key ㆍ space title</a>
							</div>
							<div class="status-styled">
								<span class="status-txt">task status</span>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
</body>
</html>