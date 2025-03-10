<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 아래 페이지 디렉티브 인클루드 -->
<%@ include file="../include/header.jsp" %>

<div class="container-fluid bg-gradient-primary3">
<div class="container">
<div class="row justify-content-center">
<div class="col-lg-12">

	<div class="card o-hidden border-0 shadow-lg my-5">
	<div class="card-body p-0">
	<div class="row">
	
<!-- 배경 이미지 부트스트랩에 규칙 칸은 도합 12 -->
		<div class="col-lg-5 d-none d-lg-block bg-register-image">
		</div>
		
		<!-- join -->
		<div class="col-lg-7 bg-sign">
		<div class="p-5">
		<div class="text-center">
			<h2 class="text-gray-900 fw-bold mb-4">Join the Member</h2>
			
			<form method="post" class="was-validated">
<!-- insert id -->
				<div class="d-flex mb-4">
					<input
					 type="text"
					 placeholder="Insert your id"
					 name="userId"
					 class="form-control form-control-user w-50"
					 required="required"
					/>
					<a class="btn btn-warning rounded-pill ms-3 px-3" onclick="">Duplication Check</a>
				</div>
<!-- insert password -->
				<div class="mb-4">
					<input
					 type="password"
					 placeholder="Insert your password (8 to 16 characters)"
					 name="userPass"
					 class="form-control form-control-user"
					 required="required"
					/>
				</div>
<!-- check password -->
				<div class="mb-4">
					<input
					 type="password"
					 placeholder="check your password"
					 name="userPassRe"
					 class="form-control form-control-user"
					 required="required"
					/>
				</div>
				
				<hr class="my-4">
				
<!-- insert your name -->
				<div class="mb-4">
					<input
					 type="text"
					 placeholder="Insert your name"
					 name="userName"
					 class="form-control form-control-user"
					 required="required"
					/>
				</div>
<!-- insert email -->
				<div class="mb-4">
					<input
					 type="text"
					 placeholder="Insert your email"
					 name="userEmail"
					 class="form-control form-control-user"
					 required="required"
					/>
				</div>
<!-- insert phone number -->
				<div class="mb-4">
					<input
					 type="text"
					 placeholder="Insert your phone number"
					 name="userPhone"
					 class="form-control form-control-user"
					 required="required"
					/>
				</div>
				
				<hr class="my-4">
				
<!-- insert address -->
				<div class="mb-4">
				<label class="form-label w-30">Address</label>
				<div class="d-flex">
					<input
					 type="text"
					 name="userAddr1"
					 readonly="readonly"
					 class="form-control form-control-user address_input_1 w-50"
					 placeholder="Search your zip code"
					/>
					<a class="btn btn-warning rounded-pill align-middle ms-3 px-5" onclick="go_daum_address()">Search</a>
				</div>
				</div>
				<div class="mb-4">
					<input
					 type="text"
					 name="userAddr2"
					 readonly="readonly"
					 class="form-control form-control-user address_input_2"
					 placeholder="address"
					/>
				</div>
				<div class="mb-4">
					<input
					 type="text"
					 name="userAddr3"
					 readonly="readonly"
					 class="form-control form-control-user address_input_3"
					 placeholder="detail address"
					/>
				</div>
<!-- select gender -->
				<div class="mb-4">
					<div class="btn-group">	
						<label class="btn border-0 active">
							<input 
							 type="radio"
							 name="userGender"
							 value="male"
							 autocomplete="off"
							 checked
							>male
						</label>
						<label class="btn border-0">
							<input 
							 type="radio"
							 name="userGender"
							 value="female"
							 autocomplete="off"
							>female
						</label>
					</div>
				</div>
<!-- submit button -->
				<div class="mb-4">
					<input
					 type="submit"
					 class="btn btn-primary rounded-pill btn-block fs-5 fw-bold py-2"
					 value="submit"
					/>
				</div>
				
<!-- register with -->
				<hr>
				<p class="text-gray">register with</p>
				
				<p class="mb-4">
	                <a href="https://kauth.kakao.com/oauth/authorize?client_id={REST_API_KEY}&redirect_uri={REDIRECT_URI}&response_type=code" class="btn btn-kakao btn-register align-middle">
						K
	                </a><!-- kakao -->
                  	<a href="https://kauth.kakao.com/oauth/authorize?client_id={REST_API_KEY}&redirect_uri={REDIRECT_URI}&response_type=code" class="btn btn-google btn-register">
						<i class="fab fa-google fa-fw align-middle text-white"></i>
                  	</a><!-- google -->
                  	<a href="https://kauth.kakao.com/oauth/authorize?client_id={REST_API_KEY}&redirect_uri={REDIRECT_URI}&response_type=code" class="btn btn-twitter btn-register">
						<i class="fab fa-twitter fa-fw align-middle text-white"></i>                 
				  	</a><!-- twitter -->
				  	<a href="https://kauth.kakao.com/oauth/authorize?client_id={REST_API_KEY}&redirect_uri={REDIRECT_URI}&response_type=code" class="btn btn-line btn-register">
						<i class="fab fa-line fa-fw align-middle text-white"></i>                
				  	</a><!-- line -->
				  	<a href="https://kauth.kakao.com/oauth/authorize?client_id={REST_API_KEY}&redirect_uri={REDIRECT_URI}&response_type=code" class="btn btn-apple btn-register">
						<i class="fab fa-apple fa-fw align-middle text-white"></i>                 
				  	</a><!-- apple -->
				</p>
				
				<div class="mb-1">
					<a class="small mb-2" href="/memmber/forgot.jsp">Forgot my Password</a>
				</div>
				<div class="mb-4">
					<a class="small" href="/memmber/signin.jsp">Already have an Account</a>
				</div>
			</form>
		</div>
		</div>
		</div>
		
	</div>
	</div>
	</div>
	
</div>
</div>
</div>
</div>

<!-- jsp 인클루드 -->
<jsp:include page="../include/footer.jsp" flush="false" />