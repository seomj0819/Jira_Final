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

		function changeStarButtonImg(el, searchConditionNo) {
			var favorite;
			if (el.src.match('star_empty.png')) {
				favorite = "Y";
			} else {
				favorite = "N";
			}

			fetch("${pageContext.request.contextPath}/filter/favorite", {
				method: "POST",
				headers: {
					"Content-Type": "application/x-www-form-urlencoded"
				},
				body: "searchConditionNo=" + searchConditionNo + "&favorite=" + favorite
			})
			.then(function(res) {
				return res.text();
			})
			.then(function(data) {
				if (data === "ok") {
					if (favorite === "Y") {
						el.src = "${pageContext.request.contextPath}/resources/img/star_yellow.png";
					} else {
						el.src = "${pageContext.request.contextPath}/resources/img/star_empty.png";
					}
				} else {
					alert("즐겨찾기 실패");
				}
			})
			.catch(function(err) {
				console.log(err);
				alert("통신 오류");
			});
		}
		
		function toggleDropdown() {
			const menu = document.getElementById(".dropdown_content");
			menu.classList.toggle("show");
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
		
		$("#search_filter_by_title").on("input", function() {
	        var keyword = $(this).val();
	        var url = "<c:url value='/filter/list/search'/>"
	                + "?keyword=" + encodeURIComponent(keyword);
	        fetch(url)
	            .then(function(res) { return res.text(); })
	            .then(function(html) {
	                $("#filter_result_body").html(html);
	        });
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
					<c:forEach var="filter" items="${filterList}">
						<tr>
							<td>
								<button type="button" class="star-container">
									<c:choose>
										<c:when test="${filter.favorite == 'Y'}">
											<img class="star"
											     src="<c:url value='/resources/img/star_yellow.png'/>"
											     onclick="changeStarButtonImg(this, ${filter.searchConditionNo})">
										</c:when>
										<c:otherwise>
											<img class="star"
											     src="<c:url value='/resources/img/star_empty.png'/>"
											     onclick="changeStarButtonImg(this, ${filter.searchConditionNo})">
										</c:otherwise>
									</c:choose>
								</button>
							</td>
							<td>
							<!-- a태그에 href 없애야 함? 페이지 이동하는거 막긴 해야하는데 -->
								<a class="filter-title"
								   href="<c:url value='/filter/list/detail?searchConditionNo=${filter.searchConditionNo}'/>">
									${filter.searchConditionTitle}
								</a>
							</td>
							<td>
								<div class="owner">-</div>
							</td>
							<td>
								<div class="viewer">-</div>
							</td>
							<td>-</td>
							<td>
								<button type="button" class="more_button" onclick="toggleDropdown(this)">
									<img src="<c:url value='/resources/img/more.png'/>">
								</button>
								<div class="dropdown_content">
									<button>필터 복사</button>
									<button>편집</button>
									<button>소유자 변경</button>
									<button>삭제</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
	</div>
