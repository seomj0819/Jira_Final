function changeStarButtonImg(el, searchConditionNo) {
	var favorite = el.src.match("star_empty.png") ? "Y" : "N";

  	fetch(ctx + "/filter/favorite", {
   		method: "POST",
    	headers: { "Content-Type": "application/x-www-form-urlencoded" },
   		body: "searchConditionNo=" + searchConditionNo + "&favorite=" + favorite
  	})
  	.then(function(res) { return res.text(); })
  	.then(function(data) {
	    if (data === "ok") {
	      el.src = favorite === "Y"
	        ? ctx + "/resources/img/star_yellow.png"
	        : ctx + "/resources/img/star_empty.png";
	    } else {
	      alert("즐겨찾기 실패");
	    }
  	})
  	.catch(function(err) {
    	console.log(err);
    	alert("통신 오류");
  	});
}

function toggleDropdown(btn) {
	var menu = btn.nextElementSibling;
	if (!menu) return;
	
	var opened = document.querySelectorAll(".dropdown_content.show");
	for (var i = 0; i < opened.length; i++) {
	  if (opened[i] !== menu) {
	    opened[i].classList.remove("show");
	  }
	}
	menu.classList.toggle("show");
}

if (!window._filterDropdownBound) {
	window._filterDropdownBound = true;
	document.addEventListener("click", function(event) {
		var inBtn = event.target.closest(".more_button");
		var inMenu = event.target.closest(".dropdown_content");
		if (inBtn || inMenu) return;
	
		var opened = document.querySelectorAll(".dropdown_content.show");
		for (var i = 0; i < opened.length; i++) {
			opened[i].classList.remove("show");
		}
	});
}

document.addEventListener("click", function(e) {
    var btn = e.target.closest(".btn_list_delete");
    if (!btn) return;

    if (!confirm("이 필터를 지우시겠습니까?")) {
        return;
    }

    var searchConditionNo = btn.getAttribute("data-no");
    var params = new URLSearchParams();
    params.append("searchConditionNo", searchConditionNo);

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