<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Space Detail</title>
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
		#spaceprofile {
			width: 128px;
			height: 128px;
			margin-left: 110px;
			margin-top: 15px;
		}
		#spaceform {
			width: 100%;
			height: 100%;
		}
		#spaceformheader {
			margin-left: 22%;
			color: gray;
			font-size: 14px;
			
			margin-top: 1.5%;
		}
		#spaceformheader > a {
			color: gray;
			font-size: 14px;
			text-decoration: none;
		}
		#spaceformheader > a:hover {
			text-decoration: underline;
		}
		#spaceformheader > b {
			color: black;
			font-size: 24px;
			margin-left: 3px;
			display: block;
			margin-top: 8px;
		}
		#spaceformimageup {
			margin-left: 39.9%;
		}
		#iconchange {
			background-color: white;
			border: 1px solid lightgray;
			padding-top: 5px;
			padding-bottom: 5px;
			padding-left: 10px;
			padding-right: 10px;
			border-radius: 3px;
			font-size: 14px;
			margin-left: 125px;
			margin-bottom: 20px;
			margin-top: 15px;
			cursor: pointer;
		}
		#spaceformform {
			font-size: 12px;
			font-weight: 500;
			margin-left: 39.9%;
			margin-top: 20px;
		}
		.spaceipt {
			height: 40px;
			width: 353px;
			border: 1px solid gray;
			border-radius: 4px;
			font-size: 16px;
			margin-bottom: 20px;
			margin-top: 5px;
		}
		#owner {
			height: 40px;
			width: 353px;
			border: 1px solid gray;
			border-radius: 4px;
			font-size: 16px;
			margin-bottom: 20px;
			margin-top: 5px;
		}
		#spacesubmit {
			height: 32px;
			width: 54px;
			border-radius: 3px;
			background-color: #f5f5f5;
			/* background-color: #1868db; */
			border: none;
			cursor: pointer;
			font-size: 15px;
			color: lightgray;
			/* color: white; */
		}
		.imageP {
			background-repeat: no-repeat;
			background-position: 3px 0;
			padding-left: 32px;
			background-size: 24px 24px;
			background-position: 4px 7px;
			background-image: url(https://i0.wp.com/avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar-0.png?ssl=1);
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
				$("#nameipt").on("input",function() {
					if( $("#nameipt").val() == "" || $("#nameipt").val() == $("#nameipt").attr("value") ) {
						
						if( ($("#keyipt").val() == "" || $("#keyipt").val() == $("#keyipt").attr("value")) && ($("#fileinput").val()=="") && ($("#owner").val()=="1") ) {
							$("#spacesubmit").css("background-color", "#f5f5f5");
							$("#spacesubmit").css("color","lightgray");
							$("#spacesubmit").attr("disabled",true);
						}
					} else {
						$("#spacesubmit").attr("disabled", false);
						if(!$("#spacesubmit").attr("disabled")) {
							$("#spacesubmit").css("background-color", "#1868db");
							$("#spacesubmit").css("color","white");
						}
					}
				});
				$("#keyipt").on("input",function() {
					if( $("#keyipt").val() == "" || $("#keyipt").val() == $("#keyipt").attr("value") ) {
						
						if( ($("#nameipt").val() == "" || $("#nameipt").val() == $("#nameipt").attr("value")) && ($("#fileinput").val()=="") && ($("#owner").val()=="1") ) {
							$("#spacesubmit").css("background-color", "#f5f5f5");
							$("#spacesubmit").css("color","lightgray");
							$("#spacesubmit").attr("disabled",true);
						}
					} else {
						$("#spacesubmit").attr("disabled", false);
						if(!$("#spacesubmit").attr("disabled")) {
							$("#spacesubmit").css("background-color", "#1868db");
							$("#spacesubmit").css("color","white");
						}
					}
				});
				$("#fileinput").on("input",function() {
					if($("#fileinput").val()=="") {
						
						if( ($("#keyipt").val() == "" || $("#keyipt").val() == $("#keyipt").attr("value")) && ($("#nameipt").val() == "" || $("#nameipt").val() == $("#nameipt").attr("value")) && ($("#owner").val()=="1") ) {
							$("#spacesubmit").css("background-color", "#f5f5f5");
							$("#spacesubmit").css("color","lightgray");
							$("#spacesubmit").attr("disabled",true);
						}
					} else {
						$("#spacesubmit").attr("disabled", false);
						if(!$("#spacesubmit").attr("disabled")) {
							$("#spacesubmit").css("background-color", "#1868db");
							$("#spacesubmit").css("color","white");
						}
					}
				});
				$("#owner").on("input",function() {
					if($("#owner").val()=="1") {	//current userno
						
						if( ($("#keyipt").val() == "" || $("#keyipt").val() == $("#keyipt").attr("value")) && ($("#nameipt").val() == "" || $("#nameipt").val() == $("#nameipt").attr("value")) && ($("#fileinput").val()=="") ) {
							$("#spacesubmit").css("background-color", "#f5f5f5");
							$("#spacesubmit").css("color","lightgray");
							$("#spacesubmit").attr("disabled",true);
						}
					} else {
						$("#spacesubmit").attr("disabled", false);
						if(!$("#spacesubmit").attr("disabled")) {
							$("#spacesubmit").css("background-color", "#1868db");
							$("#spacesubmit").css("color","white");
						}
					}
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
				<div><input id="searchBar"type="text" placeholder="검색"/></div>
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
				<div id=spaceform>
					<div id="spaceformheader">
						<a href="spacelist">스페이스</a>&nbsp; / &nbsp;<a href="main">${dto.spaceTitle}</a>&nbsp; / &nbsp;<a href="spacedetail">스페이스 설정</a>
						<br/>
						<b>세부 사항</b>
					</div>
					<div id="spaceformimageup">
						<img id="spaceprofile" src="resources/img/space_sample.png"/> <br/>
						<button id="iconchange">아이콘 변경</button> <br/>
						<span style="font-size:12px; color: gray;">필수 필드는 별표로 표시되어 있습니다 </span><span style="color: red;">*</span>
					</div>
					<div id="spaceformform">
						<form action="SpaceDetailAction.jsp" method="post" id="sdform" enctype="multipart/form-data">
		        			<input type="file" id="fileinput" name="spaceimage" accept="image/*" style="display:none;"/>
							이름 <span style="color: red;">*</span> <br/>
							<input class="spaceipt" id="nameipt" type="text" name="spacename" value="${dto.spaceTitle}" required/> <br/> 	<!-- value=current -->
							스페이스 키 <span style="color: red;">*</span> <br/>	
							<input class="spaceipt" id="keyipt" type="text" name="spacekey" value="${dto.spaceKey}" required/> <br/> 	<!-- value=current -->
							스페이스 소유자 <span style="color: red;">*</span> <br/>
							<select name="owner" id="owner" class="imageP">
								<option value="1" selected>김성관</option> 	<!-- current user_no , current user_name --> 
								<option value="2">서민재</option>
							</select> <br/>
							<input id="spacesubmit" type="submit" value="저장" disabled="true"/>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>