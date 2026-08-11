<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value='/resources/css/FilterList.css'/>"/>
	<title>Filter</title>
	<script>
		function sortFilterTable() {
		    var tbody = document.getElementById("filter_result_body");
		    if (!tbody) return;
	
		    var rows = Array.prototype.slice.call(tbody.querySelectorAll("tr"));
		    var favStar = document.getElementById("sort_favorite_star");
		    var titleImg = document.getElementById("sort_title_img");
	
		    var favoriteFirst = favStar && favStar.src.indexOf("star_black.png") >= 0;
	
		    var titleAsc = titleImg && titleImg.src.indexOf("up.png") >= 0;
	
		    rows.sort(function(a, b) {
		        var aFav = a.getAttribute("data-favorite") || "N";
		        var bFav = b.getAttribute("data-favorite") || "N";
	
		        if (aFav !== bFav) {
		            if (favoriteFirst) {
		                // Y가 위로
		                if (aFav === "Y") return -1;
		                if (bFav === "Y") return 1;
		            } else {
		                // N이 위로
		                if (aFav === "N") return -1;
		                if (bFav === "N") return 1;
		            }
		        }
	
		        var aTitle = (a.getAttribute("data-title") || "").toLowerCase();
		        var bTitle = (b.getAttribute("data-title") || "").toLowerCase();
	
		        if (aTitle < bTitle) return titleAsc ? -1 : 1;
		        if (aTitle > bTitle) return titleAsc ? 1 : -1;
		        return 0;
		    });
	
		    for (var i = 0; i < rows.length; i++) {
		        tbody.appendChild(rows[i]);
		    }
		}
		
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
		            sortFilterTable();
		        });
		}

		$(function() {
		    $("#search_filter_by_title").on("input", searchFilterList);
		    $("#search_owner").on("change", searchFilterList);
		    $("#search_space").on("change", searchFilterList);
		    
		    $("#btn_create_filter").click(function() {
		        var title = prompt("필터 이름을 입력하세요");
		        if (!title) {
		            return;
		        }

		        var form = document.createElement("form");
		        form.method = "POST";
		        form.action = ctx + "/filter/create";

		        var input = document.createElement("input");
		        input.type = "hidden";
		        input.name = "searchConditionTitle";
		        input.value = title;
		        form.appendChild(input);

		        document.body.appendChild(form);
		        form.submit();
		    });
		    
		    $("#sort_favorite_star").on("click", function() {
		        var $img = $(this);
		        if (($img.attr("src") || "").indexOf("star_black.png") >= 0) {
		            $img.attr("src", ctx + "/resources/img/star_empty.png");
		        } else {
		            $img.attr("src", ctx + "/resources/img/star_black.png");
		        }
		        sortFilterTable();
		    });

		    $("#sort_title_btn").on("click", function() {
		        var $img = $("#sort_title_img");
		        if (($img.attr("src") || "").indexOf("up.png") >= 0) {
		            $img.attr("src", ctx + "/resources/img/down.png");
		        } else {
		            $img.attr("src", ctx + "/resources/img/up.png");
		        }
		        sortFilterTable();
		    });

		    sortFilterTable();
		});
	</script>
	<div class="filter-list">
	<header>
		<h1>필터</h1>
		<button type="button" id="btn_create_filter">필터 만들기</button>
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
						<img id="sort_favorite_star" class="star"
						     src="<c:url value='/resources/img/star_black.png'/>">
					</th>
					<th>
						이름
						<button id="sort_title_btn" class="sort" type="button">
							<img id="sort_title_img" src="<c:url value='/resources/img/up.png'/>">
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
