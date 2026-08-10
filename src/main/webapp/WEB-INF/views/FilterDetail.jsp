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
			
			$("#submit_button").off("click").on("click", function(e) {
			    e.preventDefault();

			    var params = new URLSearchParams();
			    params.append("searchConditionNo", $("#searchConditionNo").val());
			    params.append("searchConditionTitle", $("#new_title").val() || "");
			    params.append("searchConditionDescription", $("#new_description").val() || "");

			    // 조회자
			    $("#viewer_list .added-item").each(function() {
			        var userNo = $(this).attr("data-user-no");
			        var spaceKey = $(this).attr("data-space-key");
			        if (userNo) params.append("viewerUserNos", userNo);
			        if (spaceKey) params.append("viewerSpaceKeys", spaceKey);
			    });

			    // 편집자
			    $("#editor_list .added-item").each(function() {
			        var userNo = $(this).attr("data-user-no");
			        var spaceKey = $(this).attr("data-space-key");
			        if (userNo) params.append("editorUserNos", userNo);
			        if (spaceKey) params.append("editorSpaceKeys", spaceKey);
			    });

			    fetch(ctx + "/filter/list/detail/editInfo", {
			        method: "POST",
			        headers: {
			            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
			        },
			        body: params.toString()
			    })
			    .then(function() {
			        location.href = ctx + "/filter/list/detail?searchConditionNo="
			            + $("#searchConditionNo").val();
			    });
			});
			
			$("#cancle_button").on("click", function() {
			    $(".shadow").hide();
			    $("#edit_filter_popup").hide();
			});
			
			$("#btn_save_filter").click(function() {
			    var params = new URLSearchParams();
			    params.append("searchConditionNo", $("#searchConditionNo").val());

			    var spaceKey = $("#search_space").val();
			    if (spaceKey) {
			        params.append("spaceKey", spaceKey);
			        params.append("operatorSpace", $("#op_space").val() || "=");
			    }

			    var creatorNo = $("#search_creator").val();
			    if (creatorNo) {
			        params.append("creatorNo", creatorNo);
			        params.append("operatorCreator", $("#op_creator").val() || "=");
			    }

			    var workerNo = $("#search_worker").val();
			    if (workerNo) {
			        params.append("workerNo", workerNo);
			        params.append("operatorWorker", $("#op_worker").val() || "=");
			    }

			    var priority = $("#search_priority").val();
			    if (priority) {
			        params.append("priority", priority);
			        params.append("operatorPriority", $("#op_priority").val() || "=");
			    }

			    var statusNo = $("#search_status").val();
			    if (statusNo) {
			        params.append("statusNo", statusNo);
			        params.append("operatorStatus", $("#op_status").val() || "=");
			    }

			    var dueDate = $("#search_due").val();
			    if (dueDate) {
			        params.append("dueDate", dueDate);
			        params.append("operatorDueDate", $("#op_due").val() || ">=");
			    }

			    fetch(ctx + "/filter/list/detail/save", {
			        method: "POST",
			        headers: {
			            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
			        },
			        body: params.toString()
			    })
			    .then(function() {
			        location.href = ctx + "/filter/list/detail?searchConditionNo="
			            + $("#searchConditionNo").val();
			    });
			});
			
			$("#btn_delete_filter").click(function() {
			    if (!confirm("이 필터를 지우시겠습니까?")) {
			        return;
			    }

			    var params = new URLSearchParams();
			    params.append("searchConditionNo", $("#searchConditionNo").val());

			    fetch(ctx + "/filter/list/detail/delete", {
			        method: "POST",
			        headers: {
			            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
			        },
			        body: params.toString()
			    })
			    .then(function() {
			        location.href = ctx + "/filter/list";
			    });
			});
			
			$("#btn_add_viewer").click(function() {
			    var $box = $(this).closest(".selection_container");
			    var mainType = $box.find(".mainCategory").val();
			    var value = $box.find(".subCategory").val();
			    var text = $box.find(".subCategory option:selected").text();

			    if (!value) {
			        return;
			    }

			    var $row = $('<div class="added-item"></div>');
			    if (mainType === "user") {
			        $row.attr("data-user-no", value);
			    } else if (mainType === "space") {
			        $row.attr("data-space-key", value);
			    }
			    $row.append("<span>" + text + "</span>");
			    $row.append('<button type="button" class="delete-user">X</button>');
			    $("#viewer_list").append($row);
			});

			$("#btn_add_editor").click(function() {
			    var $box = $(this).closest(".selection_container");
			    var mainType = $box.find(".mainCategory").val();
			    var value = $box.find(".subCategory").val();
			    var text = $box.find(".subCategory option:selected").text();

			    if (!value) {
			        return;
			    }

			    var $row = $('<div class="added-item"></div>');
			    if (mainType === "user") {
			        $row.attr("data-user-no", value);
			    } else if (mainType === "space") {
			        $row.attr("data-space-key", value);
			    }
			    $row.append("<span>" + text + "</span>");
			    $row.append('<button type="button" class="delete-user">X</button>');
			    $("#editor_list").append($row);
			});

			$("#viewer_list, #editor_list").on("click", ".delete-user", function() {
			    $(this).closest(".added-item").remove();
			});
			
			$("#mark").click(function() {
			    var $img = $(this);
			    var currentSrc = $img.attr("src") || "";
			    var searchConditionNo = $("#searchConditionNo").val();

			    var favorite = currentSrc.indexOf("star_empty.png") >= 0 ? "Y" : "N";

			    fetch(ctx + "/filter/favorite", {
			        method: "POST",
			        headers: {
			            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
			        },
			        body: "searchConditionNo=" + searchConditionNo + "&favorite=" + favorite
			    })
			    .then(function(res) { return res.text(); })
			    .then(function(result) {
			        if (result !== "ok") return;

			        $img.attr(
			            "src",
			            favorite === "Y"
			                ? ctx + "/resources/img/star_yellow.png"
			                : ctx + "/resources/img/star_empty.png"
			        );
			    });
			});
			
/* 			$("#search_task_by_title").oninput(function() {
				console.log();
			});
			 */
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
			    "user": [
			        <c:forEach var="user" items="${userList}" varStatus="st">
			            { value: "${user.userNo}", text: "${user.userName}" }<c:if test="${!st.last}">,</c:if>
			        </c:forEach>
			    ],
			    "space": [
			        <c:forEach var="space" items="${spaceList}" varStatus="st">
			            { value: "${space.spaceKey}", text: "${space.spaceTitle}" }<c:if test="${!st.last}">,</c:if>
			        </c:forEach>
			    ]
			};
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
							subSel.options[subSel.options.length] = new Option(subObjects[i].text, subObjects[i].value);
						}
						
						subSel.disabled = false;
					}
					
				});
				
				// 1) 버튼 클릭 → 그 드롭다운만 열기/닫기
				$(".filter-dropdown-btn").on("click", function(e) {
					e.stopPropagation();
					
					var $panel = $(this).siblings(".filter-dropdown-panel");
					var alreadyOpen = $panel.is(":visible");
					
					closeAllFilterDropdowns();
					
					if (!alreadyOpen) {
						$panel.show();
					}
				});
				
				// 2) 연산자 버튼 (=, !=, >=, <=)
				$(".op-btn").on("click", function(e) {
					e.stopPropagation();
					
					var $dropdown = $(this).closest(".filter-dropdown");
					var op = $(this).attr("data-op");
					var name = $dropdown.attr("data-name"); // space, creator, ...
					
					$dropdown.find(".op-btn").removeClass("active");
					
					$(this).addClass("active");
					
					$("#op_" + name).val(op);
					
					refreshFilterButtonText($dropdown);
					searchTaskList();
				});
				
				// 3) 목록에서 값 선택
				$(".filter-op-list li").on("click", function(e) {
					e.stopPropagation();
					
					var $dropdown = $(this).closest(".filter-dropdown");
					var name = $dropdown.attr("data-name");
					var value = $(this).attr("data-value");
					var text = $(this).text();
					
					if (value === undefined) {
						value = "";
					}
					
					$("#search_" + name).val(value);
					
					refreshFilterButtonText($dropdown, text);
					$dropdown.find(".filter-dropdown-panel").hide();
					searchTaskList();
				});
				
				// 4) 기한(date)
				$("#due_date").on("change", function() {
					var $dropdown = $(this).closest(".filter-dropdown");
					var value = $(this).val() || "";
					
					$("#search_due").val(value);
					
					searchTaskList();
					
					refreshFilterButtonText($dropdown, value);
				});
				
				// 5) 기한 지우기
				$(".due-clear-btn").on("click", function(e) {
					e.stopPropagation();
					
					var $dropdown = $(this).closest(".filter-dropdown");
					
					$("#due_date").val("");
					$("#search_due").val("");
					
					refreshFilterButtonText($dropdown);
					
					searchTaskList();
					
					$dropdown.find(".filter-dropdown-panel").hide();
				});
				
				// 6) 화면 다른 곳 클릭 → 전부 닫기
				$(document).on("click", function() {
					closeAllFilterDropdowns();
				});
				
				$(".filter-dropdown-panel").on("click", function(e) {
					e.stopPropagation();
				});
				
				$(".filter-dropdown").each(function() {
				    var $dropdown = $(this);
				    var name = $dropdown.attr("data-name");
				    var op = $("#op_" + name).val();
				    var value = $("#search_" + name).val();

				    $dropdown.find(".op-btn").removeClass("active");
				    $dropdown.find('.op-btn[data-op="' + op + '"]').addClass("active");

				    var text = "";
				    if (value) {
				        var $li = $dropdown.find('.filter-op-list li[data-value="' + value + '"]');
				        if ($li.length > 0) {
				            text = $li.text();
				        } else {
				            text = value;
				        }
				    }
				    refreshFilterButtonText($dropdown, text);
				});
			}
			
			function closeAllFilterDropdowns() {
				$(".filter-dropdown-panel").hide();
			}
			// 버튼에 보이는 글자 바꾸기
			function refreshFilterButtonText($dropdown, selectedText) {
				var name = $dropdown.attr("data-name");
				var op = $("#op_" + name).val();
				var value = $("#search_" + name).val();
				var $btn = $dropdown.find(".filter-dropdown-btn");
				var titles = {
					space: "스페이스",
					creator: "담당자",
					worker: "작업자",
					priority: "우선 순위",
					status: "상태",
					due: "기한"
				};
				// 값 없으면 원래 이름만
				if (!value) {
					$btn.text(titles[name]);
					return;
				}
				// 목록에서 고른 글자가 있으면 그걸 쓰고, 없으면 value 사용
				if (!selectedText) {
					selectedText = value;
				}
				$btn.text(op + " " + selectedText);
			}
			
			function searchTaskList() {
			    var url = ctx + "/filter/list/detail/search?keyword="
			        + encodeURIComponent($("#search_task_by_title").val() || "");

			    var spaceKey = $("#search_space").val();
			    if (spaceKey) {
			        url += "&spaceKey=" + encodeURIComponent(spaceKey)
			            + "&operatorSpaceKey=" + encodeURIComponent($("#op_space").val() || "=");
			    }

			    var creatorNo = $("#search_creator").val();
			    if (creatorNo) {
			    	url += "&creatorNo=" + encodeURIComponent(creatorNo)
			    		+ "&operatorCreatorNo=" + encodeURIComponent($("#op_creator").val() || "=");
			    }

			    var workerNo = $("#search_worker").val();
			    if (workerNo) {
			    	url += "&workerNo=" + encodeURIComponent(workerNo)
			    		+ "&operatorWorkerNo=" + encodeURIComponent($("#op_worker").val() || "=");
			    }

			    var priority = $("#search_priority").val();
			    if (priority) {
			    	url += "&priority=" + encodeURIComponent(priority)
			    		+ "&operatorPriority=" + encodeURIComponent($("#op_priority").val() || "=");
			    }

			    var statusNo = $("#search_status").val();
			    if (statusNo) {
			    	url += "&statusNo=" + encodeURIComponent(statusNo)
			    		+ "&operatorStatusNo=" + encodeURIComponent($("#op_status").val() || "=");
			    }

			    var dueDate = $("#search_due").val();
			    if (dueDate) {
			    	url += "&dueDate=" + encodeURIComponent(dueDate)
			    		+ "&operatorDueDate=" + encodeURIComponent($("#op_due").val() || ">=");
			    }
			    
			    fetch(url)	
			        .then(function(res) { return res.text(); })
			        .then(function(html) {
			            $("#task_result_body").html(html);
			        });
			}

			$("#search_task_by_title").on("input", searchTaskList);
	</script>
<main>
	<div class="filter-detail">
	<input type="hidden" id="searchConditionNo" value="${list[0].searchConditionNo}">

	<header>
		<h1>
			<span>${filterTitle}</span>
			<c:choose>
				<c:when test="${list[0].favorite == 'Y'}">
					<img id="mark" src="<c:url value='/resources/img/star_yellow.png'/>">
				</c:when>
				<c:otherwise>
					<img id="mark" src="<c:url value='/resources/img/star_empty.png'/>">
				</c:otherwise>
			</c:choose>
			<button id="filter_detail_button">필터 세부 정보</button>
		</h1>
	</header>
	</div>
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
					<c:forEach var="space" items="${spaceList}">
			  			<li data-value="${space.spaceKey}">${space.spaceTitle}</li>
					</c:forEach>
				</ul>
			</div>
			<input type="hidden" id="op_space" value="${empty list[0].operatorSpace ? '=' : list[0].operatorSpace}">
			<input type="hidden" id="search_space" value="${savedSpaceKey}">
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
					<c:forEach var="user" items="${userList}">
						<li data-value="${user.userNo}">${user.userName}</li>
					</c:forEach>
				</ul>
			</div>
			<input type="hidden" id="op_creator" value="${empty list[0].operatorCreator ? '=' : list[0].operatorCreator}">
			<input type="hidden" id="search_creator" value="${savedCreatorNo}">
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
					<c:forEach var="user" items="${userList}">
						<li data-value="${user.userNo}">${user.userName}</li>
					</c:forEach>
				</ul>
			</div>
			<input type="hidden" id="op_worker" value="${empty list[0].operatorWorker ? '=' : list[0].operatorWorker}">
			<input type="hidden" id="search_worker" value="${savedWorkerNo}">
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
			<input type="hidden" id="op_priority" value="${empty list[0].operatorPriority ? '=' : list[0].operatorPriority}">
			<input type="hidden" id="search_priority" value="${savedPriority}">
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
			<input type="hidden" id="op_status" value="${empty list[0].operatorStatus ? '=' : list[0].operatorStatus}">
			<input type="hidden" id="search_status" value="${savedStatusNo}">
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
					       value="${savedDueDate}"
					       max="2099-12-31" min="2000-01-01">
					<button type="button" class="due-clear-btn">지우기</button>
				</div>
			</div>
			<input type="hidden" id="op_due" value="${empty list[0].operatorDueDate ? '>=' : list[0].operatorDueDate}">
			<input type="hidden" id="search_due" value="${savedDueDate}">
		</div>

		<button type="button" id="btn_delete_filter">필터 지우기</button>
		<button type="button" id="btn_save_filter">필터 저장</button>
	</div>
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
				<span class="text">${list[0].searchConditionDescription}</span>
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
					<input type="text" id="new_title" value="${list[0].searchConditionTitle}">
				</div>
				<div id="description_container">
					<span class="sub-title">설명</span>
					<br/>
					<input type="text" id="new_description" value="${list[0].searchConditionDescription}">
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
					<button type="button" class="add-button" id="btn_add_viewer">추가</button>
				</div>
				<div id="viewer_list" class="add-user-roll">
					<c:forEach var="acc" items="${accessList}">
						<c:if test="${acc.accessType == 'viewer'}">
							<c:if test="${acc.accessUserNo != 0}">
								<div class="added-item" data-user-no="${acc.accessUserNo}">
									<span>${acc.accessUserNo}</span>
									<button type="button" class="delete-user">X</button>
								</div>
							</c:if>
							<c:if test="${not empty acc.accessSpaceKey}">
								<div class="added-item" data-space-key="${acc.accessSpaceKey}">
									<span>${acc.accessSpaceKey}</span>
									<button type="button" class="delete-user">X</button>
								</div>
							</c:if>
						</c:if>
					</c:forEach>
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
					<button type="button" class="add-button" id="btn_add_editor">추가</button>
				</div>
				<div id="editor_list" class="add-user-roll">
					<c:forEach var="acc" items="${accessList}">
						<c:if test="${acc.accessType == 'editor'}">
							<c:if test="${acc.accessUserNo != 0}">
								<div class="added-item" data-user-no="${acc.accessUserNo}">
									<span>${acc.accessUserNo}</span>
									<button type="button" class="delete-user">X</button>
								</div>
							</c:if>
							<c:if test="${not empty acc.accessSpaceKey}">
								<div class="added-item" data-space-key="${acc.accessSpaceKey}">
									<span>${acc.accessSpaceKey}</span>
									<button type="button" class="delete-user">X</button>
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
				<div id="button_container">
					<button type="reset" id="cancle_button">취소</button>
					<button type="submit" id="submit_button">저장</button>
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
