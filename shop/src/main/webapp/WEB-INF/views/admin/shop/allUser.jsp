<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 아래 페이지 디렉티브 인클루드 -->
<jsp:include page="../../include/header.jsp" flush="false" />

<div class="container-fluid bg-gradient-primary3">
<div class="row justify-content-center">
<div class="col-12">

<div class="d-flex">	
	
	<div class="col-md-1">
		<jsp:include page="../include/lnb.jsp"/>
	</div>


 	<div class="col-lg-12">
 		<h1 class="my-5">회원목록</h1>
 		<table class="table table-hover">
 			<colgroup>
 				<col style="width:8.33%"/>
 				<col style="width:8.33%"/>
 				<col style="width:8.33%"/>
 				<col style="width:8.33%"/>
 				<col style="width:8.33%"/>
 				<col style="width:8.33%"/>
 				<col style="width:8.33%"/>
 				<col style="width:8.33%"/>
 				<col style="width:8.33%"/>
 				<col style="width:8.33%"/>
 				<col style="width:8.33%"/>
 			</colgroup>
 			<thead>
 				<tr>
 					<th>아이디</th>
 					<th>패스워드</th>
 					<th>패스워드 확인</th>
 					<th>이름</th>
 					<th>이메일</th>
 					<th>전번</th>
 					<th>주소1</th>
 					<th>주소2</th>
 					<th>주소3</th>
 					<th>가입일</th>
 					<th>회원 등급</th>
 				</tr>
 			</thead>
 			<tbody>
 				<c:forEach items="" var="">
 					
 				</c:forEach>
 			</tbody>
 		</table>

	</div>

</div>
    
    
</div>
</div>
</div>

<!-- jsp 인클루드 -->
<jsp:include page="../../include/footer.jsp" flush="false" />