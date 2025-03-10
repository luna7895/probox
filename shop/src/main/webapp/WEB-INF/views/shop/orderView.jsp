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
 		
		<c:forEach items="${orderView}" var="orderView" varStatus="status">
			<c:if test="${status.first}">
				<pre>
					<span class="fw-bold">주문자 </span>${orderView.userId}
					<span class="fw-bold">수령인 </span>${orderView.orderRec}
					<span class="fw-bold">주  소 </span>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}
					<span class="fw-bold">가  격 </span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}"/> 원
					<span class="fw-bold">상  태 </span>${orderView.delivery}
				</pre>
			</c:if>
		</c:forEach>
		
		<ul class="orderView list-group mt-3">
			<c:forEach items="${orderView}" var="orderView"> 
				<li class="list-group">
					<div class="d-flex">
						<pre>
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
</div>
</div>

<!-- jsp 인클루드 -->
<jsp:include page="../include/footer.jsp" flush="false" />