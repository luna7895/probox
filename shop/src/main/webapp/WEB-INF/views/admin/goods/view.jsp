<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../../include/header.jsp"/>

<div class="container-fluid bg-gradient-primary3">
<div class="row">
<div class="col-md-12">

<div class="d-flex">

	<div class="col-md-1 mt-1">
		<jsp:include page="../include/lnb.jsp"/>
	</div>
	
	<div class="mx-3 d-none d-md-block"></div>
		
	<div class="col-md-10">
		<h1 class="m-3">VieW</h1>
		
		<form role="form"><!-- jquery나 ajax일 때는 method form 적지 말것 -->
			<input type="hidden" name="n" value="${goods.gdsNum}"/>
			
			<div class="col-10 view-image d-flex justify-content-center">
				<img src="${goods.gdsImg}" class="object-fit-scale img-thumbnail"/>		
			</div>
			
			<div class="col-10 fs-5">
				<div class="input-group d-flex justify-content-end mb-3">
					<span class="me-2 small">${goods.cateName}</span>
					<span class="small">(${goods.cateCode})</span>
				</div>	
				
				<div class="input-group mb-3">
					<label class="form-label w-50">상품명</label>
					<span class="text-end w-50 text-break fw-bold">${goods.gdsName}</span>
				</div>
				
				<div class="input-group mb-3">
					<label class="form-label w-50">상품 가격</label>
					<span class="text-end w-50 fw-bold">
						<fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###" />원
					</span>
				</div>
				
				<div class="input-group mb-3">
					<label class="form-label w-50">상품 수량</label>
					<span class="text-end w-50 fw-bold">${goods.gdsStock}</span>
				</div>
			
				<div class="gap-3">
					<div class="text-end">
						<label class="form-label fw-bold">상품 소개</label>
					</div>
					<div class="">${goods.gdsDes}</div>
				</div>
			</div>
	
	<!-- 버튼 -->
			<div class="d-flex justify-content-end m-5">
				<div class="btn-group">
					<button id="modify_Btn" class="btn btn-warning">수정</button>
					<button id="delete_Btn" class="btn btn-danger">삭제</button>
				</div>
			</div>
			
			<script src="${contextPath}/resources/js/Viewjs_01.js"></script>
			
		</form>
	</div>

</div>

</div>
</div>
</div>

<jsp:include page="../../include/footer.jsp"/>