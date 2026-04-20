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
					<div class="card-header bg-white py-3 border-bottom">
						<h5 class="mb-0 fw-bold">경매 종료 이력</h5>
					</div>
					<div class="card-body text-center">
						<div class="table-responsive">
							<table class="table align-middle">
								<thead class="table-light">
									<tr>
										<th class="text-start">상품명</th>
										<th>최종 낙찰가</th>
										<th>종료일시</th>
										<th>결과</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-start fw-bold">도라에몽 피규어</td>
										<td>120,000원</td>
										<td class="small text-muted">2026-03-15</td>
										<td><span
											class="badge bg-success-subtle text-success border border-success">거래완료</span></td>
										<td></td>
									</tr>
									<tr>
										<td class="text-start fw-bold text-muted">해리포터 지팡이</td>
										<td>-</td>
										<td class="small text-muted">2026-03-10</td>
										<td><span
											class="badge bg-secondary-subtle text-secondary border border-secondary">유찰</span></td>
										<td><button class="btn btn-sm btn-light border">사유</button></td>
									</tr>
									<tr>
										<td class="text-start fw-bold text-muted">해리포터 지팡이</td>
										<td>-</td>
										<td class="small text-muted">2026-03-10</td>
										<td><span
											class="badge bg-secondary-subtle text-secondary border border-secondary">유찰</span></td>
										<td><button class="btn btn-sm btn-light border">사유</button></td>
									</tr>
									<tr>
										<td class="text-start fw-bold text-muted">해리포터 지팡이</td>
										<td>-</td>
										<td class="small text-muted">2026-03-10</td>
										<td><span
											class="badge bg-secondary-subtle text-secondary border border-secondary">유찰</span></td>
										<td><button class="btn btn-sm btn-light border">사유</button></td>
									</tr>
									<tr>
										<td class="text-start fw-bold text-muted">해리포터 지팡이</td>
										<td>-</td>
										<td class="small text-muted">2026-03-10</td>
										<td><span
											class="badge bg-secondary-subtle text-secondary border border-secondary">유찰</span></td>
										<td><button class="btn btn-sm btn-light border">사유</button></td>
									</tr>
									<tr>
										<td class="text-start fw-bold">도라에몽 피규어</td>
										<td>120,000원</td>
										<td class="small text-muted">2026-03-15</td>
										<td><span
											class="badge bg-success-subtle text-success border border-success">거래완료</span></td>
										<td></td>
									</tr>
									<tr>
										<td class="text-start fw-bold">도라에몽 피규어</td>
										<td>120,000원</td>
										<td class="small text-muted">2026-03-15</td>
										<td><span
											class="badge bg-success-subtle text-success border border-success">거래완료</span></td>
										<td></td>
									</tr>
									<tr>
										<td class="text-start fw-bold">도라에몽 피규어</td>
										<td>120,000원</td>
										<td class="small text-muted">2026-03-15</td>
										<td><span
											class="badge bg-success-subtle text-success border border-success">거래완료</span></td>
										<td></td>
									</tr>
									<tr>
										<td class="text-start fw-bold">도라에몽 피규어</td>
										<td>120,000원</td>
										<td class="small text-muted">2026-03-15</td>
										<td><span
											class="badge bg-success-subtle text-success border border-success">거래완료</span></td>
										<td></td>
									</tr>
									<tr>
										<td class="text-start fw-bold">도라에몽 피규어</td>
										<td>120,000원</td>
										<td class="small text-muted">2026-03-15</td>
										<td><span
											class="badge bg-success-subtle text-success border border-success">거래완료</span></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<nav aria-label="Page navigation" class="mt-4">
						<ul class="pagination justify-content-center">
							<li class="page-item disabled"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
	
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
	
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</section>
		</div>
	</div>

	<jsp:include page="/common/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>