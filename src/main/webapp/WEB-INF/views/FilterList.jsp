<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Filter</title>
</head>
	<script>
		function changeButtonImg(el) {
			const img = el.querySelector('img');
			  if (img.src.match('up.png')) {
			    img.src = 'img/down.png'; 
			  } else {
			    img.src = 'img/up.png';
			  }
		}
		function changeMarkButtonImg(el) {
		    if (el.src.match('star_black.png')) {
		        el.src = 'img/star_empty.png';
		    } else {
		        el.src = 'img/star_black.png';
		    }
		}
		function changeStarButtonImg(el) {
			const img = el.querySelector('img');
			if(el.src.match('star_empty.png')) {
				el.src = 'img/star_yellow.png';
			} else {
				el.src = 'img/star_empty.png';
			}
		}
		function toggleDropdown() {
			const menu = document.getElementById("dropdownMenu");
			menu.classList.toggle("show");
		}
		window.addEventListener('click', function(event) {
			const menu = document.getElementById("dropdownMenu");
			const button = document.querySelector(".more_button");

			if (!button.contains(event.target) && !menu.contains(event.target)) {
				if (menu.classList.contains('show')) {
					menu.classList.remove('show');
			    }
			}
		});
	</script>
	<style>
		body {
			padding: 10px;
		}
		header {
			display: flex;
			align-items: center;
			justify-content: space-between;
		}
		header > button {
			height: 32px;
			border: none;
			border-radius: 3px;
			color: white;
			background-color: #1868DB;
		}
		button {
			cursor: pointer;
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
			border-top: 1px solid rgba(11, 18, 14, 0.14);
			border-collapse: collapse;
		} 
		th {
			font-size: 12px;
			text-align: left;
		}
		td {
			font-size: 14px;
		}
		.star {
			width: 16px;
		}
		.star-container {
			background-color: white;
			border: none;
			cursor: pointer;
		}
		.filter-title {
			color: #1868DB;
			cursor: pointer;
		}
		.filter-title:hover {
			text-decoration: underline;
		}
		.more_button > img {
			width: 16px;
			height: 16px;
		}
		.more_button {
			border: none;
			background-color: white;
			cursor: pointer;
			width: 24px;
			height: 24px;
			padding: 0px 2px;
			display: flex;
		    align-items: center;
		    justify-content: center;
		}
		#search_filter {
			display: flex;
			column-gap: 8px;
		}
		.dropbox {
			border: 1px solid rgba(11, 18, 14, 0.14);
			border-radius: 3px;
			width: 200px;
			height: 34px;
		}
		.dropbox:focus {
			border: 1px solid rgb(70, 136, 236);
			border-radius: 3px;
			outline: none;
		}
		#search_box_container > img {
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
		tr > th > img {
			margin-left: 6px;
		}
		.sort > img {
			width: 16px; 
			height: 16px;
			margin-bottom: -3px;
		}
		.sort {
			cursor: pointer;
			background-color: white;
			border: none;
		}
		.owner > img , .viewer > img {
			width: 24px;
			height: 24px;
		}
		.owner , .viewer {
			display: flex;
    		align-items: center;
    		column-gap: 5px;
		}
		td:last-child, td:first-child {
			width: 30px;
		}
		.more_button:focus {
			border: 1px solid rgb(24, 104, 219);
			border-radius: 3px;
			background-color: rgb(233, 242, 254);
		}
		.more_button:focus > img {
			filter: brightness(0) saturate(100%) invert(38%) sepia(34%) saturate(3570%) hue-rotate(201deg) brightness(85%) contrast(102%);
		}
		.dropdown_content {
			position: absolute;
			z-index: 400;
			background-color: white;
			border-radius: 4px;
			box-shadow: 0px 4px 12px rgba(30, 31, 33, 0.15);
			width: fit-content;
			width: 120px;
			margin-left: -95px;
			display: none;
		}
		.dropdown_content.show {
			display: block;
		}
		.dropdown_content > button {
			padding: 8px 16px;
			background-color: white;
			border: none;
			width: 120px;
		}
		.dropdown_content > button:hover {
			background-color: rgba(5, 21, 36, 0.06);
		}
		h1 {
			font-size: 24px;
		}
		</style>
<body>
	<header>
		<h1>필터</h1>
		<button>필터 만들기</button>
	</header>
	<main>
		<div id="search_filter">
			<div id="search_box_container" tabindex="0">
				<img src="img/search.png">
				<input id="search_filter_by_title" placeholder="필터 검색">
			</div>
			<select class="dropbox">
				<option value="" selected disabled>소유자</option>
				<option></option>
				<option></option>
			</select>
			<select class="dropbox">
				<option value="" selected disabled>프로젝트</option>
				<option></option>
			</select>
		</div>
		<div>
			<table>
				<tr>
					<th><img class="star" src="img/star_black.png" onclick="changeMarkButtonImg(this)"></th>
					<th>이름<button class="sort" type="button" onclick="changeButtonImg(this)"><img src="img/up.png"></button></th>
					<th>소유자</th>
					<th>조회자</th>
					<th>별표표시</th>
					<th></th>
				</tr>
				<tr>
					<td><button type="button" class="star-container"><img class="star" src="img/star_empty.png" onclick="changeStarButtonImg(this)"></button></td>
					<td><a class="filter-title">생성 30일 이내</a></td>
					<td><div class="owner"><img src="img/user.png"><span>金成官</span></div></td>
					<td><div class="viewer"></div>none</td>
					<td>2명</td>
					<td>
						<button type="button" class="more_button" onclick="toggleDropdown()"><img src="img/more.png"></button>
						<div id="dropdownMenu" class="dropdown_content">
							<button>필터 복사</button>
							<button>편집</button>
							<button>소유자 변경</button>
							<button>삭제</button>
						</div>
					</td>
				</tr>
				<tr>
					<td><button type="button" class="star-container"><img class="star" src="img/star_empty.png" onclick="changeStarButtonImg(this)"></button></td>
					<td><a class="filter-title">완료</a></td>
					<td><div class="owner"><img src="img/user.png"><span>Minjae Seo</span></div></td>
					<td><div class="viewer"><img src="img/user.png"><span>金成官</span></div></td>
					<td>0명</td>
					<td>
						<button type="button" class="more_button" onclick="toggleDropdown()"><img src="img/more.png"></button>
						<div id="dropdownMenu" class="dropdown_content">
							<button>필터 복사</button>
							<button>편집</button>
							<button>소유자 변경</button>
							<button>삭제</button>
						</div>
					</td>
				</tr>
				<tr>
					<td><button type="button" class="star-container"><img class="star" src="img/star_yellow.png" onclick="changeStarButtonImg(this)"></button></td>
					<td><a class="filter-title">Filter for Space</a></td>
					<td><div class="owner"><img src="img/user.png"><span>金成官</span></div></td>
					<td><div class="viewer"><img src="img/user.png"><span>Minjae Seo</span></div></td>
					<td>1명</td>
					<td>
						<button type="button" class="more_button" onclick="toggleDropdown()"><img src="img/more.png"></button>
						<div id="dropdownMenu" class="dropdown_content">
							<button>필터 복사</button>
							<button>편집</button>
							<button>소유자 변경</button>
							<button>삭제</button>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</main>
</body>
</html>