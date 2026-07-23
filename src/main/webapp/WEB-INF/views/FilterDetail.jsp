<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Filter Detail</title>
	</head>
	<script src="js/jquery-4.0.0.min.js"></script>
	<script>
		$(function() {
			let layerPopUp = $("#popup_overlay");
			let editPopUp = $("#edit_filter_popup");
			
			$("#filter_detail_button").click(function() {
				layerPopUp.show();
			});
			
			$(".edit-button").click(function() {
				$(".shadow").show();
				editPopUp.show();
			});
			
			$("#cancle_button, #submit_button").click(function() {
				$(".shadow").hide();
				editPopUp.css("display", "none");
			});
			
			$("#mark").click(function() {
			    let currentSrc = $(this).attr('src');

			    if (currentSrc.match('star_empty.png')) {
			        $(this).attr('src', 'img/star_yellow.png');
			    } else {
			        $(this).attr('src', 'img/star_empty.png');
			    }
			});
			
			$(document).mouseup(function(e) {
				let temp1 = layerPopUp.has(e.target).length;
				let temp2 = editPopUp.has(e.target).length;
				
				if(temp1 === 0 && temp2 === 0) {
					layerPopUp.css("display", "none");
				}
				if(temp2 === 0) {
					$(".shadow").hide();
					editPopUp.css("display", "none");
				}
			});
			
			$('select[name=search_game]').change(function(){
				  var $this = $(this).val();
				  $(this).closest('.form-row').find('select[name=' + $this +']').siblings().hide();
				  $(this).closest('.form-row').find('select[name=' + $this +']').show();
			});
			
		})
			var selectObject = {
				"user": ["Minjae Seo", "éæå®"],
				"space": ["space01", "space02"]
			}
			window.onload = function() {
			var containers = document.querySelectorAll(".selection_container");
			
				containers.forEach(function(container) {
					
					var mainSel = container.querySelector(".mainCategory");
					var subSel = container.querySelector(".subCategory");
					
					mainSel.onchange = function() {
						subSel.length = 1;
						subSel.disabled = true;
						
						var selectedValue = this.value;
						
						if(selectedValue === "none" || !selectObject[selectedValue]) return;
						
						var subObjects = selectObject[selectedValue];
						
						for(var i = 0 ; i < subObjects.length ; i++) {
							subSel.options[subSel.options.length] = new Option(subObjects[i], subObjects[i]);
						}
						
						subSel.disabled = false;
					}
				});
			}
	</script>
	<style>
		body {
			padding: 10px;
			margin: 8px;
		}
		table, tr, td, th {
			padding: 10px;
		}
		table{
			border: 1px solid rgba(11, 18, 14, 0.14);
			border-collapse: collapse;
			width: 100%;
			margin-top: 25px;
		}
		td, th {
			border: 1px solid rgba(11, 18, 14, 0.14);
			border-collapse: collapse;
		} 
		th {
			font-size: 12px;
			text-align: left;
		}
		td {
			font-size: 14px;
		}
		#search_box_container>img {
			width: 16px;
			height: 16px;
		}
		#search_filter_by_title {
			border: none;
			height: 30px;
			width: 211px;
		}
		#search_box_container {
			border: 1px solid rgba(11, 18, 14, 0.14);
			border-radius: 3px;
			width: 237px;
			height: 32px;
			display: flex;
			flex-direction: row;
			align-items: center;
			justify-content: space-around;
		}
		#search_filter_by_title:focus {
			outline: none;
		}
		#search_box_container:focus-within {
			border: 1px solid rgb(70, 136, 236);
			border-radius: 3px;
			outline: none;
		}
		h1 > img {
			width: 16px;
			height: 16px;
		}
		h1>span {
			font-size: 24px;
		}
		input[type=date]::-webkit-datetime-edit-text {
			-webkit-appearance: none;
			display: none;
		}
		input[type=date]::-webkit-datetime-edit-month-field {
			-webkit-appearance: none;
			display: none;
		}
		input[type=date]::-webkit-datetime-edit-day-field {
			-webkit-appearance: none;
			display: none;
		}
		input[type=date]::-webkit-datetime-edit-year-field {
			-webkit-appearance: none;
			display: none;
		}
		input[type="date"]::before {
			content: attr(placeholder);
			width: 100%;
			color: #aaa;
		}
		input[type="date"] {
			height: 34px; 
			padding: 2px 8px;
			box-sizing: border-box;
			font-size: 14px;
			border: 1px solid rgba(11, 18, 14, 0.14);
			border-radius: 3px;
			display: inline-flex;
			align-items: center; 
			vertical-align: middle;
		}
		div > img {
			width: 16px;
			height: 16px;
		}
		.priority > img {
			filter: invert(41%) sepia(99%) saturate(1633%) hue-rotate(15deg) brightness(97%) contrast(105%);
		}
		.task_status {
			font-size: 13px;
			font-weight: 400;
			border: none;
			border-radius: 3px;
			padding: 0px 5px;
		}
		td > div {
			display: inline-flex;
			align-items: center;
			gap: 3px;
		}
		div > img {
			display: block;
		}
		tr td:first-child {
			width: 449px;
		}
		tr td:second-child {
			width: 203px;
		}
		.table_container {
		    width: 100%;
		    overflow-x: auto;
		}
		.table_container table {
		    width: 100%;
		    border-collapse: collapse;
		}
		.table_container td, 
		.table_container th {
		    white-space: nowrap; 
		    padding: 8px 12px;
		}
		.table_container td > div {
		    display: inline-flex;
		    align-items: center;
		    gap: 6px;
		}
		.task_title > img {
			filter: invert(30%) sepia(87%) saturate(3015%) hue-rotate(218deg) brightness(101%) contrast(101%);
		}
		#condition_container {
			display: flex;
			flex-direction: row;
			gap: 10px;
			height: 30px;
			padding: 3px;
		}
		#condition_container > select {
			padding: 0px 10px;
			border: 1px solid rgba(11, 18, 14, 0.19);
			border-radius: 3px;
			height: 34px;
			font-size: 14px;
		}
		#condition_container > input {
			height: 33px;
		}
		#condition_container > button {
			height: 34px;
			border: 1px solid rgba(11, 18, 14, 0.19);
			border-radius: 3px;
			background-color: white;
			font-size: 14px;
		}
		h1 > button {
			color: rgb(24, 104, 219);
			font-size: 14px;
			background-color: white;
			border: 1px solid white;
			cursor: pointer;
			padding: 0px 10px;
			height: 32px;
		}
		h1 > button:hover {
			text-decoration: underline;
		}
		h1 > button:focus {
			background-color: rgb(24, 104, 219, 0.13);
			color: rgb(24, 104, 219);
			border: 1px solid rgb(24, 104, 219);
			border-radius: 3px;
		}
		.table_container {
			margin-top: 20px;
		}
		.popup-overlay {
			display: none;
			position: absolute;
			width: 480px;
			height: 500px;
			max-height: 631px;
			padding: 20px;
			box-shadow: 0px 15px 30px rgba(30, 31, 33, 0.15);
			box-sizing: border-box;
			background-color: white;
		    top: 84px;
    		left: 220px;
		}
		.popup-overlay.show {
			display: block;
		}
		.popup-content hr {
			border: none;
			height: 1px;
			margin: 15px 0;
			width: 100%;
			display: block;
			background-color: rgba(11, 18, 14, 0.14);
			z-index: 100;
		}
		.popup-content h3 {
			font-size: 14px;
		}
		#popup_owner {
			display: flex;
			align-items: center;
			gap: 7px;
		}
		#popup_owner > img {
			width: 40px;
			height: 40px;
		}
		.user-profile {
			display: flex;
			border: 1px solid black;
			border-radius: 10px;
			width: fit-content;
			padding: 0px 5px;
			align-items: center;
			margin-top: 5px;
		}
		.popup-subtitle-container {
			display: flex;
			justify-content: space-between;
		}
		.edit-button {
			color: #1868DB;
			font-weight: 400;
			cursor: pointer;
		}
		.edit-button:hover {
			text-decoration: underline;
		}
		#edit_filter_popup {
			width: 600px;
			max-height: 588px;
			height: fit-content;
			padding: 15px;
			display: none;
			position: fixed;
			left: 50%;
			top: 50%;
			margin-left: -300px;
			margin-top: -294px;
			background-color: white;
			z-index: 200;
			border-radius: 3px;
		}
		.required {
			color: #AE2E24;
			font-size: 12px;
		}
		h2 {
			font-size: 20px;
		}
		.sub-title {
			font-size: 12px;
			font-weight: 653;
		}
		.text {
			color: rgb(80, 82, 88);
		}
		#new_title {
			width: 550px;
			height: 16px;
			padding: 8px 6px;
			border: 1px solid black;
			border-radius: 3px;
		}
		#content_container {
			display: flex;
		    flex-direction: column;
		    gap: 11px;
		}
		#new_description {
			width: 550px;
			height: 36px;
			padding: 6px 7px;
			border: 1px solid black;
			border-radius: 3px;
		}
		#new_title:focus {
			border: 1px solid rgb(70, 136, 236);
			border-radius: 3px;
		}
		.select-box {
			width: 160px;
			height: 32px;
			padding: 0px 6px;
		}
		#button_container {
			display: flex;
		    flex-direction: row;
		    justify-content: flex-end;
		    gap: 5px;
		}
		#button_container > button {
			padding: 0px 10px;
			border: none;
			cursor: pointer;
			border-radius: 3px;
			height: 32px;
			font-size: 14px;
		}
		#cancle_button:hover {
			text-decoration: underline;
		}
		#submit_button {
			color: white;
			background-color: #1868DB;
		}
		#submit_button:hover {
			background-color: rgb(21, 88, 188);
		}
		.shadow{
			position: fixed;
			left: 0;
			top: 0;
			background: rgba(0, 0, 0, 0.52);
			width: 100%;
			height: 100vh;
			display: none;
			z-index: 150;
		}
		.sub-text {
			font-size: 12px;
			font-weight: 653;
			margin-top: 15px;
		}
		.text, .popup-subtitle, .user-info {
			font-size: 14px;
		}
		.sub-text {
			margin-top: 15px;
		}
		.scope_select {
			width: 300px;
			height: 32px;
			padding: 0px 6px;
		}
		.add-button {
			padding: 0px 10px;
			height: 32px;
			position: relative;
    		top: 2px;
    		left: 79px;
    		background-color: white;
    		border-radius: 3px;
    		border: 1px solid rgba(30, 31, 33, 0.15);
		}
		.delete-user {
			border: none;
			cursor: pointer;
			background-color: white;
			
		}
		.delete-user > img {
			width: 16px;
			height: 16px;
		}
		.add-user-roll > a > img {
			width: 20px;
			heithg: 20px;
		}
		.add-user-roll {
			font-size: 14px;
			display: flex;
   			align-items: center;
   			justify-content: space-between;
		}
		.add-user-roll > a {
			display: flex;
    		align-items: center;
    		gap: 5px;
		}
	</style>
<body>
	<header>
		<h1>
			<span>ìì± 30ì¼ ì´ë´</span>
			<img id="mark" src="img/star_yellow.png">
			<button id="filter_detail_button">íí° ì¸ë¶ ì ë³´</button>
		</h1>
	</header>
	<div id="condition_container">
		<div id="search_box_container" tabindex="0">
				<img src="img/search.png">
				<input id="search_filter_by_title" placeholder="ìë¬´ ê²ì">
			</div>
		<select>
			<option value="" selected disabled hidden>ì¤íì´ì¤</option>
			<option></option>
			<option></option>
		</select>
		<select>
			<option value="" selected disabled hidden>ë´ë¹ì</option>
			<option></option>
			<option></option>
		</select>
		<select>
			<option value="" selected disabled hidden>ììì</option>
			<option></option>
			<option></option>
		</select>
		<select>
			<option value="" selected disabled hidden>ì°ì  ìì</option>
			<option></option>
			<option></option>
		</select>
		<select>
			<option value="" selected disabled hidden>ìí</option>
			<option></option>
			<option></option>
		</select>
			<input type="date" id="due_date" class="search_due_date" max="2099-12-31" min="2000-01-01" placeholder="ê¸°í ì í">
			<button type="reset">íí° ì§ì°ê¸°</button>
			<button type="submit">íí° ì ì¥</button>
	</div>
	<main>
		<div class="table_container">
			<table>
				<tr>
					<th>ìë¬´</th>
					<th>ë´ë¹ì</th>
					<th>ììì</th>
					<th>ì°ì ìì</th>
					<th>ìí</th>
					<th>ë§ë¦</th>
					<th>ìë°ì´í¸</th>
					<th>ê¸°í</th>
				</tr>
				<tr>
					<td><div class="task_title"><img src="img/check.png"><a>KEY-01</a><a>ìì ìì</a></div></td>
					<td><div><img src="img/user.png"><span>Minjae Seo</span></div></td>
					<td><div><img src="img/user.png"><span>éæå®</span></div></td>
					<td><div class="priority"><img src="img/low.png"><span>Low</span></div></td>
					<td><span class="task_status">ì§í ì¤</span></td>
					<td><span>2026ë 6ì 19ì¼ ì¤í 2:40</span></td>
					<td><span>2026ë 7ì 03ì¼ ì¤í 4:38</span></td>
					<td><span>2026ë 8ì 01ì¼ ì¤í 2:40</span></td>
				</tr>
				<tr>
					<td><div class="task_title"><img src="img/lowerTask.png"><a>KEY-02</a><a>íì ìì</a></div></td>
					<td><div><img src="img/user.png"><span>éæå®</span></div></td>
					<td><div><img src="img/user.png"><span>Minjae Seo</span></div></td>
					<td><div class="priority"><img src="img/medium.png"><span>Medium</span></div></td>
					<td><span class="task_status">í´ì¼ í  ì¼</span></td>
					<td><span>2026ë 6ì 19ì¼ ì¤í 2:40</span></td>
					<td><span>2026ë 7ì 03ì¼ ì¤í 4:38</span></td>
					<td><span>2026ë 8ì 01ì¼ ì¤í 2:40</span></td>
				</tr>
				<tr>
					<td><div class="task_title"><img src="img/lowerTask.png"><a>KEY-03</a><a>íì ìì</a></div></td>
					<td><div><img src="img/user.png"><span>Minjae Seo</span></div></td>
					<td><div><img src="img/user.png"><span>éæå®</span></div></td>
					<td><div class="priority"><img src="img/high.png"><span>High</span></div></td>
					<td><span class="task_status">ìë£</span></td>
					<td><span>2026ë 6ì 19ì¼ ì¤í 2:40</span></td>
					<td><span>2026ë 7ì 03ì¼ ì¤í 4:38</span></td>
					<td><span>2026ë 8ì 01ì¼ ì¤í 2:40</span></td>
				</tr>
			</table>
		</div>
	</main>
	<div class="shadow"></div>
	<div id="popup_overlay" class="popup-overlay">
		<div class="popup-content">
			<h2>íí° ì¸ë¶ ì ë³´</h2>
			<hr>
			<div id="popup_description">
				<div>
					<h3>
						<div class="popup-subtitle-container">
							<span class="popup-subtitle">ì¤ëª</span>
							<span class="edit-button">ì´ë¦ ë° ì¤ëª í¸ì§</span>
						</div>
					</h3>
				</div>
				<span class="text">Filter Description</span>
			</div>
			<hr>
			<div id="popup_owner">
				<img src="img/user.png">
				<span class="user-info">ìì ì: </span>
				<span class="user-info">Minjae Seo</span>
			</div>
			<hr>
			<div id="popup_authority">
				<h3>
					<div class="popup-subtitle-container">
						<span class="popup-subtitle">ê¶í</span>
						<span class="edit-button">ê¶í í¸ì§</span>
					</div>
				</h3>
				<p class="sub-text">íì ëì:</p>
				<span class="text">ë¹ê³µê°</span>
				<br/>
				<p class="sub-text">í¸ì§ ê°ë¥í ëì:</p>
				<div class="user-profile">
					<img src="img/user.png">
					<span class="text">éæå®</span>
				</div>
			</div>
		</div>
	</div>
	<div id="edit_filter_popup" class="edit-filter-popup">
		<div class="popup-content">
			<h2>íí° í¸ì§</h2>
			<hr>
			<span class="text">íì íëë ë³íë¡ íìëì´ ììµëë¤</span>
			<span class="required">*</span>
			<div id="content_container">
				<div id="title_container">
					<span class="sub-title">ì´ë¦</span>
					<span class="required">*</span>
					<br/>
					<input type="text" id="new_title" placeholder="original title">
				</div>
				<div id="description_container">
					<span class="sub-title">ì¤ëª</span>
					<br/>
					<input type="text" id="new_description">
				</div>
				<div class="selection_container">
					<span class="sub-title">ì¡°íì</span><br/>
					<select class="select-box mainCategory">
						<option value="none" selected>ë¹ê³µê°</option>
						<option value="user">ì¬ì©ì</option>
						<option value="space">ì¤íì´ì¤</option>
					</select>
					<select name="viewerSub" class="scope_select subCategory" disabled>
						<option value="" hidden selected>--í­ëª©ì ì íí´ì£¼ì¸ì--</option>
					</select> 
					<button type="button" class="add-button">ì¶ê°</button>
				</div>
				<div id="viewer_list" class="add-user-roll">
					<a><img src="img/user.png">éæå®</a>
					<button type="button" class="delete-user"><img src="img/close.png"></button>
				</div>
				<div class="selection_container">
					<span class="sub-title">í¸ì§ì</span><br/>
					<select class="select-box mainCategory">
						<option value="none" selected>ë¹ê³µê°</option>
						<option value="user">ì¬ì©ì</option>
						<option value="space">ì¤íì´ì¤</option>
					</select>
					<select name="editorSub" class="scope_select subCategory" disabled>
						<option value="" hidden selected>--í­ëª©ì ì íí´ì£¼ì¸ì--</option>
					</select> 
					<button type="button" class="add-button">ì¶ê°</button>
				</div>
				<div id="editor_list" class="add-user-roll">
					<a><img src="img/user.png">Minjae Seo</a>
					<button type="button" class="delete-user"><img src="img/close.png"></button>
				</div>
				<div id="button_container">
					<button type="reset" id="cancle_button">ì·¨ì</button>
					<button type="submit" id="submit_button">ì ì¥</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	const priorityTags = document.querySelectorAll('.task_status');
	
	priorityTags.forEach(tag => {
	  const status = tag.textContent.trim();
	
	  if (status === 'í´ì¼ í  ì¼') {
	    tag.style.backgroundColor = '#E2E3E5';
	  } else if (status === 'ì§í ì¤') {
	    tag.style.backgroundColor = '#8FB8F6';
	  } else if (status === 'ìë£') {
	    tag.style.backgroundColor = '#BADC7A';
	  }
	});
</script>
</html>