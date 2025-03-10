
var formObj = $("form[role='form']");
$("#modify_Btn").click(function(){
	formObj.attr("action","/admin/goods/modify");
	formObj.attr("method","get")
	formObj.submit();
});

$("#delete_Btn").click(function(){
	var con = confirm("정말로 삭제 하시겠습니까?")
	if(con){
		formObj.attr("action","/admin/goods/delete");
		formObj.submit();
	}
});