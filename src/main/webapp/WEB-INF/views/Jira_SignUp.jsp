<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jira Sign Up</title>
</head>
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
		color: rgb(41, 42, 46);
		font-size: 16px;
		font-weight: 653;
		height: 20px;
		line-height: 20px;
		text-align: center;
		margin: 0px auto;
		display: inline-block;
   		vertical-align: middle;
	}
	.small-txt {
		color: rgb(80, 82, 88);
		cursor: default;
		display: inline-block;
		font-size: 12px;
		font-weight: 653;
		line-height: 16px;
		margin: 0px auto;
	}
	.required {
		color: rgb(174, 46, 36);
		font-weight: 653;
	}
	#useremail-container {
		align-items: center;
		background-color: rgb(255, 255, 255);
		width: 288px; 
		height: 40px; 
		margin-top: 2px;
		position: relative;
	}
	#email-input {
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
		position: relative;
	}
	#login-submit {
		background-color: rgb(24, 104, 219);
		cursor: pointer;
		display: inline-flex;
		font-size: 14px;
		height: 40px;
		font-weight: 500;
		line-height: 40px;
		width: 320px;
		border: none;
		border-radius: 3px;
		margin-top: 22px;
		text-align: center; 
	}
	#login-txt {
		color: white;
		margin-left: 134px;
		margin: 0 auto
	}
	#login-option{
		margin-top: 24px; 
		color: rgb(80, 82, 88); 
		font-size: 14px; 
		text-align: center;
	}
	#title {
		width: 171px;
		height: 36px;
		margin: 0 auto;
		margin-top: 24px;
		text-align: center;
	}
	#notice > svg {
		color: rgb(0, 135, 90);
		width: 16px;
		height: 16px;
		fill: white;
		margin-left: 4px;
		display: inline-block;
 		vertical-align: middle;
	}
	#email-info {
		width: 320px;
		height: 42px;
		margin-top: 26px;
	}
	#email {
		font-size: 12px;
		margin-bottom: 4px;
	}
	#user-email {
		font-size: 14px;
		font-weight: 700;
		margin: 0px;
	}
	#input-name {
		margin: 8px 0px;
	}
	#toggle-password {
		width: 24px;
   		height: 24px;
   		padding: 6px 0px;
   		box-sizing: border-box;
   		background: none;
   		border: none;
   		position: absolute;
  	 	right: -24px;
 	  	top: 35%;
  		transform: translateY(-50%);
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
				<div id="title">
					<h1 id="notice">이메일 주소 확인<svg width="24" height="24" viewBox="0 0 24 24" role="presentation"><g fill-rule="evenodd"><circle cx="12" cy="12" r="10" fill="currentcolor"></circle><path fill="inherit" d="M9.707 11.293a1 1 0 1 0-1.414 1.414l2 2a1 1 0 0 0 1.414 0l4-4a1 1 0 1 0-1.414-1.414L11 12.586z"></path></g></svg></h1>
					<h2 class="small-txt">Finish setting up your account</h2>
				</div>
				
				<div id="email-info">
					<label id="email">이메일 주소</label><br/>
					<p id="user-email">user_email</p>
				</div>
				
				<div id="input-name">
					<span class="small-txt">전체 이름</span>
					<span class="required">*</span><br/>
					<div id="useremail-container">
						<input id="email-input" placeholder="성명 입력"><br/><br/>
					</div>
				</div>
				
				<div>
					<span class="small-txt">비밀번호</span>
					<span class="required">*</span><br/>
					<div id="useremail-container">
						<input id="email-input" placeholder="비밀번호 입력">
						<button id="toggle-password">
						<span data-vc="icon-undefined" aria-hidden="true" class="_1e0c1o8l _1o9zidpf _vyfuvuon _vwz4kb7n _1szv15vq _1tly15vq _rzyw1osq _17jb1osq _1ksvoz0e _3se1x1jp _re2rglyw _1veoyfq0 _1kg81r31 _jcxd1r8n _gq0g1onz _1trkwc43" style="--icon-primary-color: currentColor;"><svg width="24" height="24" viewBox="0 0 24 24" role="presentation"><g fill="currentcolor" fill-rule="evenodd"><path d="M12 18c-4.536 0-7.999-4.26-7.999-6 0-2.001 3.459-6 8-6 4.376 0 7.998 3.973 7.998 6 0 1.74-3.462 6-7.998 6m0-14C6.48 4 2 8.841 2 12c0 3.086 4.576 8 10 8 5.423 0 10-4.914 10-8 0-3.159-4.48-8-10-8"></path><path d="M11.978 13.984c-1.104 0-2-.897-2-2s.896-2 2-2c1.103 0 2 .897 2 2s-.897 2-2 2m0-6c-2.206 0-4 1.794-4 4s1.793 4 4 4 4-1.794 4-4-1.794-4-4-4"></path></g></svg></span></button><br/><br/>
					</div>
				</div>
				
				<button id="login-submit">
					<span id="login-txt">계속</span>
				</button>
			</main>
		</div>
	</div>
</body>
</html>