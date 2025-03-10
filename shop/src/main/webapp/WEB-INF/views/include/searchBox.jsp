<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<form method="get" action="/shop/search" id="searchForm">
	<div class="d-flex justify-content-between bg-white rounded-pill p-2 shadow">
		<input type="text" id="searchKeyword" name="searchKeyword" class="searchbox ms-3" placeholder="Search" />
		<a href="#" id="searchBtn" class="fs-4 me-3"><i class="fas fa-search"></i></a>
	</div>
	<script>
		document.getElementById("searchBtn").addEventListener("click", function(event){
			event.preventDefault();
			document.getElementById('searchForm').submit();
		});
	</script>
</form>