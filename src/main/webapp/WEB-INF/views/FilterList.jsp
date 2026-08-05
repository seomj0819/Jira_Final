<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value='/resources/css/FilterList.css'/>"/>
	<title>Filter</title>
	<script>
		function changeButtonImg(el) {
			const img = el.querySelector('img');
			  if (img.src.match('up.png')) {
			    img.src = '/resources/img/down.png'; 
			  } else {
			    img.src = '/resources/img/up.png';
			  }
		}
		
		function changeMarkButtonImg(el) {
		    if (el.src.match('star_black.png')) {
		        el.src = '/resources/img/star_empty.png';
		    } else {
		        el.src = '/resources/img/star_black.png';
		    }
		}
		
		function changeButtonImg(el) {
			var img = el.querySelector('img');
			if (img.src.match('up.png')) {
				img.src = '${pageContext.request.contextPath}/resources/img/down.png';
			} else {
				img.src = '${pageContext.request.contextPath}/resources/img/up.png';
			}
		}

		function changeMarkButtonImg(el) {
			if (el.src.match('star_black.png')) {
				el.src = '${pageContext.request.contextPath}/resources/img/star_empty.png';
			} else {
				el.src = '${pageContext.request.contextPath}/resources/img/star_black.png';
			}
		}
		
		window.addEventListener('click', function(event) {
			const menu = document.getElementById("dropdownMenu");
			const button = document.querySelector(".more_button");
													// 이부분도 null로 떨어지는 문제가 있음
			if (!button.contains(event.target) && !menu.contains(event.target)) {
				if (menu.classList.contains('show')) {
					menu.classList.remove('show');
			    }
			}
		});
		
		function searchFilterList() {
		    var keyword = $("#search_filter_by_title").val() || "";
		    var ownerNo = $("#search_owner").val() || "";
		    var spaceKey = $("#search_space").val() || "";

		    var url = "<c:url value='/filter/list/search'/>"
		        + "?keyword=" + encodeURIComponent(keyword);

		    if (ownerNo !== "") {
		        url += "&ownerNo=" + encodeURIComponent(ownerNo)
		            + "&operatorOwnerNo=" + encodeURIComponent("=");
		    }
		    if (spaceKey !== "") {
		        url += "&spaceKey=" + encodeURIComponent(spaceKey)
		            + "&operatorSpaceKey=" + encodeURIComponent("=");
		    }

		    fetch(url)
		        .then(function(res) { return res.text(); })
		        .then(function(html) {
		            $("#filter_result_body").html(html);
		        });
		}
		
		var $container = $(this).closest(".selection_container");
		var mainType = $container.find(".mainCategory").val();
		var $sub = $container.find(".subCategory");
		var value = $sub.val();
		var text = $sub.find("option:selected").text();
		if (!value) return;

		var $row = $('<div class="added-item"></div>');
		if (mainType === "user") {
		  $row.attr("data-user-no", value);
		} else if (mainType === "space") {
		  $row.attr("data-space-key", value);
		}
		$row.append('<span>' + text + '</span>');
		$row.append('<button type="button" class="delete-user">X</button>');
		$("#viewer_list").append($row);

		$(function() {
		    $("#search_filter_by_title").on("input", searchFilterList);
		    $("#search_owner").on("change", searchFilterList);
		    $("#search_space").on("change", searchFilterList);
		});
	</script>
	<div class="filter-list">
	<header>
		<h1>필터</h1>
		<button>필터 만들기</button>
	</header>
	<main>
		<div id="search_filter">
			<div id="search_box_container" tabindex="0">
				<img src="<c:url value='/resources/img/search.png'/>">
				<input id="search_filter_by_title" placeholder="필터 검색">
			</div>
			<select id="search_owner" class="dropbox">
				<option value="">소유자</option>
				<c:forEach var="owner" items="${ownerList}">
					<option value="${owner.userNo}">${owner.userName}</option>
				</c:forEach>
			</select>
			<select id="search_space" class="dropbox">
				<option value="">스페이스</option>
				<c:forEach var="space" items="${spaceList}">
					<option value="${space.spaceKey}">${space.spaceTitle}</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<table>
				<tr>
					<th>
						<img class="star"
						     src="<c:url value='/resources/img/star_black.png'/>"
						     onclick="changeMarkButtonImg(this)">
					</th>
					<th>
						이름
						<button class="sort" type="button" onclick="changeButtonImg(this)">
							<img src="<c:url value='/resources/img/up.png'/>">
						</button>
					</th>
					<th>소유자</th>
					<th>조회자</th>
					<th>별표표시</th>
					<th></th>
				</tr>
				<tbody id="filter_result_body">
					<%@ include file="FilterSearchResult.jsp" %>
				</tbody>
			</table>
		</div>
	</main>
	</div>
