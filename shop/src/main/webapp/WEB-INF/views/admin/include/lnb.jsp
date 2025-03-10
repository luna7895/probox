<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<ul class="list-group">

	<li class="list-group-item">
		<a href="${contextPath}/admin/goods/register" class="a-link text-decoration-none">
			상품 등록
		</a>
	</li>
	
	<li class="list-group-item">
		<a href="${contextPath}/admin/goods/list" class="a-link text-decoration-none">
			상품 목록
		</a>
	</li>
	
	<li class="list-group-item">
		<a href="${contextPath}/admin/shop/orderList" class="a-link text-decoration-none">
			주문 목록
		</a>
	</li>

	<li class="list-group-item">
		<a href="${contextPath}/admin/shop/allReply" class="a-link text-decoration-none">
			상품 소감
		</a>
	</li>

	<li class="list-group-item">
		<a href="${contextPath}/admin/shop/userList" class="a-link text-decoration-none">
			유저 목록
		</a>
	</li>

</ul>