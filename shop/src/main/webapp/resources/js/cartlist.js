$(function(){ //비동기 문서가 실행되기 전에 로드하는 것을 방지
	$("#allCheck").click(function(){
		let chk = $("#allCheck").prop("checked");
		if(chk){
			$(".chBox").prop("checked", true);
		}else{
			$(".chBox").prop("checked", false);
		}
	})
	
	//chBox
	$(".chBox").click(function(){
		$("#allCheck").prop("checked", false);
	});
	
	//delete
	$(".delete_${cartList.cartNum}_btn").click(function(){
		let confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if(confirm_val){
			let checkArr = new Array();
			
			checkArr.push($(this).attr("data-cartNum"));
			
			$.ajax({
				url:"/shop/deleteCart", type:"post", data:{chbox:checkArr}, success : function(result){
					if(result == 1) {
						location.href="/shop/cartList";
					}else{
						alert("삭제 실패");
					}
				}
			});
		}
	});
	//슬라이딩 애니메이션
	$("orderOpen_btn").click(function(){
		$("orderInfo").slideDown();
		$("orderOpen_btn").slideUp();
	});
	
	$(".selectDelete_btn").click(function(){
		let confirm_val = confirm("정말 삭제하시겠습니까?")
		if(confirm_val){
			let checkArr = new Array();
			//체크된 체크박스의 갯수만큼 반복
			$("input[class='chBox']:checked").each(function(){
				checkArr.push($(this).attr("data-carNum"));
			});
			$.ajax({
				url:"/shop/deleteCart", type:"post", traditional: true, data:{chBox : checkArr}, success : function(result){
					if(result == 1){location.href="/shop/cartList";}else{alert("삭제 실패");}
				}
			});
		}
	});
	
	$(".cancel_btn").click(function(){
		$(".orderInfo").slideUp(); $(".orderOpen_btn"). slideDown();
	});
});