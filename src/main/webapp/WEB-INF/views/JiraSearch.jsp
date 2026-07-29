<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Jira Search</title>
	<script src="resources/js/jquery-4.0.0.min.js"></script>
	<link rel="stylesheet" href="<c:url value='/resources/css/JiraSearch.css'/>"/>
</head>
<body>
	<div id="jirasearch">
		<div id="header">
			Jira
		</div>
		<hr/>
		<div id="span">
			최근에 조회
		</div>
		<div id="tasklist">
			<div class="list">
				<img class="taskimage" src="https://koreait.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10318?size=medium">
				ABCD-4 작업4
			</div>
			<div class="list">
				<img class="taskimage" src="https://koreait.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10318?size=medium">
				ABCD-3 작업3
			</div>
			<div class="list">
				<img class="taskimage" src="https://koreait.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10318?size=medium">
				ABCD-2 작업2
			</div>
			<div class="list">
				<img class="taskimage" src="https://koreait.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10318?size=medium">
				ABCD-1 작업1
			</div>
			<div class="list">
				<img class="taskimage" src="https://koreait.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10318?size=medium">
				taskId title
			</div>
			<div class="list">
				<img class="taskimage" src="https://koreait.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10318?size=medium">
				taskId title
			</div>
		</div>
	</div>
</body>
</html>