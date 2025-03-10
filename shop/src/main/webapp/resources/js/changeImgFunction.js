$('#gdsImg').change(function(){ //이미지 미리보기 처리 html 요소에 이벤트리스너를 연결
//사용자가 이 입력을 사용하여 이미지를 선택하면 change이벤트가 트리거 된다
	if(this.files && this.files[0]){ //배열이 채워졌는지(사용자가 파일을 선택했는지 확인)
	//files[0] 선택된 첫 번째 파일에 엑세스 파일 입력은 여러 파일을 선택할 수 있기 때문에
		var reader = new FileReader; //선택된 파일을 읽기 위한 객체를 생성
		reader.onload = function(data){ //이미지를 일긍ㄹ 때 트리거되는 이벤트 핸들러
			$(".select_img img").attr("src", data.target.result).width(100);
			//class select_img 하위에 있는 img태그에 가로 100의 너비로 설정됨
			//이미지의 데이터 URL을 보관
		}
		reader.readAsDataURL(this.files[0]); //첫 번째 선택된 파일을 데이터 URL로 읽음
	}
});

//수량에서 숫자 외에 사용하지 않기를 강제 적용
var regExp = /[^0-9]/gi; //숫자가 아닌 모든 것과 일치하는 정규표현식
//g flag를 지정하면 전역으로 적용
//i flag를 사용하면 대소문자를 구분하지 않음

$("#gdsPrice").keyup(function(){numCheck($(this));});
$("#gdsStock").keyup(function(){numCheck($(this));});

function numCheck(selector){
	var tempVal =selector.val(); //입력필드 현재갑	ㅅ을 검색
	selector.val(tempVal.replace(regExp, ""));
	//숫자(0-9)가 아닌 모든 문자를 제거
}