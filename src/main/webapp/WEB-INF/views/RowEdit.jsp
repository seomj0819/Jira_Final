<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String currname = (String)request.getParameter("currname");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Row Edit</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/RowEdit.css'/>"/>
	<script src="resources/js/jquery-4.0.0.min.js"></script>
	<script>
		$(function() {
			$("#iptrname").on("input",function() {
				if( $("#iptrname").val() == "" || $("#iptrname").val() == $("#iptrname").attr("value") ) {
					
						$("#update").css("background-color", "rgba(5, 21, 36, 0.06)");
						$("#update").css("color","rgba(8, 15, 33, 0.29)");
						$("#update").attr("disabled",true);
						$("#update").css("cursor","not-allowed");
						
				} else {
					
						$("#update").attr("disabled",false);
						$("#update").css("background-color", "#1868db");
						$("#update").css("color","white");
						$("#update").css("cursor","pointer");
						
				}
			});
		});
	</script>
</head>
<body>
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
</body>
</html>