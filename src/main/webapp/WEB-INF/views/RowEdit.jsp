<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Row Edit</title>
	<style>
		* { box-sizing: border-box;}
		html, body {
		 	margin: 0;
		 	height: 320px;
		 	min-width: 382px;
		 	width: 603px;
		}
		#editcard {
			height: 100%;
			width: 100%;
			overflow: auto;
			box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 10px;
			border-radius: 4px;
			padding: 20px;
		}
		*{ font-family: "Atlassian Sans", ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Ubuntu, "Helvetica Neue", sans-serif; }
		#cardheader {
			display: flex;
			justify-content: space-between;
			margin-bottom: 35px;
		}
		#cardheader > b {
			font-size: 20px;
		}
		#exit {
			font-size: 24px;
			color: gray;
			border: none;
			background-color: white;
			cursor: pointer;
			padding-left: 8px;
			padding-right: 8px;
			padding-bottom: 6px;
		}
		#exit:hover {
			background-color: rgba(5,21,36,0.06);
		}
		#iptrname {
			height: 34px;
			width: 95%;
			margin-top: 6px;
			margin-bottom: 10px;
		}
		#delete {
			background-color: white;
			border: 1px solid rgba(11, 18, 14, 0.14);
			font-size: 16px;
			width: 71px;
			height: 33px;
			cursor: pointer;
			margin-top: 100px;
			border-radius: 4px;
		}
		#delete:hover {
			background-color: rgba(11,18,14,0.14);
		}
		#cancel {
			background-color: white;
			border: none;
			border-radius: 4px;
			font-size: 16px;
			height: 33px;
			cursor: pointer;
			margin-left: 330px;
		}
		#cancel:hover {
			background-color: rgba(5,21,36,0.06);
		}
		#update {
			background-color: rgba(5, 21, 36, 0.06);
			border: 1px solid rgba(118, 118, 118, 0.3);
			font-size: 16px;
			color: rgba(8, 15, 33, 0.29);
			height: 33px;
			border-radius: 4px;
			cursor: not-allowed;
		}
	</style>
	<script src="js/jquery-4.0.0.min.js"></script>
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
			<form action="RowsAndStatus.html">
				이름<span style="color: red;">*</span>
				<br/>
				<input id="iptrname" type="text" value="currname" name="rName" required/>
				<br/>
				<button id="delete" type="button">열 삭제</button>
				<button id="cancel" type="button">취소</button>
				<input id="update" type="submit" value="업데이트" disabled="true"/>
			</form>
		</div>
	</div>
</body>
</html>