<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="task" items="${taskList}">
	<tr>
		<td>
			<div class="task_title" data-taskno ="${task.taskNo}">
				<c:choose>
					<c:when test="${task.upperTaskNo == null}">
						<div class="lowerTask">
							<img src="<c:url value='/resources/img/check.png'/>">
							<span>${task.spaceKey}</span>
							<span>-</span>
							<span>${task.taskNo}</span>
							<span>  ${task.taskTitle}</span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="upperTask">
							<img src="<c:url value='/resources/img/lowerTask.png'/>">
							<span>${task.spaceKey}</span>
							<span>-</span>
							<span>${task.taskNo}</span>
							<span>  ${task.taskTitle}</span>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</td>
		<td>
		<!-- 담당자(생성자) -->
			<div>
				<img src="<c:url value='/resources/img/user.png'/>">
					<span>${task.creatorName}</span>
			</div>
		</td>
		<td>
		<!-- 작업자 -->
			<div>
				<img src="<c:url value='/resources/img/user.png'/>">
						<span>${empty task.workerName ? '-' : task.workerName}</span>
			</div>
		</td>
		<td>
		<!-- 우선순위 -->
			<div class="priority">
				<c:choose>
					<c:when test="${task.priority == 'High'}">
						<img src="<c:url value='/resources/img/high.png'/>">
						<span>High</span>
					</c:when>
					<c:when test="${task.priority == 'Medium'}">
						<img src="<c:url value='/resources/img/medium.png'/>">
						<span>Medium</span>
					</c:when>
					<c:otherwise>
						<img src="<c:url value='/resources/img/low.png'/>">
						<span>low</span>
					</c:otherwise>
				</c:choose>
			</div>
		</td>
		<td>
<%-- 							<span class="task_status">${task.status == 0 이면 Low, 1 이면 Medium, 2 이면 High}</span> --%>
		</td>
		<td>
			<!-- History에 만든 날짜 -->
		</td>
		<td>
			<!-- History에 업데이트한 날짜 -->
		</td>
		<td>
			<!-- 기한 -->
			<span>${task.dueDate}</span>
		</td>
	</tr>
</c:forEach>