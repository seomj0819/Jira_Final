<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Rows and Status</title>
	<style>
		* { box-sizing: border-box;}
		html, body {
		 	margin: 0;
		 	height: 100%;
		 	width: 100%;
		}
		*{ font-family: "Atlassian Sans", ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Ubuntu, "Helvetica Neue", sans-serif; }
		#topArea {
			height: 48px;
			width:100%;
			display:flex;
			align-items:center;
			border-bottom: 1px solid lightgray;
		}
		#area1 {
			display:flex;
			align-items:center;
			width: 12.5%;
		}
		#logo {
			margin-left: 50px;
		}
		#logo > a > img {
			cursor: pointer;
			height: 24px;
		}
		#closer > button {
			background-color: white;
			margin-left: 20px;
			border: 1px solid white;
		}
		#closer > button > img {
			height: 20px;
			cursor: pointer;
		}
		#opener {
			display: none;
		}
		#opener > button {
			background-color: white;
			border: 1px solid white;
			margin-left: 20px; 
		}
		#opener > button > img {
			height: 20px;
			cursor: pointer;
		}
		#area2 {
			width: 60.5%;
			display: flex;
			align-items:center;
			justify-content: right;
			gap: 10px;
		}
		#searchBar {
			height: 34px;
			width: 780px;
			border-radius: 6px;
			border: 1px solid gray;
			background-image: url('resources/img/search.png');
 			background-repeat: no-repeat;
 			background-size: 20px;
 			background-position: 3px center;
 			padding-left: 25px;
		}
		#create {
			background-color: #1868db;
			color: white;
			font-size: 16px;
			width: 90px;
			height: 33px;
			display: flex;
			align-items: center;
			justify-content: center;
			cursor: pointer;
			border: 1px solid #1868db;
			border-radius: 4px;
		}
		#plus {
			width: 26px;
			height: 26px;
		}
		#area3 {
			width: 27%;
			display: flex;
			align-items: center;
			justify-content: right;
		}
		#bell {
			margin-right: 80px;
			margin-bottom: 4px;
			cursor: pointer;
		}
		#profile {
			height: 24px;
			margin-right: 15px;
			margin-bottom: 1px;
			cursor: pointer;
		}
		#profile > a > img {
			height: 24px;
		}
		#mainArea {
			display: flex;
			width: 100%;
		}
		#sideBarArea {
			width: 12.5%;
			height: 910px;
			border-right: 1px solid lightgray;
		}
		.gap {
			width: 100%;
			height: 32px;
			display: flex;
			align-items: center;
		}
		.gap > a {
			margin-left: 15px;
		}
		.bold {
			margin-right: 10px;
			height: 12px;
			width: 18px;
			margin-top: 5.2px;
		}
		#osusume {
			margin-top: 15px;
			cursor: pointer;
		}
		#osusume:hover {
			background-color: #f5f5f5;
			color: gray;
		}
		#osusume:active {
			color: #1868db;
			border-right: 2px solid #1868db;
			background-color: rgb(233, 242, 254);
		}
		#osusume:focus-within {
			color: #1868db;
			border-right: 2px solid #1868db;
			background-color: rgb(233, 242, 254);
		}
		#hito {
			height: 24px;
			margin-left: 15px;
		}
		#saikin {
			display: flex;
			justify-content: space-between;
			cursor: pointer;
		}
		#saikin:hover {
			background-color: #f5f5f5;
			color: gray;
		}
		#saikin:active {
			color: #1868db;
			border-right: 2px solid #1868db;
			background-color: rgb(233, 242, 254);
		}
		#saikin:focus-within {
			color: #1868db;
			border-right: 2px solid #1868db;
			background-color: rgb(233, 242, 254);
		}
		#tokei {
			margin-left: 15px;
		}
		#filter {
			margin-left:15px;
		}
		#filter_list > div {
			cursor: pointer;
		}
		#filter_list > .gap:hover {
			background-color: #f5f5f5;
			color: gray;
		}
		#filter_list > .gap:active {
			color: #1868db;
			border-right: 2px solid #1868db;
			background-color: rgb(233, 242, 254);
		}
		#filter_list > .gap:focus-within {
			color: #1868db;
			border-right: 2px solid #1868db;
			background-color: rgb(233, 242, 254);
		}
		#space {
			margin-left: 15px;
		}
		#space_list > div {
			cursor: pointer;	
		}
		#space_list > .gap:hover {
			background-color: #f5f5f5;
			color: gray;
		}
		#space_list > .gap:active {
			color: #1868db;
			border-right: 2px solid #1868db;
			background-color: rgb(233, 242, 254);
		}
		#space_list > .gap:focus-within {
			color: #1868db;
			border-right: 2px solid #1868db;
			background-color: rgb(233, 242, 254);
		}
		#submit {
			display: flex;
			justify-content: space-between;
			cursor: pointer;
		}
		#submit:hover {
			background-color: #f5f5f5;
			color: gray;
		}
		#submit:active {
			color: #1868db;
			border-right: 2px solid #1868db;
			background-color: rgb(233, 242, 254);
		}
		#submit:focus-within {
			color: #1868db;
			border-right: 2px solid #1868db;
			background-color: rgb(233, 242, 254);
		}
		#upload {
			display: flex;
		}
		#plusdocu {
			height: 20px;
			width: 20px;
			margin-left: 15px;
		}
		#various {
			width: 87.5%;
		}
		#jiraSearch {
			width: 782px;
			height: 100%;
			margin-left: 271px;
			border: none;
			display: none;
		}
		#jiraSearch > iframe {
			box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 10px;
			border-radius: 6px;
			border: none;
		}
		.menuIcon {
			width: 20px;
		}
		#beru {
			width: 20px;
			margin-top: 6px;
		}
		#clock {
			width: 16px;
			margin-right: 6px;
			margin-left: 4px;
			margin-top: 3px;
		}
		#firuta {
			width: 18px;
			margin-right:6px;
		}
		#greencheck {
			width: 12px;
			height: 12px;
		}
		#rowsandstatus {
			margin: 35px;
		}
		#headerR {
			color: gray;
			font-size: 14px;
		}
		#headerR > a {
			color: gray;
			font-size: 14px;
			text-decoration: none;
			cursor: pointer;
		}
		#headerR > a:hover {
			text-decoration: underline;
		}
		#titleR > b {
			font-size: 25px;
			margin: 10px;
		}
		#headerR2 {
			display: flex;
			justify-content: space-between;
		}
		#btnsR {
			gap: 4px;
			padding-top: 10px;
		}
		#changeSave {
			height: 32px;
			width: 115px;
			background-color: rgba(5, 21, 36, 0.06);
			border-radius: 4px;
			border: 1px solid rgba(5, 21, 36, 0.06);
			color: rgba(8, 15, 33, 0.29);
			cursor: not-allowed;
		}
		#quit {
			border: none;
			background-color: white;
			cousor: pointer;
			height: 32px;
			width: 67px;
			border-radius: 4px;
			cursor: pointer;
		}
		#quit:hover {
			background-color: rgba(5, 21, 36, 0.06);
		}
		#describe {
			font-size: 13px;
			margin-bottom: 10px;
		}
		#mainR {
			display: flex;
			gap: 25px;
		}
		#undifined {
			width: 270px;
			height: 720px;
			background-color: rgba(5, 21, 36, 0.06);
			border-radius: 4px;
			padding: 10px;
		}
		#undifined > b {
			font-size: 13px;
		}
		#undifined > div {
			font-size: 13px;
			height: 94%;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		#todo {
			background-color: rgba(5, 21, 36, 0.06);
			border-radius: 4px;
			padding: 10px;
			width: 270px;
			height: 175px;
		}
		#todo > b {
			font-size: 12px;
			color: gray;
		}
		#todo > b:hover {
			cursor: grab;
		}
		#todo > .hsform {
			margin-left: 190px;
		}
		#doing {
			background-color: rgba(5, 21, 36, 0.06);
			border-radius: 4px;
			padding: 10px;
			width: 270px;
			height: 175px;
		}
		#doing > b {
			font-size: 12px;
			color: gray;
		}
		#doing > b:hover {
			cursor: grab;
		}
		#check {
			background-color: rgba(5, 21, 36, 0.06);
			border-radius: 4px;
			padding: 10px;
			width: 270px;
			height: 175px;
		}
		#check > b {
			font-size: 12px;
			color: gray;
		}
		#check > b:hover {
			cursor: grab;
		}
		#clear {
			background-color: rgba(5, 21, 36, 0.06);
			border-radius: 4px;
			padding: 10px;
			width: 270px;
			height: 175px;
		}
		#clear > b {
			font-size: 12px;
			color: gray;
		}
		#clear > b:hover {
			cursor: grab;
		}
		.hsform {
			margin-left: 190px;
		}
		.hs {
			width: 32px;
			height: 32px;
			border: 1px solid rgba(11, 18, 14, 0.14);
			border-radius: 4px;
			display: none;
			cursor: pointer;
		}
		.hs:hover {
			background-color: rgb(183, 185, 190);
		}
		.card {
			border-radius: 4px;
			background-color: white;
			box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 10px;
			display: flex;
			align-items: center;
			height: 32px;
			gap: 10px;
			padding: 8px;
			cursor: grab;
			margin-top: 10px;
		}
		.status {
			font-size: 10px;
			border-radius: 4px;
			display: inline;
			padding-left: 2px;
			padding-right: 2px;
		}
		.taskqty {
			font-size: 13px;
			padding-bottom: 2px;
		}
		#todo > .card > .status {
			border: 1px solid rgb(183, 185, 190);
		}
		#doing > .card > .status {
			border: 1px solid rgb(102, 157, 241);
		}
		#check > .card > .status {
			border: 1px solid rgb(102, 157, 241);
		}
		#clear > .card > .status {
			border: 1px solid rgb(148, 199, 72);
		}
		#plusbtn {
			font-size: 30px;
			border: 1px solid rgba(11, 18, 14, 0.14);
			color: rgb(80, 82, 88);
			border-radius: 6px;
			padding-left: 14px;
			padding-right: 14px;
			padding-bottom: 5px;
			background-color: white;
			cursor: pointer;
		}
		#plusbtn:hover {
			background-color: rgb(183, 185, 190);
		}
		.hsbtn {
			display: none;
			width: 32px;
			height: 32px;
			border: none;
		}
		#hsframe {
			display: none;
			margin-left: 30%;
		}
		#hsframe > iframe {
			border:none;
		}
	</style>
	<script src="resources/js/jquery-4.0.0.min.js"></script>
	<script>
		$(function() {
				$("#close").click(function() {
					/* $("#closer").html("<button id='open'><img src='https://www.svgrepo.com/show/347841/sidebar-collapse.svg'/></button>"); */
					$("#closer").css("display","none");
					$("#opener").css("display","block");
					$("#sideBarArea").css("display","none");
					$("#jiraSearch").css("display","none");
					$("#various").css("width","100%");
				});
				$("#open").click(function() {
					/* $("#closer").html("<button id='close'><img src='https://www.svgrepo.com/show/347842/sidebar-expand.svg'/></button>"); */
					$("#opener").css("display","none");
					$("#closer").css("display","block");
					$("#sideBarArea").css("display","block");
					$("#various").css("width","87.5%");
				});
				$("#searchBar").click(function() {
					if( $("#sideBarArea").css("display") != "none" ) {
						$(this).parent().parent().parent().parent().find("#mainArea").find("#various").find("#jiraSearch").toggle();
					}
				});
				$("#mainArea").click(function() {
					$(this).find("#various").find("#jiraSearch").hide();
				});
				$("#todo").hover(function() {
					$(this).find(".hsform").find(".hsbtn").show();
					$(this).find(".hsform").find(".hs").show();
				}, function() {
					$(this).find(".hsform").find(".hsbtn").hide();
					$(this).find(".hsform").find(".hs").hide();
				});
				$("#doing").hover(function() {
					$(this).find(".hsform").find(".hsbtn").show();
					$(this).find(".hsform").find(".hs").show();
				}, function() {
					$(this).find(".hsform").find(".hsbtn").hide();
					$(this).find(".hsform").find(".hs").hide();
				});	
				$("#check").hover(function() {
					$(this).find(".hsform").find(".hsbtn").show();
					$(this).find(".hsform").find(".hs").show();
				}, function() {
					$(this).find(".hsform").find(".hsbtn").hide();
					$(this).find(".hsform").find(".hs").hide();
				});	
				$("#clear").hover(function() {
					$(this).find(".hsform").find(".hsbtn").show();
					$(this).find(".hsform").find(".hs").show();
				}, function() {
					$(this).find(".hsform").find(".hsbtn").hide();
					$(this).find(".hsform").find(".hs").hide();
				});
				
				$(".hsbtn").click(function() {
					$("#jiraSearch").hide();
					$("#rowsandstatus").hide();
					$("#hsframe").show();
				});
		});
	</script>
</head>
<body>
	<div id="topArea">
			<div id="area1">
				<div id="closer"><button id="close"><img src="https://www.svgrepo.com/show/347842/sidebar-expand.svg"/></button></div>
				<div id="opener"><button id="open"><img src="https://www.svgrepo.com/show/347841/sidebar-collapse.svg"/></button></div>
				<div id="logo"><a href="Main.html"><img src="https://upload.wikimedia.org/wikipedia/commons/8/8a/Jira_Logo.svg"/></a></div>
			</div>
			<div id="area2">
				<div><input id="searchBar" name="searchKeyWord" type="text" placeholder="검색"/></div>
				<button id="create">
					<svg id="plus" xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="white" class="bi bi-plus" viewBox="0 0 16 16">
  						<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4">
  						</path>
  					</svg>
  					만들기
  				</button>
  			</div>
  			<div id="area3">
				<div id="bell"><a><img id="beru" src="resources/img/bell.svg"/></a></div>
				<div id="profile">
					<a>
						<img src="https://i0.wp.com/avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar-0.png?ssl=1"/>
					</a>
				</div>
			</div>
	</div>
	<div id="mainArea">
		<div id="sideBarArea">
			<div id="osusume" class="gap">
				<svg id="hito" fill="none" viewBox="-4 -4 24 24" role="presentation" class="_1reo15vq _18m915vq _syaz1r31 _lcxvglyw _s7n4yfq0 _vc881r31 _1bsb1ejb _4t3i1ejb">
					<path fill="gray" fill-rule="evenodd" d="M8 1.5a6.5 6.5 0 0 0-4.148 11.505A2.75 2.75 0 0 1 6.5 11h3c1.26 0 2.323.848 2.648 2.005A6.5 6.5 0 0 0 8 1.5m2.75 12.392v-.142c0-.69-.56-1.25-1.25-1.25h-3c-.69 0-1.25.56-1.25 1.25v.142l.06.027c.82.373 1.73.581 2.69.581s1.87-.208 2.69-.58q.03-.016.06-.028M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-3.5a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-3.5 2a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0" clip-rule="evenodd">
					</path>
				</svg>
				추천 항목
			</div>
			<div id="saikin" class="gap">
				<div id="tokei"><img id="clock" src="resources/img/clock.png"/>최근</div>
				<div><svg xmlns="http://www.w3.org/2000/svg" class="bold" viewBox="0 0 24 24" width="512" height="512" fill="gray"><path d="M6.079,22.5a1.5,1.5,0,0,1,.44-1.06l7.672-7.672a2.5,2.5,0,0,0,0-3.536L6.529,2.565A1.5,1.5,0,0,1,8.65.444l7.662,7.661a5.506,5.506,0,0,1,0,7.779L8.64,23.556A1.5,1.5,0,0,1,6.079,22.5Z"/></svg> </div>
			</div>
			<br/>
			<br/>
			<div id="filter" class="gap"><img id="firuta" src="resources/img/data-filter-icon.svg"/>필터</div>
			<div id="filter_list">
				<div class="gap">
					<a><img class="menuIcon" src="resources/img/space_sample.png"/>(사용가능한 필터목록)#01</a>
				</div>
				<div class="gap">
					<a><img class="menuIcon" src="resources/img/space_sample.png"/>(사용가능한 필터목록)#02</a>
				</div>
				<div class="gap">
					<a><img class="menuIcon" src="resources/img/space_sample.png"/>(사용가능한 필터목록)#03</a>
				</div>
				<div class="gap">
					<a><img class="menuIcon" src="resources/img/space_sample.png"/>(사용가능한 필터목록)#04</a>
				</div>
			</div>
			<div id="space" class="gap"><img class="menuIcon" src="resources/img/KakaoTalk_20260619_143529999.png"/>스페이스</div>
			<div id="space_list">
			<c:forEach var="dto" items="${list}">
				<div class="gap">
					<a><img class="menuIcon" src="resources/img/space_sample.png"/>${dto.spaceTitle}</a>
				</div>
			</c:forEach>
			</div>
			<br/>
			<div id="submit" class="gap">
				<div id="upload">
					<svg xmlns="http://www.w3.org/2000/svg" id="plusdocu" height="512" viewBox="0 0 24 24" width="512" fill="gray" data-name="Layer 1">
						<path d="m16 16a1 1 0 0 1 -1 1h-2v2a1 1 0 0 1 -2 0v-2h-2a1 1 0 0 1 0-2h2v-2a1 1 0 0 1 2 0v2h2a1 1 0 0 1 1 1zm6-5.515v8.515a5.006 5.006 0 0 1 -5 5h-10a5.006 5.006 0 0 1 -5-5v-14a5.006 5.006 0 0 1 5-5h4.515a6.958 6.958 0 0 1 4.95 2.05l3.484 3.486a6.951 6.951 0 0 1 2.051 4.949zm-6.949-7.021a5.01 5.01 0 0 0 -1.051-.78v4.316a1 1 0 0 0 1 1h4.316a4.983 4.983 0 0 0 -.781-1.05zm4.949 7.021c0-.165-.032-.323-.047-.485h-4.953a3 3 0 0 1 -3-3v-4.953c-.162-.015-.321-.047-.485-.047h-4.515a3 3 0 0 0 -3 3v14a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3z"/>
					</svg>
					&nbsp;회의자료 등록
				</div>
				<div id="yajirusi">
					<svg xmlns="http://www.w3.org/2000/svg" class="bold" viewBox="0 0 24 24" width="512" height="512" fill="gray">
						<path d="M6.079,22.5a1.5,1.5,0,0,1,.44-1.06l7.672-7.672a2.5,2.5,0,0,0,0-3.536L6.529,2.565A1.5,1.5,0,0,1,8.65.444l7.662,7.661a5.506,5.506,0,0,1,0,7.779L8.64,23.556A1.5,1.5,0,0,1,6.079,22.5Z"/>
					</svg>
				</div>
			</div>
		</div>
		<div id="various">
				<div id="jiraSearch">
					<iframe src="JiraSearch.html" width="782px" height="92%"></iframe>
				</div>
				<div id="hsframe">
					<iframe src="RowEdit.html" width="610px" height="330px"></iframe>
				</div>
			<div id="rowsandstatus">
				<div id="headerR">
					<a>스페이스</a> / <a>${dto.spaceTitle}</a> / <a> 스페이스 설정 </a>
				</div>
				<div id="headerR2">
					<div id="titleR">
						<b>열 및 상태</b>
					</div>
					<div id="btnsR">
						<button type="submit" id=changeSave>
							변경 사항 저장
						</button>
						<button id="quit">버리기</button>
					</div>
				</div>
				<div id="describe">
					열 및 상태를 사용하여 보드에서 작업의 진행 방식을 정의하세요. 관련 업무 항목을 보드 및 백로그에서 숨기려면 왼쪽 패널에 상태를 저장하세요.
				</div>
				<div id="mainR">
					<div id="undifined">
						<b>할당되지 않은 상태</b>
						<div>상태를 여기에 끌어 놓으면 보드 및 백로그에서 숨길 수 있습니다. 이 상태의 업무 항목은 표시되지 않습니다.</div>
					</div>
					<div id="todo">
						<b>할 일</b>
						<form class="hsform" action="RowEdit.html">
							<button class="hsbtn" type="submit" value="할 일" name="currname"><img class="hs" src="https://images.icon-icons.com/916/PNG/512/Edit_icon-icons.com_71853.png"/></button>
						</form>
						<div class="card">
							<div class="status">할 일</div>
							<div class="taskqty">0 업무 항목</div>
						</div>
					</div>
					<div id="doing">
						<b>진행 중</b>
						<form class="hsform" action="RowEdit.html">
							<button class="hsbtn" type="submit" value="진행 중" name="currname">
								<img class="hs" src="https://images.icon-icons.com/916/PNG/512/Edit_icon-icons.com_71853.png"/>
							</button>
						</form>
						<div class="card">
							<div class="status">진행 중</div>
							<div class="taskqty">1 업무 항목</div>
						</div>
					</div>
					<div id="check">
						<b>검토 중</b>
						<form class="hsform" action="RowEdit.html">
						<!-- <iframe src="jiraSearch" width="782px" height="92%"></iframe>
						<iframe src="rowEdit" width="610px" height="330px"></iframe> -->
							<button class="hsbtn" type="submit" value="검토 중" name="currname">
								<img class="hs" src="https://images.icon-icons.com/916/PNG/512/Edit_icon-icons.com_71853.png"/>
							</button>
						</form>
						<div class="card">
							<div class="status">검토 중</div>
							<div class="taskqty">0 업무 항목</div>
						</div>
					</div>
					<div id="clear">
						<b>완료</b>
						<img id="greencheck" src="resources/img/greencheck.png"/>
						<form class="hsform" action="RowEdit.html">
							<button class="hsbtn" type="submit" value="완료" name="currname">
								<img class="hs" src="https://images.icon-icons.com/916/PNG/512/Edit_icon-icons.com_71853.png"/>
							</button>
						</form>
						<div class="card">
							<div class="status">완료</div>
							<div class="taskqty">1 업무 항목</div>
						</div>
					</div>
					<div id="plusarea">
						<button id="plusbtn">+</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>