<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 아래 페이지 디렉티브 인클루드 -->
<jsp:include page="../../include/header.jsp" flush="false" />

<div class="container-fluid bg-gradient-primary3">
<div class="row justify-content-center">
<div class="col-md-12">

<div class="d-flex mt-1">

	<div class="col-md-1">
		<jsp:include page="../include/lnb.jsp"/>
	</div>
 		
 	<div class="card col-10 ms-5 p-3">
		<c:forEach items="${orderView}" var="orderView" varStatus="status">
			<c:if test="${status.first}">
				<pre>
					<span class="fw-bold">주문자 </span>${orderView.userId}
					<span class="fw-bold">수령인 </span>${orderView.orderRec}
					<span class="fw-bold">주  소 </span>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}
					<span class="fw-bold">가  격 </span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}"/> 원
					<span class="fw-bold">상  태 </span>${orderView.delivery}
				</pre>
				<div class="">
					<form role="form" method="post" class="deliveryForm" autocomplete="off" name="form">
						<input type="hidden" name="orderId" value="${orderView.orderId}"/>
						<input type="hidden" name="delivery" class="delivery" value=""/>
						
						<div class="d-flex justify-content-end mx-3 gap-3">
							<button type="button" class="delivery1_btn btn btn-primary">배송중</button>
							<button type="button" class="delivery2_btn btn btn-primary">배송완료</button>
						</div>
						<script>
							$(".delivery1_btn").click(function(){
								$(".delivery").val("배송중");
								run();
							});
							$(".delivery2_btn").click(function(){
								$(".delivery").val("배송완료");
								run();
							});
							
							run = () => {
								$(".deliveryForm").submit();
							}
						</script>
						
					</form>
					
	
				</div>
			</c:if>
		</c:forEach>
		
		<ul class="orderView list-group mt-3">
			<c:forEach items="${orderView}" var="orderView"> 
				<li class="list-group">
					<div class="d-flex m-3">
						<pre class="" style="margin-left: -0.25rem;">
							<span class="fw-bold">상 품 명 </span>${orderView.gdsName}
							<span class="fw-bold">개당 가격 </span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}"/> 원
							<span class="fw-bold">구입 수량 </span>${orderView.cartStock} 개
							<span class="fw-bold">최종 가격 </span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}"/> 원
						</pre>
						<img src="${orderView.gdsThumbImg}" class="img-thumbnail mx-3" style="width:150px; height:150px;"/>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>

</div>    
</div>
</div>

<!-- jsp 인클루드 -->
<jsp:include page="../../include/footer.jsp" flush="false" />