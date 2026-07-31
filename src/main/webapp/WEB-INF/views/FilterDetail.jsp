<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<meta charset="UTF-8">
		<title>Filter Detail</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/FilterDetail.css'/>"/>
	<script src="<c:url value='/resources/js/jquery-4.0.0.min.js'/>"></script>
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
	<input type="hidden" id="searchConditionNo" value="${list[0].searchConditionNo}">

	<header>
		<h1>
			<span>${filterTitle}</span>
			<img id="mark" src="<c:url value='/resources/img/star_yellow.png'/>">
			<button id="filter_detail_button">필터 세부 정보</button>
		</h1>
	</header>

	<div id="condition_container">
		<div id="search_box_container" tabindex="0">
			<img src="<c:url value='/resources/img/search.png'/>">
			<input id="search_task_by_title" placeholder="업무 검색">
		</div>

		<!-- 스페이스 -->
		<div class="filter-dropdown" data-name="space">
			<button type="button" class="filter-dropdown-btn" id="btn_space">스페이스</button>
			<div class="filter-dropdown-panel" id="panel_space" style="display:none;">
				<div class="filter-op-bar">
					<button type="button" class="op-btn active" data-op="=">=</button>
					<button type="button" class="op-btn" data-op="!=">!=</button>
				</div>
				<ul class="filter-op-list" id="list_space">
					<li data-value="">(전체)</li>
					<%-- 3단계: spaceList forEach --%>
				</ul>
			</div>
			<input type="hidden" id="op_space" value="=">
			<input type="hidden" id="search_space" value="">
		</div>

		<!-- 담당자 = creator -->
		<div class="filter-dropdown" data-name="creator">
			<button type="button" class="filter-dropdown-btn" id="btn_creator">담당자</button>
			<div class="filter-dropdown-panel" id="panel_creator" style="display:none;">
				<div class="filter-op-bar">
					<button type="button" class="op-btn active" data-op="=">=</button>
					<button type="button" class="op-btn" data-op="!=">!=</button>
				</div>
				<ul class="filter-op-list" id="list_creator">
					<li data-value="">(전체)</li>
					<%-- 3단계: userList forEach --%>
				</ul>
			</div>
			<input type="hidden" id="op_creator" value="=">
			<input type="hidden" id="search_creator" value="">
		</div>

		<!-- 작업자 = worker -->
		<div class="filter-dropdown" data-name="worker">
			<button type="button" class="filter-dropdown-btn" id="btn_worker">작업자</button>
			<div class="filter-dropdown-panel" id="panel_worker" style="display:none;">
				<div class="filter-op-bar">
					<button type="button" class="op-btn active" data-op="=">=</button>
					<button type="button" class="op-btn" data-op="!=">!=</button>
				</div>
				<ul class="filter-op-list" id="list_worker">
					<li data-value="">(전체)</li>
					<%-- 3단계: userList forEach --%>
				</ul>
			</div>
			<input type="hidden" id="op_worker" value="=">
			<input type="hidden" id="search_worker" value="">
		</div>

		<!-- 우선순위 -->
		<div class="filter-dropdown" data-name="priority">
			<button type="button" class="filter-dropdown-btn" id="btn_priority">우선 순위</button>
			<div class="filter-dropdown-panel" id="panel_priority" style="display:none;">
				<div class="filter-op-bar">
					<button type="button" class="op-btn active" data-op="=">=</button>
					<button type="button" class="op-btn" data-op="!=">!=</button>
				</div>
				<ul class="filter-op-list" id="list_priority">
					<li data-value="">(전체)</li>
					<li data-value="High">High</li>
					<li data-value="Medium">Medium</li>
					<li data-value="Low">Low</li>
				</ul>
			</div>
			<input type="hidden" id="op_priority" value="=">
			<input type="hidden" id="search_priority" value="">
		</div>

		<!-- 상태 -->
		<div class="filter-dropdown" data-name="status">
			<button type="button" class="filter-dropdown-btn" id="btn_status">상태</button>
			<div class="filter-dropdown-panel" id="panel_status" style="display:none;">
				<div class="filter-op-bar">
					<button type="button" class="op-btn active" data-op="=">=</button>
					<button type="button" class="op-btn" data-op="!=">!=</button>
				</div>
				<ul class="filter-op-list" id="list_status">
					<li data-value="">(전체)</li>
					<%-- 3단계: statusList forEach --%>
				</ul>
			</div>
			<input type="hidden" id="op_status" value="=">
			<input type="hidden" id="search_status" value="">
		</div>

		<!-- 기한 -->
		<div class="filter-dropdown" data-name="due">
			<button type="button" class="filter-dropdown-btn" id="btn_due">기한</button>
			<div class="filter-dropdown-panel" id="panel_due" style="display:none;">
				<div class="filter-op-bar">
					<button type="button" class="op-btn active" data-op=">=">>=</button>
					<button type="button" class="op-btn" data-op="<="><=</button>
				</div>
				<div class="filter-due-body">
					<input type="date" id="due_date" class="search_due_date"
					       max="2099-12-31" min="2000-01-01">
					<button type="button" class="due-clear-btn">지우기</button>
				</div>
			</div>
			<input type="hidden" id="op_due" value=">=">
			<input type="hidden" id="search_due" value="">
		</div>

		<button type="button" id="btn_delete_filter">필터 지우기</button>
		<button type="button" id="btn_save_filter">필터 저장</button>
	</div>
	<main>
		<div class="table_container">
			<table>
				<thead>
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
				</thead>
				<tbody id="task_result_body">
					<%@ include file="TaskSearchResult.jsp" %>
				</tbody>
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
				<img src="<c:url value='/resources/img/user.png'/>">
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
					<img src="<c:url value='/resources/img/user.png'/>">
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
					<a><img src="<c:url value='/resources/img/user.png'/>">金成官</a>
					<button type="button" class="delete-user"><img src="<c:url value='/resources/img/close.png'/>"></button>
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
					<a><img src="<c:url value='/resources/img/user.png'/>">Minjae Seo</a>
					<button type="button" class="delete-user"><img src="<c:url value='/resources/img/close.png'/>"></button>
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
