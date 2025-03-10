<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../../include/header.jsp" flush="false"/>

<div class="container-fluid bg-gradient-primary3">
<div class="row">
<div class="col-md-12">

<div class="d-flex">

	<div class="col-md-1">
		<div class="mt-1">
			<jsp:include page="../include/lnb.jsp"/>
		</div>
	</div>
	
	<div class="col-md-10 ms-5">
		<h2 class="my-3">유저목록</h2>
		
		<table class="table table-hover">
			<colgroup>
				<col style="width= 10%">
				<col style="width= 10%">
				<col style="width= 15%">
				<col style="width= 15%">
				<col style="width= 5%">
				<col style="width= 25%">
				<col style="width= 15%">
				<col style="width= 5%">
			</colgroup>
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Phone</th>
					<th>Email</th>
					<th>Sex</th>
					<th>Address</th>
					<th>RegistDate</th>
					<th>Verify</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list }" var="list">
				<tr>
					<td class="align-middle">${list.userId }</td>
					<td class="align-middle">${list.userName }</td>
					<td class="align-middle">${list.userPhone }</td>
					<td class="align-middle">${list.userEmail }</td>
					<td class="align-middle">${list.userGender }</td>
					<td class="align-middle">
						(${list.userAddr1 }) ${list.userAddr2 }, ${list.userAddr3 }
					</td>
					<td class="align-middle text-center">
						<fmt:formatDate value="${list.regidate }" pattern="yyyy.MM.dd"/><br>
						<fmt:formatDate value="${list.regidate }" pattern="HH:mm:ss"/>
					</td>
					<td class="align-middle text-center">${list.verify }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>


</div>

</div>
</div>
</div>


<jsp:include page="../../include/footer.jsp" flush="false"/>
