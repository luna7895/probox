$(".modal_modify_btn").click(function(){
	var modifyConfirm = confirm("정말로 수정하시겠습니까?");
	if(modifyConfirm){
		var data ={ repNum : $(this).attr("data-repNum"),
			repCon : $(".modal_repCon").val()
		};
		$.ajax({
			url:"/shop/view/modifyReply", type:"post", data:data, success:function(result){
				if(result == 1){
					replyList(); $(".replyModal").fadeOut(200);
				}else{
					alert("작성자 본인만 할 수 있습니다")
				}
			},error:function(){
				alert("로그인 하셔야 합니다")
			}
		});
	}
});
//수정을 취소하면 서서히 사라짐
$(".modal_cancel").click(function(){
	$(".replyModal").fadeOut(200);
});