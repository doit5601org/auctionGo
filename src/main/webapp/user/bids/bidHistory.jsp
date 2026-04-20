<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
				<div class="card shadow-sm border-0 bg-white p-4">
					<div class="card-header bg-white py-3 border-bottom text-dark">
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
									<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
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
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 입찰 이력</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>

<script>
$(function() {
    // 입찰 이력 테이블 내의 버튼만 타겟팅 (사이드바 간섭 방지)
    $('#bid-history-table').on('click', '.detail-btn', function(e) {
        e.preventDefault();

        // 1. 내가 제어할 타겟 (내 조상의 형제인 .collapse 행)
        const $targetRow = $(this).closest('tr').next('.collapse');
        
        // 2. 이 테이블 안에서 이미 열려있는 다른 상세 행들 찾기
        const $otherRows = $('#bid-history-table').find('.collapse').not($targetRow);

        // 3. 다른 상세 행은 즉시 닫기 (빠릿빠릿한 느낌)
        $otherRows.stop(true, true).hide().removeClass('show');

        // 4. 내 타겟 행 토글
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

<style>
    /* 상세 페이지 링크 스타일 */
    .product-link { color: #212529; transition: color 0.2s; }
    .product-link:hover { color: #0d6efd !important; }
    
    /* 아코디언 행 배경색 및 간격 */
    #bid-history-table .collapse.bg-light { background-color: #f8f9fa !important; }
    #bid-history-table tr.collapse td { border-top: none; }
</style>
</head>
<body class="bg-light">
    <jsp:include page="/common/header.jsp" />

    <div class="container" style="margin-top: 50px; margin-bottom: 50px;">
        <div class="row">
            <aside class="col-md-3">
                <jsp:include page="/common/mypage_layout.jsp" />
            </aside>
            <section class="col-md-9">
                <div class="card shadow-sm border-0 bg-white p-4">
                    <div class="card-header bg-white py-3 border-bottom text-dark">
                        <h5 class="mb-0 fw-bold">내 입찰 이력</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table align-middle text-center" id="bid-history-table">
                                <thead class="table-light">
                                    <tr>
                                        <th class="text-start">종료 상품명</th>
                                        <th>나의 최종 입찰가</th>
                                        <th>내 입찰 횟수</th>
                                        <th>최종 결과</th>
                                        <th>비고</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-start">
                                            <a href="${pageContext.request.contextPath}/product/detail.do?id=101" class="fw-bold text-decoration-none product-link">
                                                도라에몽 피규어 세트
                                            </a>
                                        </td>
                                        <td>120,000원</td>
                                        <td>5회</td>
                                        <td><span class="badge bg-success">낙찰</span></td>
                                        <td><button type="button" class="btn btn-sm btn-light border detail-btn">상세</button></td>
                                    </tr>
                                    <tr class="collapse bg-light">
                                        <td colspan="5" class="p-3 text-start">
                                            <div class="ms-4 small">
                                                <p class="mb-1"><strong>최종 낙찰 일시:</strong> 2026-03-15 18:00</p>
                                                <p class="mb-0 text-success"><strong>상태:</strong> 거래완료 (정상 입금 확인)</p>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="text-start">
                                            <a href="${pageContext.request.contextPath}/product/detail.do?id=102" class="fw-bold text-decoration-none product-link">
                                                레고 스타워즈
                                            </a>
                                        </td>
                                        <td>300,000원</td>
                                        <td>8회</td>
                                        <td><span class="badge bg-danger">낙찰</span></td>
                                        <td><button type="button" class="btn btn-sm btn-light border text-danger detail-btn">사유</button></td>
                                    </tr>
                                    <tr class="collapse bg-light">
                                        <td colspan="5" class="p-3 text-start">
                                            <div class="ms-4 small">
                                                <p class="mb-1 text-danger"><strong>취소 사유:</strong> 낙찰 후 24시간 내 미입금</p>
                                                <p class="mb-0"><strong>취소 일시:</strong> 2026-03-17 09:00</p>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="text-start">
                                            <a href="${pageContext.request.contextPath}/product/detail.do?id=103" class="fw-bold text-decoration-none text-muted product-link">
                                                해리포터 지팡이
                                            </a>
                                        </td>
                                        <td>85,000원</td>
                                        <td>2회</td>
                                        <td><span class="badge bg-secondary">패찰</span></td>
                                        <td><button type="button" class="btn btn-sm btn-light border detail-btn">상세</button></td>
                                    </tr>
                                    <tr class="collapse bg-light">
                                        <td colspan="5" class="p-3 text-start">
                                            <div class="ms-4 small">
                                                <p class="mb-1"><strong>최종 낙찰가:</strong> 95,000원 (낙찰 실패)</p>
                                                <p class="mb-0"><strong>경매 종료일:</strong> 2026-03-10</p>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <jsp:include page="/common/footer.jsp" />
   <!--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script> -->
</body>
</html>