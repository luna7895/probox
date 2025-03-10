<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="include/header.jsp" flush="false" />
<!-- jsp에서 주로 출력 버퍼를 강제로 비우는 용도로 사용. 이를 통해서 페이지에서 실시간으로 데이터를 표시하거나 여러 단계의 출력을 효과적으로 관리할 수 있다 -->

<div class="container-fluid bg-gradient-primary">
<div class="row justify-content-center">

<div class="col-md-8 my-5 px-5">
	<jsp:include page="include/searchBox.jsp" flush="false" />
</div>

<div class="col-md-12">



</div>
</div>
</div>

<jsp:include page="include/footer.jsp" flush="false" />