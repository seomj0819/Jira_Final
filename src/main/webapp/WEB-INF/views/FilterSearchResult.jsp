<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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