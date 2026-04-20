<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		$(".loginBtn").click(function(){
			let userId = $("#userId").val();
			let userPwd = $("#userPwd").val();
			
			if(!userId){
				$("#userId+.errMsg").css("display","inline-block");
				$("#userId").focus();
			}else{
				$("#userId+.errMsg").css("display","none");
				if(!userPwd){
					$("#userPwd+.errMsg").css("display","inline-block");
					$("#userPwd").focus();
				}else{
					$("#userPwd+.errMsg").css("display","none");
					
					$("#loginForm").submit();
				}
			}
		});
		
		
	});
</script>
<style type="text/css">
	.errMsg{
		display: none;
	}
</style>
</head>
<body class="bg-light">

<jsp:include page="/common/header.jsp"></jsp:include>

<main class="container">
	<section class="row justify-content-center mt-5 mb-5">
		<div class="shadow-sm col-md-5 card p-4">
			<h2 class="text-center">로그인</h2>
			<form action="" method="get" id="">
				<div class="mb-3">
					<label for="userId" class="form-label ms-1">아이디</label> 
					<input type="email" class="form-control" id="userId" aria-describedby="emailHelp">
					<span class="text-danger ms-1 errMsg">아이디를 입력해주세요.</span>
						
				</div>
				<div class="mb-3">
					<label for="userPwd" class="form-label ms-1">비밀번호</label> 
					<input type="password" class="form-control" id="userPwd">
					<span class="text-danger ms-1 errMsg">비밀번호를 입력해주세요.</span>
				</div>
				<div class="mb-3 d-flex justify-content-between align-items-center">
					<div class="form-check mb-0">
						<input class="form-check-input" type="checkbox" id="checkDefault">
						<label class="form-check-label" for="checkDefault">아이디 저장</label>
					</div>
					<div class="small">
						<a href="${pageContext.request.contextPath}/user/auth/find-id.jsp" class="text-decoration-none me-2 text-dark">아이디 찾기</a>
						<span class="text-muted">|</span>
						<a href="${pageContext.request.contextPath}/user/auth/find-pw.jsp" class="text-decoration-none ms-2 text-dark">비밀번호 찾기</a>
					</div>
				</div>
				<div class="d-grid gap-2 col-6 mx-auto">
					<button type="button" class="btn btn-outline-dark loginBtn">로그인</button>
				</div>
				<div class="text-center mt-2">
					아직 회원이 아니신가요?
					<a href="${pageContext.request.contextPath }/user/auth/sign-up.jsp" class="text-dark fw-bold">회원 가입</a> 
				</div>
			</form>
		</div>
	</section>
</main>


<jsp:include page="/common/footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>
</html>