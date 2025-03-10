<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script>
	hello = () => {
	alert("저는 매번 볼 때마다 열릴거임")
	}
</script>

<!-- 아래 페이지 디렉티브 인클루드 -->
<jsp:include page="../include/header.jsp" flush="false" />

<div class="container-fluid bg-gradient-primary3">
<div class="row justify-content-center">	
<div class="col-10">
	
	<div class="card o-hidden border-0 shadow-lg my-5">
    <div class="card-body p-3">
    <div class="row justify-content-center gap-3">
	
		
		<div class="col-12">
			<jsp:include page="../include/breadcrumb.jsp" />
		</div>
		
		<h1 class="m-3 ps-5">장바구니</h1>
		
		<div class="col-lg-6">
		<ul class="list-group list-group-flush">
			
			<li class="list-group-item">
				<!-- 모두 선택 -->
				<div class="allCheck">
					<script type="text/javascript">
						$(function(){ //비동기 문서가 실행되기 전에 로드하는 것을 방지
							$("#allCheck").click(function(){
								let chk = $("#allCheck").prop("checked");
								if(chk){
									$(".chBox").prop("checked", true);
								}else{
									$(".chBox").prop("checked", false);
								}
							});
						});
					</script>
					
					<div class=" d-flex flex-row-reverse">
						<input
						 type="checkbox"
						 name="allCheck"
						 id="allCheck"
						 class="form-check"
						/>
						<label for="allCheck" class="form-label mx-2">모두 선택</label>
					</div>
					
					<div class="d-flex flex-row-reverse">
						<button
						 type="button"
						 class="selectDelete_btn btn btn-outline-danger"
						>선택삭제</button>
						<script>
							$(".selectDelete_btn").click(function(){
								var confirm_val = confirm("정말 삭제하시겠습니까?")
								if(confirm_val){
									let checkArr = new Array();
									//체크된 체크박스의 갯수만큼 반복
									$("input[class='chBox']:checked").each(function(){
										console.log("ID:", $(this).attr("id"), "data-cartNum:", $(this).attr("data-cartNum"), "체크 여부:", $(this).prop("checked"));
										checkArr.push($(this).attr("data-cartNum"));
									});
									console.log("체크된 박스 개수:", $("input[class='chBox']:checked").length);
									console.log("삭제 요청 데이터:", checkArr); //디버깅용 로그
									$.ajax({
										url:"/shop/deleteCart", type:"POST", data:{"chbox[]": checkArr}, traditional: true, success : function(result){
											console.log("서버 응답:", result); //디버깅용 로그
											if(result == 1){location.href="/shop/cartList";}else{alert("삭제 실패");}
										}, error: function(xhr, status, error){
											console.log("AJAX 요청 실패:", xhr.responseText); //에러 확인
											console.log("상태 코드:", xhr.status); //에러 확인
											console.log("오류 메시지:", error); //에러 확인
										}
									});
								}
							});
						</script>
					</div>
				</div>
			</li>
			
			<!-- 변수 선언 -->
			<c:set var="sum" value="0" />
			<c:forEach items="${cartList}" var="cartList">
				<li class="list-group-item">
					<div class="d-flex justify-content-between">
						<div class="checkBox">
							<input
							 type="checkbox" 
							 id="chBox"
							 name="chBox" 
							 class="chBox" 
							 data-cartNum="${cartList.cartNum }"
							/>
							<script>
								//chBox
								$(".chBox").click(function(){
									$("#allCheck").prop("checked", false);
								});
							</script>
						</div>
						<div class="delete d-flex flex-row-reverse">
							<button
							 type="button" 
							 class="delete_${cartList.cartNum}_btn btn btn-close btn-sm" 
							 data-cartNum="${cartList.cartNum }"
							 aria-label="Close"></button>
							<script>
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
							</script>
						</div>
					</div>
					<div class="d-flex gap-3">
						<div class="thumb-container">
							<img src="${cartList.gdsThumbImg}"/>
						</div>
						<div class="w-50">
							<p>상품명 ${cartList.gdsName }</p>
							<p>개당 가격 <fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}"/> 원</p>
							<p>구입 수량 ${cartList.cartStock } 개</p>
							<p>최종 가격 <fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}"/> 원</p>
						</div>
					</div>
				</li>
				<!-- 반복할 때마다 sum에 상품 가격(gdsPrice) * 상품 갯수(cartStock)만큼을 더함 -->
				<c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock) }" />
			</c:forEach>
		</ul>
		</div>
		<div class="col-lg-5 bg-light rounded p-3" style="height:1000px;">
			<div class="my-3 bg-white border border-secondary rounded p-4">
				<div class="d-flex justify-content-between my-3">
					<label class="form-label">가격</label>
					<span class="mx-3">
						<fmt:formatNumber pattern="###,###,###" value="${sum }"/> 원
					</span>
				</div>
				<div class="d-flex justify-content-between my-3">
					<label class="form-label">쿠폰</label>
					<span class="mx-3">
						- <fmt:formatNumber pattern="###,###,###" value="0"/> 원
					</span>
				</div>
				<div class="d-flex justify-content-between my-3">
					<label class="form-label">프로모션</label>
					<span class="mx-3">
						- <fmt:formatNumber pattern="###,###,###" value="0"/> 원
					</span>
				</div>
				<hr class="my-3">
				<div class="sum my-3 fs-3 fw-bold text-end">
					<fmt:formatNumber pattern="###,###,###" value="${sum }" />&nbsp;원
				</div>
			</div>
			
			<div class="orderOpen my-3">
				<a href="#" class="orderOpen_btn btn btn-success" role="button"  data-bs-toggle="collapse" data-bs-target="#orderCollapse" aria-expanded="false" aria-controls="orderCollapse">
					주문 정보 입력
				</a>
			</div>
			
			<div class="collapse" id="orderCollapse" >
				<div class="orderInfo bg-white border border-secondary rounded p-4">
					<form role="form" method="post" autocomplete="off">
						<input type="hidden" name="amount" value="${sum }"/>
						
						<div class="input-group mb-3">
							<label class="form-label w-25 text-center align-middle">수령인</label>
							<input
							 type="text" 
							 name="orderRec" id="orderRec"
							 class="form-control w-75 rounded-start"
							 required
							/>
						</div>
						
						<div class="input-group mb-3">
							<label class="form-label w-25 text-center align-middle">연락처</label>
							<input
							 type="text" 
							 name="orderPhone" id="orderPhone"
							 class="form-control w-75 rounded-start"
							 placeholder="(-)생략"
							 required
							/>
						</div>
						
						<!-- <div class="input-group mb-3">
							<label class="form-label w-25 text-center align-middle">이메일</label>
							<input
							 type="text" 
							 name="orderEmail" id="orderEmail"
							 class="form-control w-75 rounded-start"
							 required
							/>
						</div> -->
						
						<hr class="my-5">
						<div class="input-group">
							<input type="text" name="userAddr1" id="sample2_postcode" class="form-control" readonly/>
							<button type="button" onclick="sample_PostCode()" class="btn btn-success">
								우편번호 찾기
							</button>						
						</div>
						
						<div class="my-3">
							<input type="text" name="userAddr2" id="sample2_address" class="form-control" readonly/>
							<input type="text" name="userAddr3" id="sample2_detailAddress" class="form-control my-2" readonly/>
						</div>
						
						<div id="layer" style="display:none; position:fixed; overflow:hidden; z-index:1; -webkit-overflow-scrolling:touch;">
							<img
							 src="//t1.daumcdn.net/postcode/resource/images/close.png"
							 id="btnCloseLayer"
							 style="corsor:pointer; position:absolute; right:-3px; z-index:1;"
							 onclick="closeDaumPostcode()"
							/>
						</div>
						
			
						<div class="">
							<input type="submit" class="order_btn btn btn-warning rounded-pill btn-block my-3" value="주문" />
					
							<button type="button" class="cancel_btn btn btn-outline-danger rounded-pill btn-block" >취소</button>
						</div>
					
						
						
						
					</form>
				</div>
			</div>
		</div>
		
		<script>
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
							addr += extraAddr;
						}else{
							addr += ' ';
						}
						//우편번호와 주소 정보를 해당 필드에 넣는다
						$("#sample2_postcode").val(data.zonecode);
						$("#sample2_address").val(addr);
						//주소가 선택되고 주소에 나머지 내용을 적기 위해 인풋 3번에 속성에 읽기 전용을 거짓으로 만듦
						$("#sample2_detailAddress").attr("readonly", false);
						$("#sample2_detailAddress").focus();
					}
				}).open();
			}
		</script>
<%-- 	   <script src="${contextPath }/resources/js/cartlist.js"></script> --%>
	</div>
	
	</div>
	</div>
	</div>
</div>
</div>



<!-- jsp 인클루드 -->
<jsp:include page="../include/footer.jsp" flush="false" />