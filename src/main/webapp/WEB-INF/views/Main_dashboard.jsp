<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Jira Main Dashboard Page</title>
</head>
<style>
	*{ box-sizing: border-box; font-family: "Atlassian Sans", ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Ubuntu, "Helvetica Neue", sans-serif; }
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
	#menu-container {
		height: 32px;
	}
	#dashboard-container {
		column-gap: 24px;
	}
	#first-row {
		display: flex;
	}
	.first-row-item {
		display: flex;
		height: 64px;
		width: 270px;
		padding: 12px;
		margin: 30px 10px;
		border-radius: 8px;
		border: 1px solid rgba(11, 18, 14, 0.24);
		align-items: center;
		cursor: pointer;
	}
	.icon-container {
		display: flex;
		width: 40px;
		height: 40px;
		border-radius: 8px;
		background-color: rgba(11, 18, 14, 0.12);
		justify-content: center;
    	align-items: center;
	}
	.icon-container > img {
		width: 20px;
		height: 20px;]
	}
	.summary-container> p {
		margin: 0px;
		font-size: 16px;
		font-weight: 653;
		margin-bottom: -2px;
	}
	.summary-container> a {
		font-size: 12px;
		font-weight: 400;
		color: rgb(107, 110, 118);
	}
	.summary-container {
		margin-left: 10px;
	}
	.status-container {
		width: 564px;
		height: 320px;
		border: 1px solid rgba(11, 18, 14, 0.24);
		border-radius: 8px;
		padding: 16px;
	}
	.status-container > div > img {
		text-align: center;
	}
	#second-row {
		display: flex;
		gap: 25px;
	}
	.container-head > p {
		margin: 0px;
		font-size: 16px;
		font-weight: 653;
	}
	.container-head > span {
		font-size: 14px;
		font-weight: 400;
	}
	#third-row {
		display: flex;
		gap: 25px;
		margin-top: 25px;
	}
</style>
<body>
	<form>
		<header id="header">
			<div id="title-container">
				<span id="title">스페이스</span>
			</div>
			<div id="space-title-container">
				<span><img src="img/space_sample.png"></span>
				<span id="space-title">Project Title</span>
				<button class="button"><img src="img/add_user.png"></button>
				<button class="button"><img src="img/more.png"></button>
			</div>
			<div id="menu-container">
				<button class="menu-button-on">
					<span><img src="img/dashboard.png"></span>
					<span>대시보드</span>
				</button>
				
				<button class="menu-button">
					<span><img src="img/clipboard.png"></span>
					<span>보드</span>
				</button>
			</div>
		</header>
		<main>
			<div id="dashboard-container">
				<div id="first-row">
					<div class="first-row-item">
						<span class="icon-container"><img src="img/check(black).png"></span>
						<div class="summary-container">
							<p>N개 완료함</p>
							<a>지난 7일간</a>
						</div>
					</div>
					<div class="first-row-item">
						<span class="icon-container"><img src="img/update.png"></span>
						<div class="summary-container">
							<p>N개 업데이트함</p>
							<a>지난 7일간</a>
						</div>
					</div>
					<div class="first-row-item">
						<span class="icon-container"><img src="img/createdTask.png"></span>
						<div class="summary-container">
							<p>N개 만듦</p>
							<a>지난 7일간</a>
						</div>
					</div>
					<div class="first-row-item">
						<span class="icon-container"><img src="img/calendar.png"></span>
						<div class="summary-container">
							<p>N개 마감 예정</p>
							<a>지난 7일간</a>
						</div>
					</div>
				</div>
				<div id="second-row">
					<div class="status-container">
						<div class="container-head">
							<p>상태 개요</p>
							<span>업무 항목의 상태 스냅샷을 확인하세요.</span>
						</div>
						<div class="container-body">
							<img src="img/graph.png">
						</div>
					</div>
						<div class="status-container">
						<div class="container-head">
							<p>최근 활동</p>
							<span>스페이스 전반에서 일어나는 최신 정보를 파악하세요.</span>
						</div>
						<div class="container-body">
							<img src="img/sample image.png">
						</div>
					</div>
				</div>
				<div id="third-row">
					<div class="status-container">
						<div class="container-head">
							<p>우선 순위 분석</p>
							<span>업무 우선 순위가 지정되는 방식을 전체적으로 봅니다.</span>
						</div>
						<div class="container-body">
							<img src="img/sample image2.png">
						</div>
					</div>
						<div class="status-container">
						<div class="container-head">
							<p>팀 워크로드</p>
							<span>팀의 작업 수용량을 모니터링합니다.</span>
						</div>
						<div class="container-body">
							<img src="img/sample image3.png">
						</div>
					</div>
				</div>
			</div>
		</main>
	</form>
</body>
</html>