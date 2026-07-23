<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Jira Create Space Page</title>
	<style>
		html, body {
			margin: 0;
			padding: 0;
			height: 100vh;
		}
		body {
			display: flex;
		}
		#container {
			width: 50%;
			height: 100vh;
			position: relative;
			overflow: hidden;
			margin: 30px 40px;
		}
		.main-title {
			font-size: 28px;
			font-weight: 653;
		}
		.header-subtitle {
			color: rgb(107, 110, 118);
			font-size: 14px;
			font-weight: 400;
		}
		.necessary {
			color: rgb(174, 46, 36);
			font-size: 12px;
			font-weight: 653;
			margin-left: -6px;
   			display: inline-block;
    		transform: translateY(-2px);
		}
		.title {
			color: rgb(80, 82, 88);
			font-size: 12px;
			font-weight: 653;
		}
		#email-input {
			border: 1px solid rgba(11, 18, 14, 0.19);
			padding: 5px;
			border-radius: 3px;
			width: 70%;
			max-width: 478px;
			height: 36px;
		}
		#email-input > input {
			border: none;
			outline: none;
			font-size: 14px;
			width: 70%;
			max-width: 478px;
		}
		#user-roll {
			padding: 5px;
			width: 70%;
			max-width: 478px;
			height: 36px;
			border: 1px solid rgba(11, 18, 14, 0.19);
			border-radius: 3px;
		}
		#button-container {
			border-top: 1px solid #ccc;
			padding: 10px;
			position: absolute;
			width: 100%;
		    bottom: 0px;
		    right: 20px;
		    display: flex;
		    gap: 10px;
		    justify-content: flex-end;
		}
		#title-container > input {
			width: 70%;
			max-width: 478px;
			height: 36px;
			border: 1px solid rgba(11, 18, 14, 0.19);
			border-radius: 3px;
		}
		#key-container > input {
			width: 70%;
			max-width: 211px;
			height: 36px;
			border: 1px solid rgba(11, 18, 14, 0.19);
			border-radius: 3px;
		}
		#input-container {
			display: flex;
		    flex-direction: column;
		    gap: 24px;
		}
		input:focus {
			border-color: rgb(70, 136, 236);
			border-radius: 3px;
			outline: none;
		}
		#button-container > input {
			background-color: rgb(24, 104, 219);
			color: white;
			border: none;
			border-radius: 3px;
			font-size: 14px;
			padding: 6px;
		}
		#button-container {
			column-gap: 14px;
		}
	</style>
</head>
<body>
	<div id="preview">
		
	</div>
	<div id="container">
		<form>
			<header>
				<div id="header-container">
					<h1 class="main-title">스페이스 이름 지정</h1>
					<span class="header-subtitle">필수 필드는 별표로 표시되어 있습니다</span>
					<span class="necessary">＊</span>
				</div>
			</header>
			<main>
				<div id="input-container">
					<div id="title-container">
						<span class="title">이름</span>
						<span class="necessary">＊</span><br/>
						<input type="text" placeholder="팀 이름, 프로젝트 목표, 마일스톤 등을 사용해보기">
				</div>
					<div id="key-container">
						<span class="title">키</span>
						<span class="necessary">＊</span><br/>
						<input type="text">
					</div>
					<div id="invite-users">
						<span class="main-title">팀 초대하기</span><br/>
						<span class="header-subtitle">Jira에서 이미 함께 공동 작업한 사용자를 추가하거나 새로운 사용자를 초대하세요.</span><br/>
						<a class="title">이름 또는 이메일 입력</a>
						<div id="email-input">
							<input type="text" placeholder="이메일을 입력하세요">
						</div>
					</div>
					<div id="user-roll-container">
						<a class="title">역할</a><br/>
						<select id="user-roll">
							<option value="admin" selected>관리자</option>
							<option value="editor">편집자</option>
							<option value="viewer">조회자</option>
						</select>
					</div>
				</div>
			</main>
			<footer>
				<div id="button-container">
					<input type="reset" id="cancle-button" value="이전">
					<input type="submit" id="submit-button" value="제출">
				</div>
			</footer>
		</form>
	</div>
</body>
</html>