<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>
	<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
		<div class="row">
			<aside class="col-md-3">
				<jsp:include page="/common/mypage_layout.jsp" />
			</aside>
			<section class="col-md-9">
				<div class="card shadow-sm border-0">
					<div
						class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
						<h5 class="mb-0 fw-bold">
							내 등록 상품 <span class="text-primary small">5</span>
						</h5>
						<button class="btn btn-primary btn-sm px-3"
							onclick="location.href='/product/register'">
							<i class="bi bi-plus-lg"></i> 새 상품 등록
						</button>
					</div>
					<div class="card-body">
						<ul class="nav nav-tabs mb-4" id="productTab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link active" data-bs-toggle="tab"
									type="button">전체</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" data-bs-toggle="tab" type="button">공개</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" data-bs-toggle="tab" type="button">비공개</button>
							</li>
						</ul>

						<div class="table-responsive">
							<table class="table align-middle border-top">
								<thead class="table-light">
									<tr>
										<th style="width: 15%">이미지</th>
										<th style="width: 35%">상품 정보</th>
										<th style="width: 15%">상태</th>
										<th style="width: 15%">등록일</th>
										<th style="width: 20%">관리</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class="bg-light rounded"
												style="height: 60px; width: 60px;"></div>
										</td>
										<td>
											<div class="fw-bold">아이언맨 피규어</div>
											<div class="text-muted small">120,000원</div>
										</td>
										<td><span
											class="badge bg-success-subtle text-success border border-success">공개</span></td>
										<td class="text-muted small">2026-04-15</td>
										<td>
											<div class="d-flex gap-1">
												<button class="btn btn-outline-secondary btn-sm">수정</button>
												<button class="btn btn-outline-primary btn-sm fw-bold">경매
													등록</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="bg-light rounded"
												style="height: 60px; width: 60px;"></div>
										</td>
										<td>
											<div class="fw-bold text-muted">도라에몽 피규어</div>
											<div class="text-muted small">15,000원</div>
										</td>
										<td><span
											class="badge bg-secondary-subtle text-secondary border border-secondary">비공개</span></td>
										<td class="text-muted small">2026-04-18</td>
										<td>
											<div class="d-flex gap-1">
												<button class="btn btn-outline-secondary btn-sm">수정</button>
												<button class="btn btn-light btn-sm text-primary">공개
													전환</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="bg-light rounded"
												style="height: 60px; width: 60px;"></div>
										</td>
										<td>
											<div class="fw-bold text-muted">도라에몽 피규어</div>
											<div class="text-muted small">15,000원</div>
										</td>
										<td><span
											class="badge bg-secondary-subtle text-secondary border border-secondary">비공개</span></td>
										<td class="text-muted small">2026-04-18</td>
										<td>
											<div class="d-flex gap-1">
												<button class="btn btn-outline-secondary btn-sm">수정</button>
												<button class="btn btn-light btn-sm text-primary">공개
													전환</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="bg-light rounded"
												style="height: 60px; width: 60px;"></div>
										</td>
										<td>
											<div class="fw-bold text-muted">도라에몽 피규어</div>
											<div class="text-muted small">15,000원</div>
										</td>
										<td><span
											class="badge bg-secondary-subtle text-secondary border border-secondary">비공개</span></td>
										<td class="text-muted small">2026-04-18</td>
										<td>
											<div class="d-flex gap-1">
												<button class="btn btn-outline-secondary btn-sm">수정</button>
												<button class="btn btn-light btn-sm text-primary">공개
													전환</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="bg-light rounded"
												style="height: 60px; width: 60px;"></div>
										</td>
										<td>
											<div class="fw-bold text-muted">도라에몽 피규어</div>
											<div class="text-muted small">15,000원</div>
										</td>
										<td><span
											class="badge bg-secondary-subtle text-secondary border border-secondary">비공개</span></td>
										<td class="text-muted small">2026-04-18</td>
										<td>
											<div class="d-flex gap-1">
												<button class="btn btn-outline-secondary btn-sm">수정</button>
												<button class="btn btn-light btn-sm text-primary">공개
													전환</button>
											</div>
										</td>
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


	<jsp:include page="/common/footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>
</html>