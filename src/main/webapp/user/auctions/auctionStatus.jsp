<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script>
$(function() {
    // 1. 이벤트 대상을 테이블 내의 .detail-btn으로 한정
    $('#auction-status-table').on('click', '.detail-btn', function(e) {
        e.preventDefault();

        // 2. 타겟 설정: 클릭한 버튼의 조상 tr 바로 다음에 오는 .collapse 행
        const $targetRow = $(this).closest('tr').next('.collapse');
        
        // 3. 다른 상세창들만 찾기 (사이드바 메뉴는 절대 건드리지 않음)
        // #auction-history-table 내부의 .collapse 중 현재 타겟이 아닌 것들만!
        const $otherRows = $('#auction-status-table').find('.collapse').not($targetRow);

        // 4. 다른 상세 행은 즉시 닫기
        $otherRows.stop(true, true).hide().removeClass('show');

        // 5. 내 타겟 행만 토글
        $targetRow.stop(true, true).slideToggle(200, function() {
            if ($(this).is(':visible')) {
                $(this).addClass('show');
            } else {
                $(this).removeClass('show');
            }
        });
    });
});
</script>

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
							<table class="table align-middle border-top" id="auction-status-table">
								<thead class="table-light">
									<tr class="text-center">
										<th style="width: 8%">번호</th>
										<th style="width: 32%">경매 상품 정보</th>
										<th style="width: 15%">남은 시간</th>
										<th style="width: 10%">참여 인원</th>
										<th style="width: 15%">입찰 현황</th>
										<th style="width: 10%">취소</th>
									</tr>
								</thead>
								<tbody>
									<!-- <tr>
										<td colspan="5" class="text-center">진행 중인 경매가 존재하지 않습니다.</td>
									</tr> -->
									<tr>
										<td class="text-center">10</td>
										<td>
											<div class="d-flex align-items-center ps-3">
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
										<td class="text-center"><span class="text-danger fw-bold">02:45:12</span>
										</td>
										<td class="text-center"><span
											class="badge rounded-pill bg-primary px-3">12명</span></td>
										<td class="text-center">
											<div class="small px-3">
												<button type="button" class="btn btn-sm btn-dark detail-btn">상세</button>
											</div>
										</td>
										<td>
											<button type="button" class="btn btn-sm btn-outline-dark detail-btn">경매취소</button>
										</td>
									</tr>
									 <tr class="collapse bg-light">
							            <td colspan="6" class="p-3 text-center">
							            	 <div class="ms-4">
												<p class="mb-1">
													<strong class="text-success me-2">1순위</strong> <span
														class="fw-bold text-success">155,000원</span>
												</p>
												<p class="mb-1 small text-muted">
													<strong class="me-2">2순위</strong> <span
														class="fw-bold">150,000원</span>
												</p>
												<p class="mb-0 small text-muted">
													<strong class="me-2">3순위</strong> <span
														class="fw-bold">120,000원</span>
												</p>
											</div>
							            </td>
							        </tr>
							        <tr>
										<td class="text-center">10</td>
										<td>
											<div class="d-flex align-items-center ps-3">
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
										<td class="text-center"><span class="text-danger fw-bold">02:45:12</span>
										</td>
										<td class="text-center"><span
											class="badge rounded-pill bg-primary px-3">12명</span></td>
										<td class="text-center">
											<div class="small px-3">
												<button type="button" class="btn btn-sm btn-dark detail-btn">상세</button>
											</div>
										</td>
										<td>
											<button type="button" class="btn btn-sm btn-outline-dark detail-btn">경매취소</button>
										</td>
									</tr>
									 <tr class="collapse bg-light">
							            <td colspan="6" class="p-3 text-center">
							            	 <div class="ms-4">
												<p class="mb-1">
													<strong class="text-success me-2">1순위</strong> <span
														class="fw-bold text-success">155,000원</span>
												</p>
												<p class="mb-1 small text-muted">
													<strong class="me-2">2순위</strong> <span
														class="fw-bold">150,000원</span>
												</p>
												<p class="mb-0 small text-muted">
													<strong class="me-2">3순위</strong> <span
														class="fw-bold">120,000원</span>
												</p>
											</div>
							            </td>
							        </tr>
							        <tr>
										<td class="text-center">10</td>
										<td>
											<div class="d-flex align-items-center ps-3">
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
										<td class="text-center"><span class="text-danger fw-bold">02:45:12</span>
										</td>
										<td class="text-center"><span
											class="badge rounded-pill bg-primary px-3">12명</span></td>
										<td class="text-center">
											<div class="small px-3">
												<button type="button" class="btn btn-sm btn-dark detail-btn">상세</button>
											</div>
										</td>
										<td>
											<button type="button" class="btn btn-sm btn-outline-dark detail-btn">경매취소</button>
										</td>
									</tr>
									 <tr class="collapse bg-light">
							            <td colspan="6" class="p-3 text-center">
							            	 <div class="ms-4">
												<p class="mb-1">
													<strong class="text-success me-2">1순위</strong> <span
														class="fw-bold text-success">155,000원</span>
												</p>
												<p class="mb-1 small text-muted">
													<strong class="me-2">2순위</strong> <span
														class="fw-bold">150,000원</span>
												</p>
												<p class="mb-0 small text-muted">
													<strong class="me-2">3순위</strong> <span
														class="fw-bold">120,000원</span>
												</p>
											</div>
							            </td>
							        </tr>
							        
							     
							     
									<!-- <tr>
										<td class="text-center">1</td>
										<td>
											<div class="d-flex align-items-center ps-3">
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
											<div class="small px-3">
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
									</tr> -->
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