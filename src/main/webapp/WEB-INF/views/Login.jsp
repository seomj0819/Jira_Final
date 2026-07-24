<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jira Login</title>
</head>
<script>
	$(function() {
		init();
		
		function init() {
			const saveId = getCookie("saveId");
			
			// Cookie에 값 존재시 ID값 추가, 체크
			if(saveId != "" && typeof(saveId) != "undefined") {
				$("#saveId").prop("checked", true);
				$("#email").val(saveId);
			} else {	// Cookie에 값 부재시 체크 해제
				$("#saveId").prop("checked", false);
			}
		}
		
		// 쿠키 조회
		// email = 쿠키값
		function getCookie(email) {
			const cookie = document.cookie;
			if(document.cookie != "") {
				var cookieArray = cookie.split(":");
				for(var index in cookieArray) {
					var cookieEmail = cookieArray[index].split("=");
					if(cookieEmail[0] == email) {
						return cookieEmail[1];
					}
				}
			}
			return;
		}
		
		// 쿠키 저장
		function setCookie(email, value, expiredays) {
			var todayDate = new Date();
			todayDate.setDate(todatDate.getDate() + expireDays);
			document.cookie = email + "=" + escape(value) + "; path=/; expires="
	        + todayDate.toGMTString() + ";"
		}
		
	})
</script>
<style>
	*{ box-sizing: border-box; font-family: "Atlassian Sans", ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Ubuntu, "Helvetica Neue", sans-serif; }
	body {
		background-color: rgb(250, 251, 252);
		background-image: url(https://id-frontend.prod-east.frontend.public.atl-paas.net/assets/default_left.558fbf68.svg), url(https://id-frontend.prod-east.frontend.public.atl-paas.net/assets/default_right.f8462257.svg);
    	background-repeat: no-repeat, no-repeat;
    	background-attachment: fixed, fixed;
    	background-size: 368px, 368px;
    	background-position: left bottom, right bottom;
		height: 100vh;
		display: flex;
		justify-content: center;
		align-items: center;
		width: 100%;
		gap: 15px;
	}
	#whiteBoxContainer {
		width: 400px;
		padding: 32px 40px;
		background: transparent;
		border-radius: 3px;
		box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 10px;
		box-sizing: border-box;
		color: var(--ds-text-subtle);
	}
	#logo {
		display: flex;
		justify-content: center;
	}
	#notice {
		display: block;
		color: rgb(41, 42, 46);
		font-size: 16px;
		font-weight: 653;
		height: 20px;
		line-height: 20px;
		width: 184.75px;
		margin-left: 70px; 
		margin-top: 15px;
		margin-bottom: 13px;
	}
	#small_txt {
		color: rgb(80, 82, 88);
		cursor: default;
		display: inline-block;
		font-size: 12px;
		font-weight: 653;
		line-height: 16px;
		padding-inline-start: 2px;
		margin-top: 8px;
	}
	#required {
		color: rgb(174, 46, 36);
		display: inline-block;
		font-weight: 653
		paddint-inline-start: 2px;
	}
	#useremail-container {
		align-items: center;
		background-color: rgb(255, 255, 255);
		width: 320px; 
		height: 40px; 
		margin-top: 2px;
	}
	#email_input {
		background-color: rgba(0, 0, 0, 0);
		color: rgb(41, 42, 46);
		cursor: text;
		display: block;
		font-size: 14px;
		font-stretch: 100%;
		font-weight: 400;
		line-height: 20px;
		outline-width: 3px;
		box-sizing: border-box;
		padding: 10px;
		width: 320px; 
		height: 40px;
		border-radius: 3px;
		border: 1px solid rgb(193, 199, 208);
	}
	#login-submit {
		background-color: rgb(24, 104, 219);
		cursor: pointer;
		display: inline-flex;font-size: 14px;
		height: 40px;
		font-weight: 500;
		line-height: 40px;
		width: 320px;
		border: none;
		border-radius: 3px;
		margin-top: 22px;
		text-align: center; 
	}
	#google-login > span> img {
		margin: 0px 6px 0px 0px;
		height: 24px;
   		width: 24px;
	}
	#saveId {
		margin-top: 17px;
	}
	#chkbox-txt {
		color: rgb(41, 42, 46); 
		font-size: 14px;
	}
	#login-txt {
		color: white;
		position: flex;
		justify-content: center;
		margin-left: 134px;
	}
	#login-option{
		margin-top: 24px; 
		color: rgb(80, 82, 88); 
		font-size: 14px; 
		text-align: center;
	}
	#google-login {
		text-align: center; 
		justify-content: center;
	}
	#google-login-button {
		border: 1px solid rgb(193, 199, 208); 
		width: 320px; 
		height: 40px; 
		border-radius: 3px; 
		background: rgb(255, 255, 255); 
		cursor: pointer;
	}
	#google-login-button > span > img {
		height: 24px; 
		width: 24px; 
		position: absolute; 
		margin-top: -3px;
	}
	#google-txt {
		color: rgb(23, 43, 77); 
		font-size: 14px; 
		font-weight: 700; 
		position: relative; 
		margin-left: 33px;
	}
	.signIn-signUp {
		color: rgb(24, 104, 219); 
		font-size: 14px; 
		font-weight: 400; 
		cursor: pointer; 
		text-decoration-line: underline;
	}
	.dot {
		margin: 0px 20px;
	}
	#other-option {
		text-align: center; 
		margin: 13px;
	}
</style>
<body>
	<div id="background">
		<div id="whiteBoxContainer">
			<header id="logo">
				<svg xmins="http://www.w3.org/2000/svg" viewBox="0 0 198 32" focusable="flase" aria-hidden="true" height="32" fill="none">
					<path fill="#1868DB" d="M22.878 24.378 12.293 3.208c-.208-.458-.416-.541-.666-.541-.209 0-.459.083-.709.5-1.5 2.375-2.167 5.125-2.167 8 0 4.001 2.042 7.752 5.043 13.794.333.667.583.792 1.166.792h7.335c.542 0 .833-.208.833-.625 0-.208-.041-.333-.25-.75M7.501 14.377c-.833-1.25-1.083-1.334-1.292-1.334s-.333.083-.708.834L.208 24.46c-.166.334-.208.459-.208.625 0 .334.292.667.917.667h7.46c.5 0 .874-.416 1.083-1.208.25-1 .333-1.876.333-2.917 0-2.917-1.292-5.751-2.292-7.251z"></path>
					<path fill="#1868DB" d="M107.447 10.828c0 2.972 1.345 5.308 6.795 6.37 3.185.707 3.893 1.203 3.893 2.265 0 1.061-.708 1.698-2.973 1.698-2.619 0-5.733-.92-7.785-2.123v4.813c1.627.778 3.751 1.698 7.785 1.698 5.662 0 7.856-2.548 7.856-6.228m0 .07c0-3.538-1.84-5.166-7.148-6.298-2.902-.637-3.61-1.274-3.61-2.194 0-1.133 1.062-1.628 2.973-1.628 2.335 0 4.6.708 6.794 1.698v-4.6c-1.557-.779-3.892-1.345-6.653-1.345-5.237 0-7.927 2.265-7.927 5.945m72.475-5.803v20.17h4.318V9.979l1.769 4.035 6.087 11.324h5.379V5.166h-4.247v13.022l-1.628-3.821-4.883-9.201zm-27.319 0h-4.671v20.17h4.671zm-10.05 14.154c0-3.538-1.841-5.166-7.149-6.298-2.902-.637-3.609-1.274-3.609-2.194 0-1.133 1.061-1.628 2.972-1.628 2.336 0 4.601.708 6.795 1.699v-4.6c-1.557-.78-3.893-1.346-6.653-1.346-5.238 0-7.927 2.265-7.927 5.946 0 2.972 1.344 5.308 6.794 6.37 3.185.707 3.893 1.203 3.893 2.264 0 1.062-.708 1.699-2.973 1.699-2.618 0-5.733-.92-7.785-2.123v4.812c1.628.779 3.751 1.699 7.785 1.699 5.592 0 7.857-2.548 7.857-6.3M71.069 5.166v20.17h9.625l1.486-4.387h-6.44V5.166zm-19.039 0v4.317h5.167v15.854h4.741V9.483h5.592V5.166zm-6.866 0h-6.157L32 25.336h5.379l.99-3.396c1.204.353 2.478.566 3.752.566s2.548-.213 3.751-.567l.991 3.398h5.379c-.07 0-7.078-20.171-7.078-20.171M42.05 18.259c-.92 0-1.77-.141-2.548-.354L42.05 9.13l2.548 8.776a9.6 9.6 0 0 1-2.548.354zM97.326 5.166H91.17l-7.078 20.17h5.38l.99-3.396c1.203.353 2.477.566 3.751.566s2.548-.213 3.751-.567l.991 3.398h5.379zm-3.114 13.093c-.92 0-1.77-.141-2.548-.354l2.548-8.776 2.548 8.776a9.6 9.6 0 0 1-2.548.354m75.306-13.093h-6.157l-7.007 20.17h5.379l.991-3.396c1.203.353 2.477.566 3.751.566s2.548-.213 3.751-.567l.991 3.398h5.379zm-3.043 13.093c-.92 0-1.77-.141-2.548-.354l2.548-8.776 2.548 8.776a10 10 0 0 1-2.548.354"></path>
				</svg>
			</header>
			<main id="main">
				<div id="notice">계속하려면 로그인하세요.</div>
				<span id="small_txt">이메일</span>
				<span id="required">*</span><br/>
				<form id="loginForm" action="<c:url value='/login'/>" method="post">
					<div id="useremail-container">
						<input id="email_input" name="email" type="email" placeholder="이메일을 입력하세요"><br/>
					</div>
					<div>
						<input id=saveId type="checkbox">
						<label id="chkbox-txt" for="saveId">내 정보 저장</label>
					</div>
					<button id="login-submit" type="submit">
						<span id="login-txt">계속</span>
					</button><br/>
				</form>
				<div id="login-option">또는 다음을 사용하여 계속하기</div><br/>
				<div id="google-login">
					<button id="google-login-button">
						<span>
							<img src="https://id-frontend.prod-east.frontend.public.atl-paas.net/assets/google-logo.5462b711.svg">
						</span>
						<span id="google-txt">Google</span>
					</button>
				</div>
			</main>
			<footer id="other-option">
				<span class="signIn-signUp">ID찾기</span>
				<span class="dot">•</span>
				<span class="signIn-signUp">회원가입</span>
			</footer>
		</div>
	</div>
</body>
</html>