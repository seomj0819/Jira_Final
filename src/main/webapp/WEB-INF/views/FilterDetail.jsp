<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<meta charset="UTF-8">
		<title>Filter Detail</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/FilterDetail.css'/>"/>
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
				"user": ["Minjae Seo", "金成官"],
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
<div class="filter-detail">
	<header>
		<h1>
			<span>${filter.searchConditionTitle}</span>
			<img id="mark" src="img/star_yellow.png">
			<button id="filter_detail_button">필터 세부 정보</button>
		</h1>
	</header>
	<div id="condition_container">
		<div id="search_box_container" tabindex="0">
				<img src="img/search.png">
				<input id="search_task_by_title" placeholder="업무 검색">
			</div>
		<select>
			<option value="" selected disabled hidden>스페이스</option>
			<option></option>
			<option></option>
		</select>
		<select>
			<option value="" selected disabled hidden>담당자</option>
			<option></option>
			<option></option>
		</select>
		<select>
			<option value="" selected disabled hidden>작업자</option>
			<option></option>
			<option></option>
		</select>
		<select>
			<option value="" selected disabled hidden>우선 순위</option>
			<option></option>
			<option></option>
		</select>
		<select>
			<option value="" selected disabled hidden>상태</option>
			<option></option>
			<option></option>
		</select>
			<input type="date" id="due_date" class="search_due_date" max="2099-12-31" min="2000-01-01" placeholder="기한 선택">
			<button type="reset">필터 지우기</button>
			<button type="submit">필터 저장</button>
	</div>
	<main>
		<div class="table_container">
			<table>
				<tr>
					<th>업무</th>
					<th>담당자</th>
					<th>작업자</th>
					<th>우선순위</th>
					<th>상태</th>
					<th>만듦</th>
					<th>업데이트</th>
					<th>기한</th>
				</tr>
				<c:forEach var="task" items="${TaskList}">
					<tr>
						<td>
							<div class="task_title">
								<c:choose>
									<c:when test="${task.upperTaskNo == null}">
										<div>
											<img src="<c:url value='/resources/img/check.png'/>">
											<span>${task.spaceKey}</span>
											<span>-</span>
											<span>${task.taskNo}</span>
											<span> 상위작업</span>
										</div>
									</c:when>
									<c:otherwise>
										<div>
											<img src="<c:url value='/resources/img/lowerTask.png'/>">
											<span>${task.spaceKey}</span>
											<span>-</span>
											<span>${task.taskNo}</span>
											<span> 하위작업</span>
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
			</table>
		</div>
	</main>
	<div class="shadow"></div>
	<div id="popup_overlay" class="popup-overlay">
		<div class="popup-content">
			<h2>필터 세부 정보</h2>
			<hr>
			<div id="popup_description">
				<div>
					<h3>
						<div class="popup-subtitle-container">
							<span class="popup-subtitle">설명</span>
							<span class="edit-button">이름 및 설명 편집</span>
						</div>
					</h3>
				</div>
				<span class="text">Filter Description</span>
			</div>
			<hr>
			<div id="popup_owner">
				<img src="img/user.png">
				<span class="user-info">소유자: </span>
				<span class="user-info">Minjae Seo</span>
			</div>
			<hr>
			<div id="popup_authority">
				<h3>
					<div class="popup-subtitle-container">
						<span class="popup-subtitle">권한</span>
						<span class="edit-button">권한 편집</span>
					</div>
				</h3>
				<p class="sub-text">표시 대상:</p>
				<span class="text">비공개</span>
				<br/>
				<p class="sub-text">편집 가능한 대상:</p>
				<div class="user-profile">
					<img src="img/user.png">
					<span class="text">金成官</span>
				</div>
			</div>
		</div>
	</div>
	<div id="edit_filter_popup" class="edit-filter-popup">
		<div class="popup-content">
			<h2>필터 편집</h2>
			<hr>
			<span class="text">필수 필드는 별표로 표시되어 있습니다</span>
			<span class="required">*</span>
			<div id="content_container">
				<div id="title_container">
					<span class="sub-title">이름</span>
					<span class="required">*</span>
					<br/>
					<input type="text" id="new_title" placeholder="original title">
				</div>
				<div id="description_container">
					<span class="sub-title">설명</span>
					<br/>
					<input type="text" id="new_description">
				</div>
				<div class="selection_container">
					<span class="sub-title">조회자</span><br/>
					<select class="select-box mainCategory">
						<option value="none" selected>비공개</option>
						<option value="user">사용자</option>
						<option value="space">스페이스</option>
					</select>
					<select name="viewerSub" class="scope_select subCategory" disabled>
						<option value="" hidden selected>--항목을 선택해주세요--</option>
					</select> 
					<button type="button" class="add-button">추가</button>
				</div>
				<div id="viewer_list" class="add-user-roll">
					<a><img src="img/user.png">金成官</a>
					<button type="button" class="delete-user"><img src="img/close.png"></button>
				</div>
				<div class="selection_container">
					<span class="sub-title">편집자</span><br/>
					<select class="select-box mainCategory">
						<option value="none" selected>비공개</option>
						<option value="user">사용자</option>
						<option value="space">스페이스</option>
					</select>
					<select name="editorSub" class="scope_select subCategory" disabled>
						<option value="" hidden selected>--항목을 선택해주세요--</option>
					</select> 
					<button type="button" class="add-button">추가</button>
				</div>
				<div id="editor_list" class="add-user-roll">
					<a><img src="img/user.png">Minjae Seo</a>
					<button type="button" class="delete-user"><img src="img/close.png"></button>
				</div>
				<div id="button_container">
					<button type="reset" id="cancle_button">취소</button>
					<button type="submit" id="submit_button">저장</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	const priorityTags = document.querySelectorAll('.task_status');
	
	priorityTags.forEach(tag => {
	  const status = tag.textContent.trim();
	
	  if (status === '해야 할 일') {
	    tag.style.backgroundColor = '#E2E3E5';
	  } else if (status === '진행 중') {
	    tag.style.backgroundColor = '#8FB8F6';
	  } else if (status === '완료') {
	    tag.style.backgroundColor = '#BADC7A';
	  }
	});
</script>
