$(document).on("click",".modify",function(){
	//서서히 나타나는 애니스타일 
	$(".replyModal").fadeIn(200);
	//데이터 담아오기
	var repNum = $(this).attr("data-repNum");
	var repCon = $(this).parent().parent().children(".replyContent").text();
	
	$(".modal_repCon").val(repCon);
	$(".modal_modify_btn").attr("data-repNum", repNum);
});

//삭제
$(document).on("click",".delete",function(){
	//사용자에게 삭제 여부를 확인
	var deleteConfirm = confirm("정말로 삭제하시겠습니까?? :(");
	//만약 삭제를 한다면
	if(deleteConfirm){
		var data = {repNum : $(this).attr("data-repNum")};
		//메모리 줄이고 렌더링하지 않게 ...
		$.ajax({
			url:"/shop/view/deleteReply", type:"post", data:data, success : function(result){
				if(result == 1){ //세션 여부에 따라 다름
					replyList(); //본인인 경우만 삭제
				}else{
					alert("작성자 본인만 삭제 할 수 있습니다 :(")
				}
			},error : function(){alert("로그인을 하셔야 합니다")}
		});
	}
});				