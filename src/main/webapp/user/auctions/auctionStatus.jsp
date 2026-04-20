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
				<div class="card shadow-sm border-0 mb-4 p-4">
					<div class="card-header bg-white py-3">
						<h5 class="mb-0 fw-bold">
							<i class="bi bi-play-circle text-primary me-2"></i>진행 중인 경매 현황
						</h5>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table align-middle border-top">
								<thead class="table-light">
									<tr class="text-center">
										<th style="width: 50%">경매 상품 정보</th>
										<th style="width: 20%">입찰 현황</th>
										<th style="width: 15%">남은 시간</th>
										<th style="width: 15%">참여 인원</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<div class="bg-light rounded me-3"
													style="width: 60px; height: 60px;"></div>
												<div>
													<div class="fw-bold">
														<a href="/auctions/#" class="text-decoration-none text-dark link-primary">아이언맨 마크 85 피규어</a>
													</div>
													<div class="text-muted small">시작일: 2026-04-19</div>
												</div>
											</div>
										</td>
										<td>
											<div class="small">
												<div class="d-flex justify-content-between mb-1">
													<span class="fw-bold text-success">1순위</span> <span
														class="fw-bold text-success">155,000원</span>
												</div>
												<div class="d-flex justify-content-between mb-1 text-muted">
													<span>2순위</span> <span>150,000원</span>
												</div>
												<div class="d-flex justify-content-between text-muted">
													<span>3순위</span> <span>-</span>
												</div>
											</div>
										</td>
										<td class="text-center"><span class="text-danger fw-bold">02:45:12</span>
										</td>
										<td class="text-center"><span
											class="badge rounded-pill bg-primary px-3">12명</span></td>
									</tr>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<div class="bg-light rounded me-3"
													style="width: 60px; height: 60px;"></div>
												<div>
													<div class="fw-bold">
														<a href="/auctions/#" class="text-decoration-none text-dark link-primary">아이언맨 마크 85 피규어</a>
													</div>
													<div class="text-muted small">시작일: 2026-04-19</div>
												</div>
											</div>
										</td>
										<td>
											<div class="small">
												<div class="d-flex justify-content-between mb-1">
													<span class="fw-bold text-success">1순위</span> <span
														class="fw-bold text-success">155,000원</span>
												</div>
												<div class="d-flex justify-content-between mb-1 text-muted">
													<span>2순위</span> <span>150,000원</span>
												</div>
												<div class="d-flex justify-content-between text-muted">
													<span>3순위</span> <span>-</span>
												</div>
											</div>
										</td>
										<td class="text-center"><span class="text-danger fw-bold">02:45:12</span>
										</td>
										<td class="text-center"><span
											class="badge rounded-pill bg-primary px-3">12명</span></td>
									</tr>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<div class="bg-light rounded me-3"
													style="width: 60px; height: 60px;"></div>
												<div>
													<div class="fw-bold">
														<a href="/auctions/#" class="text-decoration-none text-dark link-primary">아이언맨 마크 85 피규어</a>
													</div>
													<div class="text-muted small">시작일: 2026-04-19</div>
												</div>
											</div>
										</td>
										<td>
											<div class="small">
												<div class="d-flex justify-content-between mb-1">
													<span class="fw-bold text-success">1순위</span> <span
														class="fw-bold text-success">155,000원</span>
												</div>
												<div class="d-flex justify-content-between mb-1 text-muted">
													<span>2순위</span> <span>150,000원</span>
												</div>
												<div class="d-flex justify-content-between text-muted">
													<span>3순위</span> <span>-</span>
												</div>
											</div>
										</td>
										<td class="text-center"><span class="text-danger fw-bold">02:45:12</span>
										</td>
										<td class="text-center"><span
											class="badge rounded-pill bg-primary px-3">12명</span></td>
									</tr>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<div class="bg-light rounded me-3"
													style="width: 60px; height: 60px;"></div>
												<div>
													<div class="fw-bold">
														<a href="/auctions/#" class="text-decoration-none text-dark link-primary">아이언맨 마크 85 피규어</a>
													</div>
													<div class="text-muted small">시작일: 2026-04-19</div>
												</div>
											</div>
										</td>
										<td>
											<div class="small">
												<div class="d-flex justify-content-between mb-1">
													<span class="fw-bold text-success">1순위</span> <span
														class="fw-bold text-success">155,000원</span>
												</div>
												<div class="d-flex justify-content-between mb-1 text-muted">
													<span>2순위</span> <span>150,000원</span>
												</div>
												<div class="d-flex justify-content-between text-muted">
													<span>3순위</span> <span>-</span>
												</div>
											</div>
										</td>
										<td class="text-center"><span class="text-danger fw-bold">02:45:12</span>
										</td>
										<td class="text-center"><span
											class="badge rounded-pill bg-primary px-3">12명</span></td>
									</tr>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<div class="bg-light rounded me-3"
													style="width: 60px; height: 60px;"></div>
												<div>
													<div class="fw-bold">
														<a href="/auctions/#" class="text-decoration-none text-dark link-primary">아이언맨 마크 85 피규어</a>
													</div>
													<div class="text-muted small">시작일: 2026-04-19</div>
												</div>
											</div>
										</td>
										<td>
											<div class="small">
												<div class="d-flex justify-content-between mb-1">
													<span class="fw-bold text-success">1순위</span> <span
														class="fw-bold text-success">155,000원</span>
												</div>
												<div class="d-flex justify-content-between mb-1 text-muted">
													<span>2순위</span> <span>150,000원</span>
												</div>
												<div class="d-flex justify-content-between text-muted">
													<span>3순위</span> <span>-</span>
												</div>
											</div>
										</td>
										<td class="text-center"><span class="text-danger fw-bold">02:45:12</span>
										</td>
										<td class="text-center"><span
											class="badge rounded-pill bg-primary px-3">12명</span></td>
									</tr>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<div class="bg-light rounded me-3"
													style="width: 60px; height: 60px;"></div>
												<div>
													<div class="fw-bold">
														<a href="/auctions/#" class="text-decoration-none text-dark link-primary">아이언맨 마크 85 피규어</a>
													</div>
													<div class="text-muted small">시작일: 2026-04-19</div>
												</div>
											</div>
										</td>
										<td>
											<div class="small">
												<div class="d-flex justify-content-between mb-1">
													<span class="fw-bold text-success">1순위</span> <span
														class="fw-bold text-success">155,000원</span>
												</div>
												<div class="d-flex justify-content-between mb-1 text-muted">
													<span>2순위</span> <span>150,000원</span>
												</div>
												<div class="d-flex justify-content-between text-muted">
													<span>3순위</span> <span>-</span>
												</div>
											</div>
										</td>
										<td class="text-center"><span class="text-danger fw-bold">02:45:12</span>
										</td>
										<td class="text-center"><span
											class="badge rounded-pill bg-primary px-3">12명</span></td>
									</tr>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<div class="bg-light rounded me-3"
													style="width: 60px; height: 60px;"></div>
												<div>
													<div class="fw-bold">
														<a href="/auctions/#" class="text-decoration-none text-dark link-primary">아이언맨 마크 85 피규어</a>
													</div>
													<div class="text-muted small">시작일: 2026-04-19</div>
												</div>
											</div>
										</td>
										<td>
											<div class="small">
												<div class="d-flex justify-content-between mb-1">
													<span class="fw-bold text-success">1순위</span> <span
														class="fw-bold text-success">155,000원</span>
												</div>
												<div class="d-flex justify-content-between mb-1 text-muted">
													<span>2순위</span> <span>150,000원</span>
												</div>
												<div class="d-flex justify-content-between text-muted">
													<span>3순위</span> <span>-</span>
												</div>
											</div>
										</td>
										<td class="text-center"><span class="text-danger fw-bold">02:45:12</span>
										</td>
										<td class="text-center"><span
											class="badge rounded-pill bg-primary px-3">12명</span></td>
									</tr>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<div class="bg-light rounded me-3"
													style="width: 60px; height: 60px;"></div>
												<div>
													<div class="fw-bold">
														<a href="/auctions/#" class="text-decoration-none text-dark link-primary">아이언맨 마크 85 피규어</a>
													</div>
													<div class="text-muted small">시작일: 2026-04-19</div>
												</div>
											</div>
										</td>
										<td>
											<div class="small">
												<div class="d-flex justify-content-between mb-1">
													<span class="fw-bold text-success">1순위</span> <span
														class="fw-bold text-success">155,000원</span>
												</div>
												<div class="d-flex justify-content-between mb-1 text-muted">
													<span>2순위</span> <span>150,000원</span>
												</div>
												<div class="d-flex justify-content-between text-muted">
													<span>3순위</span> <span>-</span>
												</div>
											</div>
										</td>
										<td class="text-center"><span class="text-danger fw-bold">02:45:12</span>
										</td>
										<td class="text-center"><span
											class="badge rounded-pill bg-primary px-3">12명</span></td>
									</tr>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<div class="bg-light rounded me-3"
													style="width: 60px; height: 60px;"></div>
												<div>
													<div class="fw-bold">
														<a href="/auctions/#" class="text-decoration-none text-dark link-primary">아이언맨 마크 85 피규어</a>
													</div>
													<div class="text-muted small">시작일: 2026-04-19</div>
												</div>
											</div>
										</td>
										<td>
											<div class="small">
												<div class="d-flex justify-content-between mb-1">
													<span class="fw-bold text-success">1순위</span> <span
														class="fw-bold text-success">155,000원</span>
												</div>
												<div class="d-flex justify-content-between mb-1 text-muted">
													<span>2순위</span> <span>150,000원</span>
												</div>
												<div class="d-flex justify-content-between text-muted">
													<span>3순위</span> <span>-</span>
												</div>
											</div>
										</td>
										<td class="text-center"><span class="text-danger fw-bold">02:45:12</span>
										</td>
										<td class="text-center"><span
											class="badge rounded-pill bg-primary px-3">12명</span></td>
									</tr>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<div class="bg-light rounded me-3"
													style="width: 60px; height: 60px;"></div>
												<div>
													<div class="fw-bold">
														<a href="/auctions/#" class="text-decoration-none text-dark link-primary">아이언맨 마크 85 피규어</a>
													</div>
													<div class="text-muted small">시작일: 2026-04-19</div>
												</div>
											</div>
										</td>
										<td>
											<div class="small">
												<div class="d-flex justify-content-between mb-1">
													<span class="fw-bold text-success">1순위</span> <span
														class="fw-bold text-success">155,000원</span>
												</div>
												<div class="d-flex justify-content-between mb-1 text-muted">
													<span>2순위</span> <span>150,000원</span>
												</div>
												<div class="d-flex justify-content-between text-muted">
													<span>3순위</span> <span>-</span>
												</div>
											</div>
										</td>
										<td class="text-center"><span class="text-danger fw-bold">02:45:12</span>
										</td>
										<td class="text-center"><span
											class="badge rounded-pill bg-primary px-3">12명</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<nav aria-label="Page navigation" class="mt-4">
						<ul class="pagination justify-content-center">
							<li class="page-item disabled">
								<a class="page-link" href="#" aria-label="Previous"> 
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Next"> 
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</ul>
					</nav>
				</div>
			</section>
		</div>
	</div>

	<jsp:include page="/common/footer.jsp" />
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script> -->
</body>
</html>