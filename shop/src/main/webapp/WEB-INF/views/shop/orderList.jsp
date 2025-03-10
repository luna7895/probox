<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 아래 페이지 디렉티브 인클루드 -->
<jsp:include page="../include/header.jsp" flush="false" />

<div class="container-fluid bg-gradient-primary">
<div class="row justify-content-center">
<div class="col-xl-10 col-lg-12 col-mb-9">

    <div class="card o-hidden boarder-0 shadow-lg my-5">
    <div class="card-body p-0">
    <div class="row">
 	<div class="col-lg-12">
 		
 		<ul class="list-group list-group-flush">
 			<c:forEach items="${orderList }" var="orderList">
 				<li class="list-group-item">
	 				<pre>
	 					<span class="fw-bold">주문 번호</span><a href="${contextPath}/shop/orderView?n=${orderList.orderId}" class="">${orderList.orderId}</a>
	 					<span class="fw-bold">수령인</span>${orderList.orderRec}
	 					<span class="fw-bold">주소</span>(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}
	 					<span class="fw-bold">가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}"/> 원
	 					<span class="fw-bold">상태</span>${orderList.delivery}
	 				</pre>
 				</li>
 			</c:forEach>
 		</ul>

	</div>
    </div>
    </div>
    </div>
    
</div>
</div>
</div>

<!-- jsp 인클루드 -->
<jsp:include page="../include/footer.jsp" flush="false" />