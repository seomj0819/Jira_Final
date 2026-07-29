<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>addUserPopUp</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/addUserPopUp.css'/>">
</head>
<body>
	<div id="container">
		<header id="header-container">
			<span id="title">프로젝트 스페이스에 사용자 추가</span>
			<button id="close"><img src="img/close.png"></button>
		</header>
		<main>
			<div>
				<span class="small_title">이름 또는 이메일</span>
				<a class="required">*</a><br/>
				<input id="email-input" type="text" placeholder="예: Maria, maria@company.com">
			</div>
			<div>
				<span class="small_title">역할</span>
				<a class="required">*</a><br>
				<select id="user_roll">
					<option selected>관리자</option>
					<option>조회자</option>
					<option>편집자</option>
				</select>
			</div>
		</main>
		<footer>
			<div id="button-container">
				<button type="reset" id="cancle">취소</button>
				<button type="submit" id="add">추가</button>
			</div>
		</footer>
	</div>
</body>
</html>