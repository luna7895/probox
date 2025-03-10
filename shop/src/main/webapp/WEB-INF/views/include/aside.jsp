<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="dropdown">
	<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
	  Dropdown form
	</button>	
	<div class="dropdown-menu p-4">
		<a class="text-black" href="${contextPath}/member/signin">LogiN</a>
		<a class="text-black me-5" href="${contextPath}/member/signup">JoiN</a>
	</div>
</div>