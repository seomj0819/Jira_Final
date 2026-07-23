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
					<h1 class="main-title">ì¤íì´ì¤ ì´ë¦ ì§ì </h1>
					<span class="header-subtitle">íì íëë ë³íë¡ íìëì´ ììµëë¤</span>
					<span class="necessary">ï¼</span>
				</div>
			</header>
			<main>
				<div id="input-container">
					<div id="title-container">
						<span class="title">ì´ë¦</span>
						<span class="necessary">ï¼</span><br/>
						<input type="text" placeholder="í ì´ë¦, íë¡ì í¸ ëª©í, ë§ì¼ì¤í¤ ë±ì ì¬ì©í´ë³´ê¸°">
				</div>
					<div id="key-container">
						<span class="title">í¤</span>
						<span class="necessary">ï¼</span><br/>
						<input type="text">
					</div>
					<div id="invite-users">
						<span class="main-title">í ì´ëíê¸°</span><br/>
						<span class="header-subtitle">Jiraìì ì´ë¯¸ í¨ê» ê³µë ììí ì¬ì©ìë¥¼ ì¶ê°íê±°ë ìë¡ì´ ì¬ì©ìë¥¼ ì´ëíì¸ì.</span><br/>
						<a class="title">ì´ë¦ ëë ì´ë©ì¼ ìë ¥</a>
						<div id="email-input">
							<input type="text" placeholder="ì´ë©ì¼ì ìë ¥íì¸ì">
						</div>
					</div>
					<div id="user-roll-container">
						<a class="title">ì­í </a><br/>
						<select id="user-roll">
							<option value="admin" selected>ê´ë¦¬ì</option>
							<option value="editor">í¸ì§ì</option>
							<option value="viewer">ì¡°íì</option>
						</select>
					</div>
				</div>
			</main>
			<footer>
				<div id="button-container">
					<input type="reset" id="cancle-button" value="ì´ì ">
					<input type="submit" id="submit-button" value="ì ì¶">
				</div>
			</footer>
		</form>
	</div>
</body>
</html>