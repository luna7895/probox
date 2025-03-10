<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 아래 페이지 디렉티브 인클루드 -->
<jsp:include page="../include/header.jsp" />

<div class="container-fluid bg-gradient-primary3">
<div class="row d-flex justify-content-center">

<div class="col-md-8 m-3 px-5">
	<jsp:include page="../include/searchBox.jsp" flush="false" />
</div>

<div class="col-md-10 mt-5 border-bottom border-2 border-primary"> 
	<script>
		$(document).ready(function(){
			let params = new URLSearchParams(window.location.search);
		    let cateCode = Math.floor(params.get("c")/100)*100; // 예제용 (1차 카테고리 코드)
		    
		    $.ajax({
		        url: "/shop/list/subCateList",
		        type: "GET",
		        data: { cateCode: cateCode },
		        success: function(data) {
		            let categoryMenu = $("#categoryMenu");
		            categoryMenu.empty(); // 기존 목록 초기화
		            categoryMenu.append("<li class='nav-item'><a class='nav-link' href='/shop/list?c=" + cateCode + "&l=2'>ALL</a></li>");
		            $.each(data, function(index, category) {
		                categoryMenu.append("<li class='nav-item'><a class='nav-link' href='/shop/list?c=" + category.cateCode + "&l=2'>" + category.cateName + "</a></li>");
		            });
		        },
		        error: function() {
		            alert("카테고리를 불러오는 데 실패했습니다.");
		        }
		    });
		});
	</script>

	<ul id="categoryMenu" class="nav"></ul>
</div>

<div class="col-10 px-2">
	<div class="my-5">
		<jsp:include page="../include/breadcrumb.jsp" />
	</div>	
	<div class="d-flex flex-wrap gap-4">
		<c:forEach items="${list }" var="list">
			<div class="bg-white rounded p-2" onclick="location.href='${contextPath }/shop/view?n=${list.gdsNum }'">
				<div class="small">No.${list.gdsNum } (${list.cateCode })</div>
				<div class="thumb-container">
					<img src="${list.gdsThumbImg }" class=""/>
				</div>
				<div class="fw-bold my-1">${list.gdsName}</div>
				<div class="small"><fmt:formatNumber value="${list.gdsPrice }" pattern="###,###,###" />원</div>
			</div>
		</c:forEach>
	</div>
</div>

</div>
</div>

<!-- jsp 인클루드 -->
<jsp:include page="../include/footer.jsp" />