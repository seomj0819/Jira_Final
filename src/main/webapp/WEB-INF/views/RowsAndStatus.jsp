<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String currname = (String)request.getParameter("currname");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Rows and Status</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/RowsAndStatus.css'/>"/>
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
					$("#rowsandstatus").show();
				});
				$("#open").click(function() {
					/* $("#closer").html("<button id='close'><img src='https://www.svgrepo.com/show/347842/sidebar-expand.svg'/></button>"); */
					$("#opener").css("display","none");
					$("#closer").css("display","block");
					$("#sideBarArea").css("display","block");
					$("#various").css("width","87.5%");
				});
				$("#searchBar").click(function() {
					if( $("#sideBarArea").css("display") != "none" && $("#hsframe").css("display") == "none") {
						$(this).parent().parent().parent().parent().find("#mainArea").find("#various").find("#jiraSearch").toggle();
						$(this).parent().parent().parent().parent().find("#mainArea").find("#various").find("#rowsandstatus").toggle();
					}
				});
				$("#mainArea").click(function() {
					$(this).find("#various").find("#jiraSearch").hide();
					$(this).find("#various").find("#rowsandstatus").show();
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
				
				$(".hsbtn").click(function(e) {		//e: 클릭 이벤트 객체
					e.stopPropagation();	//부모인 mainarea의 클릭 이벤트까지 영향을 주기 않게 하기위함: .hsbtn 단계에서 클릭 신호를 차단
					
					$("#jiraSearch").hide();
					$("#rowsandstatus").hide();
					$("#hsframe").show();
				});
				$("#hsframe").click(function(e) {
					e.stopPropagation();
					
					$("#jiraSearch").hide();
					$("#rowsandstatus").hide();
				});
				$("#exit, #cancel").click(function(e) {
					e.stopPropagation();
					
				    $("#hsframe").hide();
				    $("#rowsandstatus").show();
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
				</div>
				<div id="hsframe">
					<div id=editcard>
						<div id=cardheader>
							<b>열 편집</b>
							<button id="exit">x</button>
						</div>
						<div id="cardform">
							<form action="rowsandstatus">
								이름<span style="color: red;">*</span>
								<br/>
								<input id="iptrname" type="text" value="<%=currname %>" name="rName" required/>
								<br/>
								<button id="delete" type="button">열 삭제</button>
								<button id="cancel" type="button">취소</button>
								<input id="update" type="submit" value="업데이트" disabled="true"/>
							</form>
						</div>
					</div>
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
						<b>${todo}</b>
						<form class="hsform">
							<button class="hsbtn" type="button" value="${todo}" name="currname"><img class="hs" src="https://images.icon-icons.com/916/PNG/512/Edit_icon-icons.com_71853.png"/></button>
						</form>
						<div class="card">
							<div class="status">${todo}</div>
							<div class="taskqty">0 업무 항목</div>
						</div>
					</div>
					<div id="doing">
						<b>${doing}</b>
						<form class="hsform">
							<button class="hsbtn" type="button" value="${doing}" name="currname">
								<img class="hs" src="https://images.icon-icons.com/916/PNG/512/Edit_icon-icons.com_71853.png"/>
							</button>
						</form>
						<div class="card">
							<div class="status">${doing}</div>
							<div class="taskqty">1 업무 항목</div>
						</div>
					</div>
					<div id="check">
						<b>${check}</b>
						<form class="hsform">
							<button class="hsbtn" type="button" value="${check}" name="currname">
								<img class="hs" src="https://images.icon-icons.com/916/PNG/512/Edit_icon-icons.com_71853.png"/>
							</button>
						</form>
						<div class="card">
							<div class="status">${check}</div>
							<div class="taskqty">0 업무 항목</div>
						</div>
					</div>
					<div id="clear">
						<b>${clear}</b>
						<img id="greencheck" src="resources/img/greencheck.png"/>
						<form class="hsform">
							<button class="hsbtn" type="button" value="${clear}" name="currname">
								<img class="hs" src="https://images.icon-icons.com/916/PNG/512/Edit_icon-icons.com_71853.png"/>
							</button>
						</form>
						<div class="card">
							<div class="status">${clear}</div>
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