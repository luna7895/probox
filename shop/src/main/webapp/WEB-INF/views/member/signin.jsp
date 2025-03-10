<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 아래 페이지 디렉티브 인클루드 -->
<jsp:include page="../include/header.jsp" flush="false" />

<div class="container-fluid bg-gradient-primary">
<div class="row justify-content-center">
<div class="col-xl-10 col-lg-12 col-mb-9">

    <div class="card o-hidden border-0 shadow-lg my-5">
    <div class="card-body p-0">
    <div class="row">
        <!-- 배경 이미지 -->
        <div class="col-lg-5 d-none d-lg-block bg-login-image">
        </div>

        <div class="col-lg-7 bg-sign">
        <div class="p-5">
        <div class="text-center">
            <h2 class="text-grey-900 fw-bold mb-4">
                Welcome Back!
            </h2>

            <form method="post" class="was-validated">
            	<div class="form-floating my-3">
	                <input
	                 type="text"
	                 class="form-control rounded-pill p-3"
	                 placeholder="ID"
	                 name="userId"
	                 id="userId"
	                 required="required"
	                 autofocus
	                />
					<label for="userId">Id</label>
	            </div>
           		<div class="form-floating mb-3">
	                <input
	                 type="password"
	                 class="form-control rounded-pill p-3"
	                 placeholder="Password"
	                 name="userPass"
	                 id="userPass"
	                 required="required"
	                />
	            	<label for="userPass">Password</label>
	            </div>
	            <div class="my-3">
            	<div class="custom-control custom-checkbox small">
            		<input
            		 type="checkbox"
            		 class="custom-control-input"
            		 id="customCheck"
            		/>
            		<label class="custom-control-label" for="customCheck">Remember Me</label>
            	</div>
	            </div>
                <p class="mb-4">
                    <input type="submit"
                     class="btn btn-primary rounded-pill btn-block fs-5 fw-bold py-2"
                     value="login"
                     id="signin_btn"
                     name="signin_btn"
                    />
                </p>
<!-- register with -->
				<hr>
				<p class="text-gray">login with</p>
				
				<p class="mb-4">
	                <a href="https://kauth.kakao.com/oauth/authorize?client_id={REST_API_KEY}&redirect_uri={REDIRECT_URI}&response_type=code" class="btn btn-kakao btn-register justify-content-center">
						K
	                </a><!-- kakao -->
                  	<a href="${contextPath}/member/google" class="btn btn-google btn-register justify-content-center">
						<i class="fab fa-google fa-fw align-middle text-white"></i>
                  	</a><!-- google -->
                  	<a href="${contextPath}/member/facebook" class="btn btn-facebook btn-register justify-content-center">
						<i class="fab fa-facebook fa-fw align-middle text-white"></i>
                  	</a><!-- facebook -->
                  	<a href="https://kauth.kakao.com/oauth/authorize?client_id={REST_API_KEY}&redirect_uri={REDIRECT_URI}&response_type=code" class="btn btn-twitter btn-register justify-content-center">
						<i class="fab fa-twitter fa-fw align-middle text-white"></i>                 
				  	</a><!-- twitter --> 
				  	<a href="https://kauth.kakao.com/oauth/authorize?client_id={REST_API_KEY}&redirect_uri={REDIRECT_URI}&response_type=code" class="btn btn-line btn-register justify-content-center">
						<i class="fab fa-line fa-fw align-middle text-white"></i>                
				  	</a><!-- line -->
				  	<a href="https://kauth.kakao.com/oauth/authorize?client_id={REST_API_KEY}&redirect_uri={REDIRECT_URI}&response_type=code" class="btn btn-apple btn-register justify-content-center">
						<i class="fab fa-apple fa-fw text-white"></i>                 
				  	</a><!-- apple -->
				</p>
				
				<div class="mb-1">
					<a class="small mb-2" href="${contextPath }/memmber/forgot.jsp">Forgot my Password</a>
				</div>
				<div class="mb-4">
					<a class="small" href="${contextPath }/memmber/signup.jsp">Join to Member!</a>
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

<!-- jsp 인클루드 -->
<jsp:include page="../include/footer.jsp" flush="false" />