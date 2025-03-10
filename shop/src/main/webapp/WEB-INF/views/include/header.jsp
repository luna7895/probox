<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<meta charset="UTF-8">
<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>
<title>=== SHOP ===</title>
<script>
function replyList(){
	var gdsNum = "${view.gdsNum}";
	//비동기식 데이터 요청
	$.getJSON("/shop/view/replyList" + "?n=" + gdsNum, function(data){
		var str = ""; //초기화
		$(data).each(function(){
			console.log(data);
			//날짜 데이터를 보기 쉽게 변환
			var repDate = new Date(this.repDate);
			repDate = repDate.toLocaleDateString("ko-us");
			//html코드 조립
			str += "<li data-repNum='" + this.repNum + "' class='list-group-item'>"
			+ "<div class='d-flex justify-content-between'>"
			+ "<div class=''>"
			+ "<div class='fw-bold small'>" + this.userName + "</div>"
			+ "<div class='replyContent p-1'>" + this.repCon + "</div>"
			+ "<div class='small text-secondary'>" + repDate + "</div>"
			+ "</div>"
			+ "<c:if test='${member != null}'>"//세션이 있어야만 수정/삭제가 가능
			+ "<div class='replyFooter'>"
			+ "<button type='btton' class='delete btn btn-close btn-block btn-sm' data-repNum='" + this.repNum + "'></button>"
			+ "<button type='btton' class='modify btn btn-block' data-repNum='" + this.repNum + "'>…</button>"
			+ "</div>"
			+ "</c:if>"
			+ "</div>"
			+ "</li>";
		});
		$("section.replyList ul").html(str);
	});
}
</script>
</head>
<body class="">
<div class="bg-nav">
<div class="container-fluid d-md-none">
	<div class="d-flex justify-content-end gap-3 pe-3 pt-3">
		<c:if test = "${member == null }"> <!-- 로그인을 하지 않았으면 -->
			<div class="dropdown">
				<a href="#" class="dropdown-toggle me-1 text-secondary" data-bs-toggle="dropdown" role="button" aria-expanded="false" data-bs-auto-close="outside">
				  sign
				</a>	
				
				<span class="dropdown-menu dropdown-menu-end p-4">
					<p class="text-secondary text-center">회원</p>
					<a class="btn btn-warning btn-block mb-3" href="${contextPath}/member/signin">LogiN</a>
					<a class="btn btn-outline-primary btn-block" href="${contextPath}/member/signup">JoiN</a>
				</span>
			</div>		
		</c:if>
		<!-- 로그인을 했을 때 -->
		<c:if test="${member != null }">
			<div class="dropdown">
				<a href="#" class="dropdown-toggle me-1 text-secondary" data-bs-toggle="dropdown" role="button" aria-expanded="false" data-bs-auto-close="outside">
				  myPage
				</a>
				
				<ul class="dropdown-menu">
					<!-- 로그인을 했는데 관리자라면 -->
					<c:if test="${member.verify == 9 }">
						<li class="dropdown-item">
							<a class="text-black" href="${contextPath}/admin/index">관리자 화면</a>
						</li>
						<li class="dropdown-item"><hr class="dropdown-divider"></li>
					</c:if>
					
					<li class="dropdown-item">
						<a class="nav-link" href="${contextPath}/shop/cartList">CartlisT</a>
					</li>
					<li class="dropdown-item">
						<a class="nav-link" href="${contextPath}/shop/orderList">OrderlisT</a>
					</li>
					<li class="dropdown-item"><hr class="dropdown-divider"></li>
					<li class="dropdown-item">
						<a class="text-black" href="${contextPath}/member/signout">LogouT</a>
					</li>
				</ul>
			</div>
			<span class="fw-bold">
				${member.userName }&nbsp;님 환영합니다
			</span>
			
				
		</c:if>
	</div>
</div>

<nav class="navbar navbar-expand-sm">
	<div class="container-fluid">
		<a class="navbar-brand me-3" href="/">ShoP</a>
		<!-- 토글 버튼 -->
		<button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#mynavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<!-- 로그인 회원가입 변수 로그인 했을 때와 하지 않았을 때 -->
		<div class="collapse navbar-collapse" id="mynavbar">
			<ul class="navbar-nav me-auto align-items-center gap-2">
				<li class="nav-item">
					<a class="nav-link" href="${contextPath}/shop/list?c=100&l=2">카테고리1</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${contextPath}/shop/list?c=200&l=2">카테고리2</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${contextPath}/shop/list?c=300&l=2">카테고리3</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${contextPath}/shop/list?c=400&l=2">카테고리4</a>
				</li>
			</ul>
			<div class="d-flex d-none d-md-block">
				<c:if test = "${member == null }"> <!-- 로그인을 하지 않았으면 -->
					<span class="dropdown me-5">
						<a href="#" class="dropdown-toggle me-1 text-secondary" data-bs-toggle="dropdown" role="button" aria-expanded="false" data-bs-auto-close="outside">
						  sign
						</a>	
						
						<span class="dropdown-menu dropdown-menu-end p-4">
							<p class="text-secondary text-center">회원</p>
							<a class="btn btn-warning btn-block mb-3" href="${contextPath}/member/signin">LogiN</a>
							<a class="btn btn-outline-primary btn-block" href="${contextPath}/member/signup">JoiN</a>
						</span>
					</span>		
				</c:if>
				<!-- 로그인을 했을 때 -->
				<c:if test="${member != null }">
					<span class="dropdown">
						<a href="#" class="dropdown-toggle me-1 text-secondary" data-bs-toggle="dropdown" role="button" aria-expanded="false" data-bs-auto-close="outside">
						  myPage
						</a>
						
						<ul class="dropdown-menu">
							<!-- 로그인을 했는데 관리자라면 -->
							<c:if test="${member.verify == 9 }">
								<li class="dropdown-item">
									<a class="text-black" href="${contextPath}/admin/index">관리자 화면</a>
								</li>
								<li class="dropdown-item"><hr class="dropdown-divider"></li>
							</c:if>
							
							<li class="dropdown-item">
								<a class="nav-link" href="${contextPath}/shop/cartList">CartlisT</a>
							</li>
							<li class="dropdown-item">
								<a class="nav-link" href="${contextPath}/shop/orderList">OrderlisT</a>
							</li>
							<li class="dropdown-item"><hr class="dropdown-divider"></li>
							<li class="dropdown-item">
								<a class="text-black" href="${contextPath}/member/signout">LogouT</a>
							</li>
						</ul>
					</span>
					<span class="fw-bold">
						${member.userName }&nbsp;님 환영합니다
					</span>
				</c:if>
			</div>
		</div>
	</div>	
</nav>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${contextPath}/resources/js/daum.js"></script>
