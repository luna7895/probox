//$(".")+ 버튼을 누르면 수량이 증가되는데 상품의 전체 수량보다 커지지 않음
$(".plus").click(function(){
	let num = $(".numBox").val();
	let plusNum = Number(num) + 1;
	let stock = $(".gdsStock_hidden");
	
	if(plusNum >= stock){
		$(".numBox").val(num);
	}else{
		$(".numBox").val(plusNum);
	}
});
$(".minus").click(function(){
	let num = $(".numBox").val();
	let minusNum = Number(num) - 1;
	
	if(minusNum <= 0){
		$(".numBox").val(num);
	}else{
		$(".numBox").val(minusNum);
	}
});