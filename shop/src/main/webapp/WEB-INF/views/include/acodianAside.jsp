<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button fw-bold bg-primary text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="true" aria-controls="collapse1">
        Headset
      </button>
    </h2>
    <div id="collapse1" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
		<ul class="list-group list-group-flush">
			<li class="list-group-item">
				<a class="dropdown-item" href="${contextPath}/shop/list?c=101&l=2">Wired</a>
			</li>
			
			<li class="list-group-item">
				<a class="dropdown-item" href="${contextPath}/shop/list?c=102&l=2">Wireless</a>
			</li>
			
			<li class="list-group-item">
				<a class="dropdown-item" href="${contextPath}/shop/list?c=103&l=2">Bluetooth</a>
			</li>
		
			<li class="list-group-item">
				<a class="dropdown-item" href="${contextPath}/shop/list?c=104&l=2">Parts</a>
			</li>
		</ul>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed fw-bold bg-primary text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
        Mouse
      </button>
    </h2>
    <div id="collapse2" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
		<ul class="list-group list-group-flush">
			<li class="list-group-item">
				<a class="dropdown-item" href="${contextPath}/shop/list?c=201&l=2">Wired</a>
			</li>
			
			<li class="list-group-item">
				<a class="dropdown-item" href="${contextPath}/shop/list?c=202&l=2">Wireless</a>
			</li>
			
			<li class="list-group-item">
				<a class="dropdown-item" href="${contextPath}/shop/list?c=203&l=2">Bluetooth</a>
			</li>
		
			<li class="list-group-item">
				<a class="dropdown-item" href="${contextPath}/shop/list?c=204&l=2">Parts</a>
			</li>
		</ul>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed fw-bold bg-primary text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
        Keyboard
      </button>
    </h2>
    <div id="collapse3" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <ul class="list-group list-group-flush">
			<li class="list-group-item">
				<a class="dropdown-item" href="${contextPath}/shop/list?c=301&l=2">Full array</a>
			</li>
			
			<li class="list-group-item">
				<a class="dropdown-item" href="${contextPath}/shop/list?c=302&l=2">TKL</a>
			</li>
			
			<li class="list-group-item">
				<a class="dropdown-item" href="${contextPath}/shop/list?c=303&l=2">Mini</a>
			</li>
		
			<li class="list-group-item">
				<a class="dropdown-item" href="${contextPath}/shop/list?c=304&l=2">Parts</a>
			</li>
		</ul>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed fw-bold bg-primary text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="false" aria-controls="collapse4">
        Controller
      </button>
    </h2>
    <div id="collapse4" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <ul class="list-group list-group-flush">
			<li class="list-group-item">
				<a class="dropdown-item" href="${contextPath}/shop/list?c=401&l=2">Playstation</a>
			</li>
			
			<li class="list-group-item">
				<a class="dropdown-item" href="${contextPath}/shop/list?c=402&l=2">XBOX</a>
			</li>
			
			<li class="list-group-item">
				<a class="dropdown-item" href="${contextPath}/shop/list?c=403&l=2">Nintendo</a>
			</li>
		
			<li class="list-group-item">
				<a class="dropdown-item" href="${contextPath}/shop/list?c=404&l=2">parts</a>
			</li>
		</ul>
		<script>
			const params = new URLSearchParams(window.location.search);
			const cValue = params.get("c"); 
			
			if(cValue != null){
				const collapseId = "collapse" + Math.floor(cValue / 100);
				document.getElementById(collapseId).classList.add("show");
			}
		</script>
      </div>
    </div>
  </div>
</div>