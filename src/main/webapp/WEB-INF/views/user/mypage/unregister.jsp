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
<script type="text/javascript">
	function subm() {
		let first = document.getElementById("checkIndeterminate");
		let second = document.getElementById("checkmoneyIndeterminate");
		let pass = document.getElementById("inputPassword");

		if (!first.checked) {
			alert("회원 탈퇴 약관을 읽고 동의해주세요.");
			first.focus();
			return;
		}

		if (!second.checked) {
			alert("회원 탈퇴 환불 약관을 읽고 동의해주세요.");
			second.focus();
			return;
		}

		if (pass.value == "") {
			alert("본인 확인을위해 비밀번호를 입력해주세요.");
			pass.focus();
			return;
		}
		document.unregisterForm.submit();
	}
</script>
<title></title>
</head>
<body>
	<jsp:include page="/common/header.jsp"></jsp:include>
	<div class="row">
		<aside class="col-md-3">
			<jsp:include page="/common/mypage_layout.jsp" />
		</aside>
		<div class="col-md-9">
			<div class="body shadow-sm border-0 bg-white p-4">



				<div class="top">
					<h1 class="big">회원 탈퇴</h1>
					<div>
						<span class="name">안진모</span>님 회원 탈퇴시 계정 복구 및 재사용이 불가합니다.
					</div>
				</div>
				<div class="body2">
					<div>
						<span class="term">탈퇴 약관</span>
						<div class="termcontent">
							<span class="con">탈퇴시 회원정보 및 서비스 이용 약관 상품등록 경매기록 등은 이후 분쟁
								및 .... 회원 탈퇴 약관에 대한 내용</span> <br />
							<ul class="list-group list-group-flush">
								<li class="list-group-item">탈퇴시 회원정보 및 서비스 이용 기록은 한달 뒤
									삭제됩니다.</li>
								<li class="list-group-item">이런거 있다</li>
								<li class="list-group-item">123</li>
								<li class="list-group-item">qwe</li>
								<li class="list-group-item">ㄱㄴㄷ</li>
							</ul>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="checkIndeterminate"> <label class="form-check-label"
								for="checkIndeterminate"> 회원 탈퇴에 대한 약관을 확인 하였습니다 </label>
						</div>
					</div>



					<div class="moneycheck">
						<!-- <span>현재 소유 금액</span><br /> <span>예치금 : </span><br /> <span>머니
					: </span> -->
						<ul class="list-group moneylist">
							<li class="list-group-item">현재 소유 금액</li>
							<li class="list-group-item"><span class="lsm">예치금</span><span
								class="lm">10000</span>&nbsp;원</li>
							<li class="list-group-item"><span class="lsm">머니</span><span
								class="lm">10000</span>&nbsp;원</li>
						</ul>
					</div>

					<div>
						<span class="term">머니 환불 약관</span>
						<div class="termcontent">
							<span class="con">회원님의 머니는 예치금과 머니를 통합하여 충전된 금액은 본인계좌로
								환불됩니다 .... 회원 탈퇴 시 환불 약관에 대한 내용</span> <br />
							<ul class="list-group list-group-flush">
								<li class="list-group-item">이런거있고이런거있고이런거있고이런거있고이런거있고이런거있고이런거있고이런거있고이런거있고이런거있고이런거있고이런거있고이런거있고이런거있고이런거있고이런거있고이런거있고이런거있고이런거있고</li>
								<li class="list-group-item">이런거 있다</li>
								<li class="list-group-item">123</li>
								<li class="list-group-item">qwe</li>
								<li class="list-group-item">ㄱㄴㄷ</li>
							</ul>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="checkmoneyIndeterminate"> <label
								class="form-check-label" for="checkmoneyIndeterminate">
								회원 탈퇴 시 환불 규정에 대한 약관을 확인 하였습니다 </label>
						</div>
					</div>
					<form action="" method="post" name="unregisterForm">
						<div class="ownercheck">
							<span style="color: red">*</span>&nbsp;<span>본인 확인을 위해 내용을
								입력해주세요</span><br /> <br />
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

							<div class="mb-3 row">
								<label for="inputPassword" class="col-sm-2 col-form-label">PW</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputPassword"
										required="required" placeholder="비밀번호 확인">
								</div>
							</div>
						</div>
						<div class="d-grid gap-2 col-6 mx-auto lastbtn">
							<span class="last">위 내용을 모두 확인하고 회원을 탈퇴 합니다.</span>
							<button class="btn btn-secondary" type="button" onclick="subm()">회원
								탈퇴</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>

</body>
</html>