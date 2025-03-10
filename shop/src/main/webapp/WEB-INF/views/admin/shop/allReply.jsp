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

 	<div class="col-10 ms-5">
 		<ul class="list-group bg-white">
 			<c:forEach items="${reply}" var="reply">
 				<li class="replyInfo list-group-item">
 					<pre>
 						<span class="fw-bold">작성자 </span>${reply.userName}(${reply.userId})
 						<span class="fw-bold">제품명 </span><a href="/shop/view?n=${reply.gdsNum}">바로가기</a>
 						
 						<div class="replyContent">
 							${reply.repCon}
 						</div>
 					</pre>
 					<form role="form" method="post">
 						<input type="hidden" name="repNum" value="${reply.repNum}">
 						<div class="d-flex justify-content-end my-2">
 							<button type="submit" class="delete_${reply.repNum}_btn btn btn-outline-danger">삭제</button>
 						</div>
 					</form>
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