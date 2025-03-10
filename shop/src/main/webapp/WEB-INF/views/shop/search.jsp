<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../include/header.jsp" flush="false" />
<!-- jsp에서 주로 출력 버퍼를 강제로 비우는 용도로 사용. 이를 통해서 페이지에서 실시간으로 데이터를 표시하거나 여러 단계의 출력을 효과적으로 관리할 수 있다 -->

<div class="container-fluid bg-gradient-primary">
<div class="row justify-content-center">

<div class="col-md-8 my-5 px-5">
	<jsp:include page="../include/searchBox.jsp" flush="false" />
</div>

<div class="col-12">
	<h2 id="searchResult" class="text-center my-5"></h2>
	<script>
		document.addEventListener("DOMContentLoaded", function(){
			let urlParams = new URLSearchParams(window.location.search);
			let searchWord = urlParams.get('searchKeyword');
			document.getElementById("searchResult").innerText = "'" + searchWord + "' 에 대한 검색 결과입니다";
		});
	</script>
</div>

<div class="col-md-11">

	<table class="table table-hover">
		<colgroup>
			<col style="width: 10%" />
			<col style="width: 15%" />
			<col style="width: 55%" />
			<col style="width: 20%" />
		</colgroup>
		<thead>
			<tr>
				<th class="text-center">No.</th>
				<th class="text-center">상품이미지</th>
				<th>상품명</th>
				<th class="text-center">게시일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<c:if test="${empty search }">
					<td colspan="4" class="text-center tw-bold">검색결과 없음</td>
				</c:if>
				<c:forEach items="${search }" var="search">
					<td class="align-middle text-center">${search.gdsNum }</td>
					<td>
						<div class="thumb-container">
							<img src="${search.gdsThumbImg }" alt="썸네일" onclick="location.href='/admin/goods/view?n=${list.gdsNum }'"/>
						</div>
					</td>
					<td>
						<p>
							<a href="${contextPath}/shop/view?n=${search.gdsNum }">
							${search.gdsName }
							</a>
						<p class="small text-secondary">
							<fmt:formatNumber value="${search.gdsPrice }" pattern="###,###,###" /> 원
						</p>
						<p>${search.gdsStock } ea</p>
					</td>
					<td class="align-middle text-center"><fmt:formatDate value="${search.gdsDate }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
				</c:forEach>
			</tr>
		</tbody>
	</table>


</div>

</div>
</div>

<jsp:include page="../include/footer.jsp" flush="false" />