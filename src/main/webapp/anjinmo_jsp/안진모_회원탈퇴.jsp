<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/unregister.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous">
	
</script>
<title></title>
</head>
<body>
	<div class="body">
		<div class="top">
			<h1 class="big">회원 탈퇴</h1>
			<div>
				<span class="name">안진모</span>님 회원 탈퇴시 계정 복구및 재사용이 불가합니다.
			</div>
		</div>
		<div class="body2">
			<div>
				<span class="term">탈퇴약관</span>
				<div class="termcontent">
					탈퇴시 회원정보 및 서비스 이용 기록은 몇년뒤 삭제됩니다 회원 정보 및 상품등록 경매기록 등은 이후 분쟁 및 ....
					회원 탈퇴 약관에 대한 내용
					<ul class="list-group list-group-flush">
						<li class="list-group-item">이런거있고</li>
						<li class="list-group-item">이런거 있다</li>
						<li class="list-group-item">A third item</li>
						<li class="list-group-item">A fourth item</li>
						<li class="list-group-item">And a fifth one</li>
					</ul>
				</div>

				<div class="form-check">
					<input class="form-check-input" type="checkbox" value=""
						id="checkIndeterminate"> <label class="form-check-label"
						for="checkIndeterminate"> 회원 탈퇴에 대한 내용을 확인 하였습니다 </label>
				</div>
			</div>



			<div class="moneycheck">
				<!-- <span>현재 소유 금액</span><br /> <span>예치금 : </span><br /> <span>머니
					: </span> -->
				<ul class="list-group">
					<li class="list-group-item">현재 소유 금액</li>
					<li class="list-group-item">예치금</li>
					<li class="list-group-item">머니</li>
				</ul>
			</div>


			<span>본인 확인을 위해 내용을 입력해주세요</span>
			<div class="mb-3 row">
				<label for="staticName" class="col-sm-2 col-form-label">이름</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="staticName" value="안진모">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="staticId" class="col-sm-2 col-form-label">ID</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="staticId" value="zx94**">
				</div>
			</div>
			<!-- 본인 확인 비밀번호 확인 -->
			<form action="" method="post">

				<div class="mb-3 row">
					<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword">
					</div>
				</div>
			</form>
			<div class="d-grid gap-2 col-6 mx-auto">
				<span class="last">위 내용을 모두 확인하고 회원을 탈퇴 합니다.</span>
				<button class="btn btn-primary" type="button">회원 탈퇴</button>
			</div>
		</div>
	</div>


</body>
</html>