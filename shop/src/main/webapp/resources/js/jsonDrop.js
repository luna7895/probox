//컨트롤러에서 데이터 받기
//var jsonData = JSON.parse('${category}');
//서버에서 전달된 데이터를 JSON형식으로 파싱하여 jsonData변수에 저장
var cate1Arr = new Array();
var cate1Obj = new Object();
//배열과 객체를 초기화

//1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i=0; i<jsonData.length; i++){
//jsonData배열을 순회하면서 level이 "1"인 항목을 찾아 
//cate1Obj에 cateCode와 catename을 저장하고 이를 cate1arr 배열에 추가
	if(jsonData[i].level == "1"){
		cate1Obj = new Object(); //초기화
		cate1Obj.cateCode = jsonData[i].cateCode;
		cate1Obj.cateName = jsonData[i].cateName;
		cate1Arr.push(cate1Obj);
	}
}
//1차 분류 셀렉트 박스에 데이터를 삽입
var cate1Select = $("select.category1")

for(var i=0; i<cate1Arr.length; i++){ //만약 100이라면 100에 있는 하위카테고리가 들어감
	cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>" + cate1Arr[i].cateName + "</option>");
}
//비어져있는 option tag에 밸류를 넣어줌
/*
<option valye="">New</option>
그렇지만 컴퓨터가 내가 어떤 카테고릴 선택할지는 gpt도 모름
이 이후에 부모 카테고리를 선택하는 이벤트가 발생
 */
$(document).on("change", "select.category1", function(){ 
	 //select.category1이 변경되었다면 실행되는 함수
	 var cate2Arr = new Array();
	 var cate2Obj = new Object();
	 
	 //2차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i=0; i<jsonData.length; i++){
		if(jsonData[i].level == "2"){
			cate2Obj = new Object(); //초기화
			cate2Obj.cateCode = jsonData[i].cateCode;
			cate2Obj.cateName = jsonData[i].cateName;
			cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
			cate2Arr.push(cate2Obj);
		}
	}

	var cate2Select = $("select.category2");
	cate2Select.children().remove();

	$("option:selected", this).each(function(){
		var selectVal = $(this).val();
		cate2Select.append("<option value='" + selectVal + "'>전체</option>");
		
		for(var i=0; i<cate2Arr.length; i++){
			if(selectVal == cate2Arr[i].cateCodeRef){
				cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>" + cate2Arr[i].cateName + "</option>")
			}
		}
	});
});