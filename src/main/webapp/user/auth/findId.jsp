<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>

</head>
<body class="bg-light">
<jsp:include page="/common/header.jsp"></jsp:include>
<main class="container">
	<section class="row justify-content-center mt-5 mb-5">
		<div class="col-md-5 card p-4">		
			<h2>아이디 찾기</h2>
			<p>회원가입 시 등록한 정보를 입력해주세요.</p>
			<form action="" method="get">
				<div class="mb-3">
					<label for="findIdName" class="form-label">이름  <span class="text-danger">*</span></label>
					<input type="text" id="findIdName" class="form-control" />
					<span class="text-danger ms-1">이름을 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<label for="findIdEmail" class="form-label">이메일 <span class="text-danger">*</span></label>
					<input type="email" class="form-control me-1" id="findIdEmail">				
				<span class="text-danger ms-1">이메일을 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<button type="submit" class="btn btn-dark w-100">확인</button>
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