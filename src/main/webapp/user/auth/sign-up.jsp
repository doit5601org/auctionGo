<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body class="bg-light">
<jsp:include page="/common/header.jsp"></jsp:include>

<main class="container">
	<section class="row justify-content-center mt-5 mb-5">
		<div class="shadow-sm col-md-5 card p-4 pb-5">
			<h2 class="text-center">회원가입</h2>
			<form action="" method="get">
				<div class="mb-3">
					<label for="userId" class="form-label ms-1">아이디 <span class="text-danger">*</span></label> 
					<div class="d-flex ">
						<input type="email" class="form-control w-50" id="userId" aria-describedby="emailHelp">
						<button type="button" class="btn btn-outline-dark ms-3">중복확인</button>						
					</div>
						<span class="text-danger ms-1">아이디를 입력해주세요.</span>
						
				</div>
				<div class="mb-3">
					<label for="userPwd" class="form-label ms-1">비밀번호 <span class="text-danger">*</span></label> 
					<input type="password" class="form-control w-75" id="userPwd">
					<span class="text-danger ms-1">비밀번호를 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<label for="userPwdCheck" class="form-label ms-1">비밀번호 확인 <span class="text-danger">*</span></label> 
					<input type="password" class="form-control w-75" id="userPwdCheck">
					<span class="text-danger ms-1">비밀번호가 일치하지 않습니다.</span>
				</div>
				<div class="mb-3">
					<label for="userName" class="form-label ms-1">이름 <span class="text-danger">*</span></label> 
					<input type="text" class="form-control w-50" id="userName">
					<span class="text-danger ms-1">이름을 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<label for="userSsn1" class="form-label ms-1">주민번호 <span class="text-danger">*</span></label> 
					<div class="d-flex">
						<input type="text" class="form-control me-1 w-25" id="userSsn1" maxlength="6">
						<span class="mt-2 ms-2 me-2"> - </span>
						<input type="text" class="form-control ms-1 w-25" id="userSsn2" maxlength="7">					
					</div>
					<span class="text-danger ms-1">주민번호를 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<label>이메일 <span class="text-danger">*</span></label>
					<input type="email" class="form-control me-1 w-75" id="userEmail">				
				<span class="text-danger ms-1">이메일을 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<label>전화번호 <span class="text-danger">*</span></label>
					<div class="d-flex">
						<input type="text" class="form-control me-1 w-25" id="userPhone1" maxlength="3">
						<span class="mt-2 ms-2 me-2"> - </span>
						<input type="text" class="form-control ms-1 w-25" id="userPhone2" maxlength="4">
						<span class="mt-2 ms-2 me-2"> - </span>
						<input type="text" class="form-control ms-1 w-25" id="userPhone3" maxlength="4">					
					</div>					
				<span class="text-danger ms-1">전화번호를 입력해주세요.</span>
				</div>
				<div class="mb-5">
					<label>주소 <span class="text-danger">*</span></label>
					<div class="d-flex justify-content-start mb-2">
						<input type="text" placeholder="우편번호" disabled="disabled" class="form-control w-50 me-2" >
						<button type="button" class="btn btn-outline-dark ms-2">주소검색</button>
					</div>	
					<div class="mb-2">
						<input type="text" class="form-control" placeholder="기본주소" disabled="disabled" />
					</div>
					<div class="mb-2">
						<input type="text" class="form-control" placeholder="상세주소" />
					</div>
				<span class="text-danger ms-1">주소를 입력해주세요.</span>
				</div>
				<div class="d-flex justify-content-center g-3 mt-4 ">
					<button type="submit" class="btn btn-dark py-2 me-2 w-25">회원가입</button>
					 <button type="reset" class="btn btn-outline-dark py-2">취소</button>
				</div>
			</form>
		</div>
	</section>
</main>

<jsp:include page="/common/footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>