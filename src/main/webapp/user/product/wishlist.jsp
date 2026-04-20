<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body class="bg-light">
  <jsp:include page="/common/header.jsp" />

	<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
		<div class="row">
			<aside class="col-md-3">
				<jsp:include page="/common/mypage_layout.jsp" />
			</aside>
			<section class="col-md-9">
				<div class="card shadow-sm border-0 bg-white">
					<div
						class="card-header bg-white py-3 d-flex justify-content-between align-items-center border-bottom">
						<h5 class="mb-0 fw-bold">내 관심 상품</h5>
						<span class="text-muted small">찜한 상품 <span
							class="text-primary fw-bold">12</span>건
						</span>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table align-middle">
								<thead class="table-light">
									<tr class="text-center">
										<th style="width: 45%">상품 정보</th>
										<th style="width: 15%">판매가/시작과</th>
										<th style="width: 20%">경매 상태</th>
										<th style="width: 20%">관리</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<div class="bg-light rounded"
													style="width: 60px; height: 60px;"></div>
												<div class="ms-3">
													<div class="fw-bold">해리포터 호그와트 성 레고</div>
													<div class="text-muted small">판매자: user01</div>
												</div>
											</div>
										</td>
										<td class="text-center">
											<div class="fw-bold">450,000원</div>
										</td>
										<td class="text-center"><span
											class="badge bg-danger mb-1">경매 진행중</span>
											<div class="text-danger small fw-bold"
												style="font-size: 0.75rem;">마감 02:15:00</div></td>
										<td class="text-center">
											<div class="d-grid gap-2">
												<button class="btn btn-sm btn-primary fw-bold">입찰하기</button>
												<button class="btn btn-sm btn-outline-secondary">찜
													해제</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<div class="bg-light rounded"
													style="width: 60px; height: 60px;"></div>
												<div class="ms-3">
													<div class="fw-bold text-muted">스타워즈 밀레니엄 팔콘</div>
													<div class="text-muted small">판매자: collector99</div>
												</div>
											</div>
										</td>
										<td class="text-center text-muted">850,000원</td>
										<td class="text-center text-muted small">경매 준비중</td>
										<td class="text-center">
											<div class="d-grid gap-2">
												<button class="btn btn-sm btn-light border disabled">참여불가</button>
												<button class="btn btn-sm btn-outline-secondary">찜
													해제</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<div class="bg-light rounded"
													style="width: 60px; height: 60px;"></div>
												<div class="ms-3">
													<div class="fw-bold text-muted">스타워즈 밀레니엄 팔콘</div>
													<div class="text-muted small">판매자: collector99</div>
												</div>
											</div>
										</td>
										<td class="text-center text-muted">850,000원</td>
										<td class="text-center text-muted small">경매 준비중</td>
										<td class="text-center">
											<div class="d-grid gap-2">
												<button class="btn btn-sm btn-light border disabled">참여불가</button>
												<button class="btn btn-sm btn-outline-secondary">찜
													해제</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<div class="bg-light rounded"
													style="width: 60px; height: 60px;"></div>
												<div class="ms-3">
													<div class="fw-bold text-muted">스타워즈 밀레니엄 팔콘</div>
													<div class="text-muted small">판매자: collector99</div>
												</div>
											</div>
										</td>
										<td class="text-center text-muted">850,000원</td>
										<td class="text-center text-muted small">경매 준비중</td>
										<td class="text-center">
											<div class="d-grid gap-2">
												<button class="btn btn-sm btn-light border disabled">참여불가</button>
												<button class="btn btn-sm btn-outline-secondary">찜
													해제</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<div class="bg-light rounded"
													style="width: 60px; height: 60px;"></div>
												<div class="ms-3">
													<div class="fw-bold text-muted">스타워즈 밀레니엄 팔콘</div>
													<div class="text-muted small">판매자: collector99</div>
												</div>
											</div>
										</td>
										<td class="text-center text-muted">850,000원</td>
										<td class="text-center text-muted small">경매 준비중</td>
										<td class="text-center">
											<div class="d-grid gap-2">
												<button class="btn btn-sm btn-light border disabled">참여불가</button>
												<button class="btn btn-sm btn-outline-secondary">찜
													해제</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<div class="bg-light rounded"
													style="width: 60px; height: 60px;"></div>
												<div class="ms-3">
													<div class="fw-bold text-muted">스타워즈 밀레니엄 팔콘</div>
													<div class="text-muted small">판매자: collector99</div>
												</div>
											</div>
										</td>
										<td class="text-center text-muted">850,000원</td>
										<td class="text-center text-muted small">경매 준비중</td>
										<td class="text-center">
											<div class="d-grid gap-2">
												<button class="btn btn-sm btn-light border disabled">참여불가</button>
												<button class="btn btn-sm btn-outline-secondary">찜
													해제</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<nav class="mt-4">
							<ul class="pagination justify-content-center">
								<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
								<li class="page-item "><a class="page-link" href="#">2</a></li>
								<li class="page-item "><a class="page-link" href="#">3</a></li>
								<li class="page-item "><a class="page-link" href="#">4</a></li>
								<li class="page-item "><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</section>
		</div>
	</div>

    <jsp:include page="/common/footer.jsp" />
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script> -->
</body>
</html>