function replyList(){
	var gdsNum = "${view.gdsNum}";
	//비동기식 데이터 요청
	$.getJSON("/shop/view/replyList" + "?n=" + gdsNum, function(data){
		var str = ""; //초기화
		$(data).each(function(){
			console.log(data);
			//날짜 데이터를 보기 쉽게 변환
			var repDate = new Date(this.repDate);
			repDate = repDate.toLocaleDateString("ko-us");
			//html코드 조립
			str += "<li data-repNum='" + this.repNum + "'>"
			+ "<div class='fw-bold'>" + this.userName + "</div>"
			+ "<div class='replyContent'>" + this.repCon + "</div>"
			+ "<div class='small'>" + repDate + "</div>"
			+ "<c:if test='${member != null}'>"//세션이 있어야만 수정/삭제가 가능
			+ "<div class='replyFooter'>"
			+ "<button type='btton' class='modify btn btn-light' data-repNum='" + this.repNum + "'>M</button>"
			+ "<button type='btton' class='delete btn btn-light' data-repNum='" + this.repNum + "'>D</button>"
			+ "</div>"
			+ "</c:if>"
			+ "</li>";
		});
		$("section.replyList ul").html(str);
	});
}