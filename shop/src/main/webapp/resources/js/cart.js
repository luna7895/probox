$(".addCart_btn").click(function(){
	const gdsNum = $("#gdsNum").val();
	const cartStock = $(".numBox").val();
	
	const data = {gdsNum: gdsNum, cartStock:cartStock};
	
	$.ajax({
		url:"/shop/view/addCart", type:"POST", data:data, success: function(){
			alert("카트 담기 성공"); $(".numBox").val("1");
		},error : function(){alert("카트 담기 실패");}
	});
});
