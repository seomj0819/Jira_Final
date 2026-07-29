<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/Main_dashboard.css'/>"/>

<meta charset="UTF-8">
<title>Jira Main Dashboard Page</title>
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