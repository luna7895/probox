let element_layer = document.getElementById('layer');

closeDaumPostcode = () =>{
	element_layer.style.display = 'none';
	//변수 엘리먼트 레이어를 함수 실행하면 보이지 않게 된다
}


function sample_PostCode(){
	
	new daum.Postcode({ //팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분
		oncomplete: function(data) {
			var addr = ''; //주소 변수
			var extraAddr = ''; //참고 항목 변수
			
			//사용자가 선택한 주소 타입에 따라 해당 주소값을 가져온다
			if(data.userSelectedType === 'R'){ //사용자가 도로명주소를 선택했을 경우 
				addr = data.roadAddress;
			} else { //사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}
			
			//사용자가 선택한 주소가 도로명 타입일 때 참고항목을 조합
			if(data.userSelectedType === 'R'){
				//법정동명이 잇을 경우 추가(법정리는 제외)
				//법정동의 경우 마지막 문자가 "동/로/가"로 끝난다
				if(data.bname !== '' && /[동|로|가]&/g.test(data.bname)){
					extraAddr += data.bname;
				}
				//건물명이 있고, 공동주택일 경우 추가
				if(data.buildingName !== '' && data.apartment === 'Y'){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				//표시할 참고항목이 있을 경우 괄호까지 추가한 최중 문자열을 만듦
				if(extraAddr !== ''){
					extraAddr = '('+ extraAddr +')';
				}
				//addr += extraAddr;
				document.getElementById("sample2_extraAddress").value = extraAddr;
			}else{
				document.getElementById("sample2_extraAddress").value = '';
				//addr += ' ';
			}
			//우편번호와 주소 정보를 해당 필드에 넣는다
			document.getElementById('sample2_postcode').value = data.zonecode;
			document.getElementById('sample2_address').value = addr;
			document.getElementById('sample2_detailAddress').focus();
			element_layer.style.display = 'none'; 
			/*$(".address_input_1").val(data.zonecode);
			$(".address_input_2").val(addr);
			//주소가 선택되고 주소에 나머지 내용을 적기 위해 인풋 3번에 속성에 읽기 전용을 거짓으로 만듦
			$(".address_input_3").attr("readonly", false);
			$(".address_input_3").focus();*/
		}, width: '100%', height: '100%', maxSuggestitems: 5
	}).embed(element_layer);
	
	//iframe을 넣은 element를 보이게 한다
	element_layer.style.display = 'block';
	//함수 실행
	initLayerPosition = () =>{
		let width = 300; let height = 400; let borderWidth = 5;
		//위에서 선언한 값들을 실제 element에 넣는다
		element_layer.style.width = width + 'px';
		element_layer.style.height = height + 'px';
		element_layer.style.border = borderWidth + 'px solid';
		element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
		element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
	}
}