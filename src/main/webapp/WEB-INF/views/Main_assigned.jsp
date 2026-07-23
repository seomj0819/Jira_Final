<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jira Main_assigned Page</title>
</head>
<style>
	*{ box-sizing: border-box; font-family: "Atlassian Sans", ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Ubuntu, "Helvetica Neue", sans-serif; }
	#main {
		padding: 0px 40px;
	}
	.header-row {
		display: inline-flex;
		justify-content: space-between;
		align-items: center;
		width: 100%;
	}
	#body-row {
		display: flex;
		flex-direction: column;
		width: 100%;
		gap: 20px
	}
	.title {
		color: rgb(41, 42, 46);
		font-size: 16px;
		font-weight: 653;
	}
	.content {
		color: rgb(41, 42, 46);
		font-size: 14px;
		font-weight: 400;
	}
	.space-card {
		display: flex;
		border: 1px solid;
		border-color: rgba(11, 18, 14, 0.14);
		border-radius: 4px;
		cursor: pointer;
		padding: 6px 18px;
		gap: 7px;
		margin-top: 15px;
	    align-items: center;
	    width: 240px;
	}
	.space-card > img {
		height: 32px;
	}
	.space-title {
		margin: 5px;
		margin-left: -45px;
		font-weight: 600;
		font-size: 14px;
	}
	.space-detail {
		margin: 5px;
		font-size: 12px;
		font-weight: 400;
	}
	#space-card-list {
		display: flex;
		column-gap: 16px;
	}
	#recommend{
		margin-top: 30px;
		width: 100%;
	}
	#button-container {
		display: flex;
		background-color: rgba(5, 21, 36, 0.13);
		border-radius: 8px;
		align-items: center;
		column-gap: 20px;
		padding: 4px;
	}
	.button {
		border-radius: 6px;
		border: none;
		cursor: pointer;
		height: 24px;
		padding: 2px;
		background-color: rgba(0, 0, 0, 0)
	}
	.button-on {
		background-color: rgb(255, 255, 255);
		border-radius: 6px;
		border: 1px solid rgba(11, 18, 14, 0.14);
	}
	.status {
		color: rgb(107, 110, 118);
		font-size: 14px;
		weight: 500;
	}
	.task {
		display: flex;
		align-items: center;
		justify-content: space-between;
		width: 100%;
		cursor: pointer;
	}
	.task-img > img {
		width: 23px;
	}
	.task-img {
		width: 32px;
		height: 32px;
		border-radius: 8px;
		background-color: rgba(5, 21, 36, 0.13);
		text-align: center;
		align-content: center;
		margin-right: 15px;
	}
	.task-detail {
		font-size: 12px;
		flex-grow: 1;
	}
	.status-styled {
  		flex-shrink: 0;
   		margin-left: 20px;
   		background-color: rgba(5, 21, 36, 0.16);
   		padding: 2px;
   		border-radius: 6px;
	}
	.task-title {
		font-size: 14px;
		margin: 3px 0px;
	}
	.status-txt {
		font-size: 12px;
		font-weight: 600;
	}
</style>
<body>
	<form action="">
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
	</form>
</body>
</html>