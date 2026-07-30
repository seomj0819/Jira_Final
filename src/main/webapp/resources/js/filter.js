function changeStarButtonImg(el, searchConditionNo) {
	var favorite = el.src.match("star_empty.png") ? "Y" : "N";
	
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
