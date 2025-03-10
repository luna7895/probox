<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../../include/header.jsp"/>

<div class="container-fluid bg-gradient-primary3">
<div class="row">
<div class="col-md-12">

<div class="d-flex">

<div class="col-md-1">
<div class="mt-1"></div>
	<jsp:include page="../include/lnb.jsp"/>
</div>

<div class="mx-4"></div>

<div class="col-md-8">
	<form role="form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="gdsNum" value="${goods.gdsNum}"/>

		<div class="d-flex">
			<div class="">기등록 카테고리</div>
			<div class="mx-3">${goods.cateName }</div>
			<div class="mx-3">${goods.cateCode }</div>
		</div>
		
<!-- 카테고리 -->
		<div class="input-group mt-5">
			<label class="form-label fw-bold w-25">카테고리</label>
			<label class="form-label fw-bold">1차 분류</label>
			<select name="" id="" class="form-select category1 rounded">
				<option value="${goods.cateName }">${goods.cateName }</option>
			</select>
			<label class="form-label ps-3 fw-bold">2차 분류</label>
			<select name="cateCode" id="" class="form-select category2 rounded-start">
				<option value="${goods.cateCode }">${goods.cateCode }</option>
			</select>
		</div>
		<!--수정할 때 쓰기와 다른 점 기존에 썼던 내용을 받아와야해서 input 벨류가 el로 들어감-->
<!--상품명-->
		<div class="input-group mt-5">
			<label class="form-label fw-bold w-25">상품명</label>
			<input type="text" id="gdsName" name="gdsName" value="${goods.gdsName}" class="form-control rounded-start w-75"/>
		</div>
<!--상품가격-->
		<div class="input-group mt-5">
			<label class="form-label fw-bold w-25">상품가격</label>
			<input type="text" id="gdsPrice" name="gdsPrice" value="${goods.gdsPrice}" class="form-control rounded-start w-75"/>
		</div>
<!--상품수량-->
		<div class="input-group mt-5">
			<label class="form-label fw-bold w-25">상품수량</label>
			<input type="text" id="gdsStock" name="gdsStock" value="${goods.gdsStock}" class="form-control rounded-start w-75"/>
		</div>
<!--상품소개-->
		<div class="input-group mt-5">
			<label class="form-label fw-bold w-25">상품소개</label>
			<textarea name="gdsDes" id="gdsDes" rows="5">${goods.gdsDes}</textarea>
			<script src="${contextPath}/resources/js/ckdeitorConfig.js"></script>
		</div>
<!--이미지추가-->
		<div class="input-group mt-5">
			<label class="form-label fw-bold w-25">이미지</label>
			<label class="btn btn-info rounded" for="gdsImg">이미지 업로드</label>
			<input type="file" id="gdsImg" name="file" class="d-none form-control w-75"/>
		</div>
		
		<div class="input-group mt-3">
			<label class="form-label fw-bold w-25"><br>미리보기</label>
			<div class="select_img w-75">
				<img src="${goods.gdsImg}" alt="이미지" style="width:100px;">
				<input type="hidden" name="gdsImg" value="${goods.gdsImg}"/>
				<input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}"/>
			</div>
			<script src="${contextPath }/resources/js/changeImgFunction.js"></script>
		</div>
			
		<div class="text-break"><%=request.getRealPath("/")%></div>
<!--버튼 세트-->
		<div class="d-flex justify-content-end my-5">
			<div class="btn-group">
				<button type="submit" id="update_Btn" class="btn btn-success">완료</button>
				<a href="${contextPath }/admin/goods/view?n=${goods.gdsNum }" class="btn btn-secondary">취소</a>
			</div>
		</div>
		<script src="${contextPath }/resources/js/backBtn.js"></script>
		<script>
			let jsonData = JSON.parse('${category}');
		</script>
		<script src="${contextPath }/resources/js/jsonDrop2.js"></script>
	</form>
</div>

</div>
</div>
</div>
</div>

<jsp:include page="../../include/footer.jsp"/>