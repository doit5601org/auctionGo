<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="css/common.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<style type="text/css">
.loginForm{
	width: 400px;
	max-width: none;
	margin: 200px auto;
	padding: 50px;
	border-radius: 0.375rem;
	background-color: #fff;
}
.errorMsg{
	color: red;
	font-size: 14px;
}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</head>
<body>
<div class="section">
	<div class="container shadow-sm loginForm">
		<h2 class="text-center">로그인</h2>
		<form action="" method="get">
			<div class="mb-3">
				<label for="userId" class="form-label">아이디</label> <input
					type="email" class="form-control" id="userId"
					aria-describedby="emailHelp">
					<span class="errorMsg">아이디를 입력해주세요.</span>
			</div>
			<div class="mb-3">
				<label for="userPwd" class="form-label">비밀번호</label> <input
					type="password" class="form-control" id="userPwd">
				<span class="errorMsg">비밀번호를 입력해주세요.</span>
			</div>
			<div class="mb-1 form-check btn-lg row justify-content-between">
				<div>
					<input class="form-check-input" type="checkbox" value="" id="checkDefault">
					<label class="form-check-label" for="checkDefault">
						아이디 저장
					</label>
				</div>
				  <div class="row justify-content-between">
				    <div class="col-4">
				   		<a href="">아이디 찾기</a>
				    </div>
				    <div class="col-4">
				    	<a href="">비밀번호 찾기</a>
				    </div>
				  </div>
				
				
			
			</div>
			<div class="d-grid gap-2 col-6 mx-auto"">
				<button type="submit" class="btn btn-outline-dark">로그인</button>
			</div>
			<div>
				아직 회원이 아니신가요?
				<a href="">회원 가입</a>
			</div>
		</form>
	</div>
</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>
</html>