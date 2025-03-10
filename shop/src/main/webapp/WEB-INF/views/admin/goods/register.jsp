<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../include/header.jsp"/>

<div class="container-fluid bg-gradient-primary3">
<div class="row">
<div class="col-md-12 mb-5 pb-5">

<div class="d-flex">

	<div class="col-md-1">
		<div class="mt-1"></div>
		<jsp:include page="../include/lnb.jsp"/>
	</div>
	
	<div class="mx-4"></div>
	
	<div class="col-md-8">
		<h2 class="my-3">상품 등록</h2>
		<form method="post" enctype="multipart/form-data"><!-- 이미지나 다른 파일을 등록할 때 -->
			<div class="input-group">
				<label class="form-label fw-bold w-25">카테고리</label>
				<label class="form-label">1차</label>
				<select class="form-select category1 rounded mx-3">
					<option value="">
						전체
					</option>
				</select>
				<label class="form-label mx-3">2차</label>
				<select class="form-select category2 rounded-start" name="cateCode">
					<option value="">
						전체
					</option>
				</select>
			</div>
			
			<div class="input-group mt-5">
				<label class="form-label fw-bold w-25">상품명</label>
				<input type="text" id="gdsName" name="gdsName" class="form-control w-75 rounded-start" required/>
			</div>
			<div class="input-group mt-5">
				<label class="form-label fw-bold w-25">상품가격</label>
				<input type="text" id="gdsPrice" name="gdsPrice" class="form-control w-75 rounded-start" required/>
			</div>
			<div class="input-group mt-5"> <!-- 실패하는 경우 -->
				<label class="form-label fw-bold w-25">상품수량</label>
				<input type="text" id="gdsStock" name="gdsStock" class="form-control w-75 rounded-start" required/>
			</div>
			
			<div class="input-group mt-5">
				<label class="form-label fw-bold w-25">상품소개</label>
				<textarea rows="10" id="gdsDes" name="gdsDes" class="form-control w-75" required>내용을 적어주세요</textarea>
				<script src="${contextPath}/resources/js/ckdeitorConfig.js"></script>
			</div>
			
			<div class="input-group mt-5">
				<label class="form-label fw-bold w-25">이미지</label>
				<label class="btn btn-info rounded" for="gdsImg">이미지 업로드</label>
				<input type="file" id="gdsImg" name="file" class="form-control d-none w-75"/>
			</div>
			
			<!-- 아래는 올린 이미지를 확인 -->
			<div class="d-flex">
				<div class="w-25 fw-bold"><br>미리보기</div>
				<div class="select_img my-3 w-75">
					<img src="" style="width:100px;" />
				</div>
			</div>
			<div class="d-flex">
				<div class="w-25"></div>
				<div class="d-flex w-75">
					<div class="">원본 이미지</div>
					<img src="${goods.gdsImg }" style="width:100px;"/>
					<div class="">썸네일</div>
					<img src="${goods.gdsThumbImg }" style="width:50px;"/>
				</div>
			</div>
			<script src="${contextPath}/resources/js/changeImgFunction.js"></script>
			<div class="text-break"><%=request.getRealPath("/") %></div>
			<div class="d-flex justify-content-end">
				<div class="btn-group">
					<button type="submit" id="register_Btn" class="btn btn-warning">등록</button>
					<a href="/" class="btn btn-danger">취소</a>
				</div>
			</div>
		</form>
		<script>
			let jsonData = JSON.parse('${category}');
		</script>
		<!-- 2개의 드롭다운으로 카테고리를 선택할 때 json으로 오라클에 db 카테고리를 선택 -->
		<script src="${contextPath}/resources/js/jsonDrop.js"></script>
		
	</div>

</div>

</div>
</div>
</div>

<jsp:include page="../../include/footer.jsp"/>