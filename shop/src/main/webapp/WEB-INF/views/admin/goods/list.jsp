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
	<div class="mt-1"></div>
	<jsp:include page="../include/lnb.jsp"/>
</div>


<div class="col-md-10 ms-5">
	<h2 class="my-3">상품목록</h2>
		
	<table class="table table-hover">
		<colgroup>
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 50%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>상품이미지</th>
				<th>상품제목</th>
				<th>분류</th>
				<th>수량</th>
				<th>등록날짜</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="list">
			<tr>
				<td class="align-middle text-center">${list.gdsNum }</td>
				<td>
					<div class="thumb-container">
						<img src="${list.gdsThumbImg }" alt="썸네일" onclick="location.href='/admin/goods/view?n=${list.gdsNum }'"/>
					</div>
				</td>
				<td>
					<p>
						<a href="/admin/goods/view?n=${list.gdsNum }">
						${list.gdsName }
						</a>
					<p class="fw-bold">
						<fmt:formatNumber value="${list.gdsPrice }" pattern="###,###,###" />원
					</p>
				</td>
				<td>${list.cateCode }</td>
				<td>${list.gdsStock }</td>
				<td><fmt:formatDate value="${list.gdsDate }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

</div>
</div>
</div>
</div>

<jsp:include page="../../include/footer.jsp"/>