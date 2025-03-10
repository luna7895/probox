<!-- jsp 인클루드 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 아래 페이지 디렉티브 인클루드 -->
<jsp:include page="../include/header.jsp" />

<div class="container-fluid bg-gradient-primary3">
<div class="row justify-content-center">	
<div class="col-10">
	
	<div class="card o-hidden border-0 shadow-lg my-5">
    <div class="card-body p-3">
    <div class="row justify-content-center gap-3">	
    
<%-- 		<div class="col-2 d-none d-lg-block" style="height: 100vh; padding: 20px;">
			<jsp:include page="../include/acodianAside.jsp" />
		</div>
		<div class="col-1 d-lg-none" style="height: 100vh;"></div>
 --%>		
		
		<div class="col-10">
			<jsp:include page="../include/breadcrumb.jsp" />
		</div>
	
		<div class="row justify-content-center gap-3">
			<div class="col-lg-5">
					<div class="d-flex justify-content-center align-middle">
						<img src="${view.gdsImg }" class="object-fit-scale img-thumbnail"/>
					</div>
				</div>	
	
			<div class="col-lg-5">
				<form role="form">
					<input type="hidden" name="gdsNum" value="${view.gdsNum }"/>
					<!-- 익스프레션 자바 표현식 el 익스프레션 랭귀지 -->
				
					
					<div class="d-flex justify-content-between my-3 d-block">
						<label class="form-label text-secondary">상품명</label>
						<span class="mx-3 fw-bold">${view.gdsName }</span>
					</div>
					<div class="d-flex justify-content-between my-3">
						<label class="form-label text-secondary">카테고리</label>
						<span class="mx-3 fw-bold">${view.cateName }</span>
					</div>
					<div class="d-flex justify-content-between my-3">
						<label class="form-label text-secondary">가격</label>
						<span class="mx-3 fw-bold">
							<fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}"/> 원
						</span>
					</div>
					<div class="d-flex justify-content-between my-3">
						<label class="form-label text-secondary">수량</label>
						<span class="mx-3 fw-bold">
							<fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}"/> ea
						</span>
					</div>
					
					<c:if test="${view.gdsStock != 0}">
						<div class="text-secondary">구입 수량</div>
						<div class="d-flex justify-content-center gap-1 my-3">
							<button type="button" class="plus btn btn-light w-10">+</button>
							<input type="number" class="numBox form-control text-center w-75" min="1" max="${view.gdsStock}" value="1" readonly/>
							<button type="button" class="minus btn btn-light w-10">-</button>
						</div>
						<input type="hidden" value="${view.gdsStock }"/>
						<script>
							//$(".")+ 버튼을 누르면 수량이 증가되는데 상품의 전체 수량보다 커지지 않음
							$(".plus").click(function(){
								let num = $(".numBox").val();
								let plusNum = Number(num) + 1;
								let stock = $(".gdsStock_hidden");
								
								if(plusNum >= stock){
									$(".numBox").val(Num);
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
						</script> 
					</c:if>
					
					<!-- 장바구니에 담기 -->
					<div class="my-3 gap-3">
						<button type="button" class="addCart_btn btn btn-success btn-block rounded-pill my-3">
							카트에 담기
						</button>
						<button type="button" class="buyNow_btn btn btn-warning btn-block rounded-pill my-3">
							구매하기
						</button>
						<script src="/resources/js/cart.js">
						</script>
					</div>
					<c:if test="${view.gdsStock == 0 }">
						<p class="text-secondary">상품 수량이 부족합니다</p>
					</c:if>
				</form>
			</div>
		</div>
		
		
		<div class="row justify-content-center my-3">
			<div class="col-10">
				<label class="form-label text-secondary">상품 설명</label>
				<span class="mx-3">${view.gdsDes }</span>
			</div>
		</div>

		<div class="row justify-content-center mt-3">
			<div id="reply" class="col-10">
				<c:if test="${member == null }">
					<p>상품평을 남기시려면 <a href="/member/signin">로그인</a> 해주세요:)</p>
				</c:if>
				
				<c:if test="${member != null }">
					<section class="replyForm">
						<!-- 히든으로 제품 번호가 들어가야됨 -->
						<form role="form" method="post">
							<input type="hidden" name="gdsNum" id="gdsNum" value="${view.gdsNum }">
							<div class="d-flex my-3 gap-2">
								<textarea name="repCon" id="repCon" class="form-control">상품평을 남겨주세요</textarea>
								<button type="button" id="reply_btn" class="btn btn-secondary">
									등록
								</button>
								<script src="/resources/js/reply.js"></script>
							</div>
							
						</form>
					</section>
				</c:if>
				<section class="replyList col">
					<ul class="list-group list-group-flush">
						
					</ul>
					<script>
						replyList(); //헤더에서 만들 함수 호출
					</script>
				</section>
			</div>
		</div>		
	
	</div>
	</div>
	</div>
</div>
</div>
</div>

<!-- 리플리에 수정창 탑재 -->
<div class="replyModal">
	<div class="modalContent">
		<div class="">
			<textarea class="modal_repCon form-control" name="modal_repCon"></textArea>
		</div>
		
		<div class="d-flex justify-content-end my-2">
			<button type="button" class="modal_modify_btn btn btn-success mx-2">
				수정
			</button>
			<button type="button" class="modal_cancel btn btn-secondary ">
				취소
			</button>
 		</div>
 		<script src="/resources/js/replyDelete.js"></script>
 		<!-- 댓글 수정관련 스크립트 -->
 		<script src="/resources/js/replyEdit.js"></script>
 		
	</div>
	
	<div class="modalBackground"></div><!-- 검정색 바탕에 투명도를 80% -->
</div>

<!-- jsp 인클루드 -->
<jsp:include page="../include/footer.jsp" />