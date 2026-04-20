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
					<div class="card-header bg-white py-3 border-bottom text-secondary">
						<h5 class="mb-0 fw-bold">내 입찰 이력</h5>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table align-middle text-center">
								<thead class="table-light">
									<tr>
										<th class="text-start">종료 상품명</th>
										<th>나의 최종 입찰가</th>
										<th>내 입찰 횟수</th>
										<th>최종 결과</th>
										<th>상세 내역</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-start fw-bold text-truncate"
											style="max-width: 200px;">도라에몽 피규어 세트</td>
										<td>120,000원</td>
										<td>5회</td>
										<td><span class="badge bg-success">낙찰</span>
											<div class="text-success small" style="font-size: 0.7rem;">(거래완료)</div>
										</td>
										<td><button class="btn btn-sm btn-light border">상세보기</button></td>
									</tr>
									<tr>
										<td class="text-start fw-bold text-muted">해리포터 지팡이</td>
										<td>85,000원</td>
										<td>2회</td>
										<td><span class="badge bg-secondary">패찰</span></td>
										<td><button class="btn btn-sm btn-light border">상세보기</button></td>
									</tr>
									<tr>
										<td class="text-start fw-bold">레고 스타워즈</td>
										<td>300,000원</td>
										<td>8회</td>
										<td><span class="badge bg-danger">낙찰</span>
											<div class="text-danger small" style="font-size: 0.7rem;">(낙찰취소/미입금)</div>
										</td>
										<td><button
												class="btn btn-sm btn-light border text-danger">사유확인</button></td>
									</tr>
									<tr>
										<td class="text-start fw-bold text-muted">해리포터 지팡이</td>
										<td>85,000원</td>
										<td>2회</td>
										<td><span class="badge bg-secondary">패찰</span></td>
										<td><button class="btn btn-sm btn-light border">상세보기</button></td>
									</tr>
									<tr>
										<td class="text-start fw-bold text-muted">해리포터 지팡이</td>
										<td>85,000원</td>
										<td>2회</td>
										<td><span class="badge bg-secondary">패찰</span></td>
										<td><button class="btn btn-sm btn-light border">상세보기</button></td>
									</tr>
									<tr>
										<td class="text-start fw-bold">레고 스타워즈</td>
										<td>300,000원</td>
										<td>8회</td>
										<td><span class="badge bg-danger">낙찰</span>
											<div class="text-danger small" style="font-size: 0.7rem;">(낙찰취소/미입금)</div>
										</td>
										<td><button
												class="btn btn-sm btn-light border text-danger">사유확인</button></td>
									</tr>
									<tr>
										<td class="text-start fw-bold">레고 스타워즈</td>
										<td>300,000원</td>
										<td>8회</td>
										<td><span class="badge bg-danger">낙찰</span>
											<div class="text-danger small" style="font-size: 0.7rem;">(낙찰취소/미입금)</div>
										</td>
										<td><button
												class="btn btn-sm btn-light border text-danger">사유확인</button></td>
									</tr>
									<tr>
										<td class="text-start fw-bold text-truncate"
											style="max-width: 200px;">도라에몽 피규어 세트</td>
										<td>120,000원</td>
										<td>5회</td>
										<td><span class="badge bg-success">낙찰</span>
											<div class="text-success small" style="font-size: 0.7rem;">(거래완료)</div>
										</td>
										<td><button class="btn btn-sm btn-light border">상세보기</button></td>
									</tr>
									<tr>
										<td class="text-start fw-bold text-truncate"
											style="max-width: 200px;">도라에몽 피규어 세트</td>
										<td>120,000원</td>
										<td>5회</td>
										<td><span class="badge bg-success">낙찰</span>
											<div class="text-success small" style="font-size: 0.7rem;">(거래완료)</div>
										</td>
										<td><button class="btn btn-sm btn-light border">상세보기</button></td>
									</tr><tr>
										<td class="text-start fw-bold text-truncate"
											style="max-width: 200px;">도라에몽 피규어 세트</td>
										<td>120,000원</td>
										<td>5회</td>
										<td><span class="badge bg-success">낙찰</span>
											<div class="text-success small" style="font-size: 0.7rem;">(거래완료)</div>
										</td>
										<td><button class="btn btn-sm btn-light border">상세보기</button></td>
									</tr>
								</tbody>
							</table>
							<nav class="mt-4">
								<ul class="pagination justify-content-center">
									<li class="page-item disabled"><a class="page-link"
										href="#">&laquo;</a></li>
									<li class="page-item active"><a class="page-link" href="#">1</a></li>
									<li class="page-item "><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">4</a></li>
									<li class="page-item"><a class="page-link" href="#">5</a></li>
									<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>

	<jsp:include page="/common/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>