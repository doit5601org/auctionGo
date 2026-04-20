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
    $('#auction-history-table').on('click', '.detail-btn', function(e) {
        e.preventDefault();

        // 2. 타겟 설정: 클릭한 버튼의 조상 tr 바로 다음에 오는 .collapse 행
        const $targetRow = $(this).closest('tr').next('.collapse');
        
        // 3. 다른 상세창들만 찾기 (사이드바 메뉴는 절대 건드리지 않음)
        // #auction-history-table 내부의 .collapse 중 현재 타겟이 아닌 것들만!
        const $otherRows = $('#auction-history-table').find('.collapse').not($targetRow);

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
<style>
    /* 상세 정보 열릴 때 데이터 행과 상세 행 사이의 선 제거 */
    #auction-history-table tr:has(+ .collapse.show) td {
        border-bottom: none !important;
    }
    /* 상세 정보 행 자체의 배경색을 살짝 주어 구분감 강화 */
    #auction-history-table .collapse.bg-light {
        background-color: #f8f9fa !important;
    }
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
        <div class="card-header bg-white py-3 border-bottom">
            <h5 class="mb-0 fw-bold">경매 종료 이력</h5>
        </div>
        <div class="card-body">
            <div class="table-responsive">
<table class="table align-middle" id="auction-history-table">
    <thead class="table-light">
        <tr>
            <th class="text-start" style="width: 5%;">번호</th>
            <th class="text-center" style="width: 25%;">상품명</th>
            <th style="width: 25%;">최종 낙찰가</th>
            <th style="width: 20%;">종료일시</th>
            <th style="width: 15%;">결과</th>
            <th style="width: 10%;">비고</th>
        </tr>
    </thead>
    <tbody>
   		<!-- <tr>
   			<td colspan="6" class="text-center">경매 이력이 존재하지 않습니다.</td>
   		</tr> -->
        <tr>
        	<td class="text-center">10</td>
            <td class="text-start">
                <a href="${pageContext.request.contextPath}/product/detail.do?id=1" class="fw-bold text-decoration-none text-dark ps-3 link-primary">
                    도라에몽 피규어
                </a>
            </td>
            <td>120,000원</td>
            <td class="small text-muted">2026-03-15</td>
            <td><span class="badge bg-success-subtle text-success border border-success">거래완료</span></td>
            <td>
                <button type="button" class="btn btn-sm btn-outline-primary detail-btn">상세</button>
            </td>
        </tr>
        <tr class="collapse bg-light">
            <td colspan="5" class="p-3">
                <div class="text-start ms-4">
                    <p class="mb-1 small"><strong>최종 거래 확정일:</strong> 2026-03-16 14:20</p>
                    <p class="mb-0 small"><strong>배송 현황:</strong> 배송 완료</p>
                </div>
            </td>
        </tr>
        <tr>
        	<td class="text-center">9</td>
            <td class="text-start">
                <a href="${pageContext.request.contextPath}/product/detail.do?id=2" class="fw-bold text-decoration-none text-dark ps-3 link-primary">
                    해리포터 지팡이
                </a>
            </td>
            <td>-</td>
            <td class="small text-muted">2026-03-10</td>
            <td><span class="badge bg-danger-subtle text-danger border border-danger">유찰</span></td>
            <td>
                <button type="button" class="btn btn-sm btn-light border detail-btn">사유</button>
            </td>
        </tr>
        <tr class="collapse bg-light">
            <td colspan="5" class="p-3 text-start">
                <div class="ms-4 text-danger">
                    <p class="mb-1 small"><strong>유찰 사유:</strong> 결제 기한 만료 (미결제)</p>
                    <p class="mb-0 small"><strong>최종 유찰 일시:</strong> 2026-03-11</p>
                </div>
            </td>
        </tr>
        <tr>
        	<td class="text-center">8</td>
            <td class="text-start">
                <a href="${pageContext.request.contextPath}/product/detail.do?id=1" class="fw-bold text-decoration-none text-dark ps-3 link-primary">
                    도라에몽 피규어
                </a>
            </td>
            <td>120,000원</td>
            <td class="small text-muted">2026-03-15</td>
            <td><span class="badge bg-success-subtle text-success border border-success">거래완료</span></td>
            <td>
                <button type="button" class="btn btn-sm btn-outline-primary detail-btn">상세</button>
            </td>
        </tr>
        <tr class="collapse bg-light">
            <td colspan="5" class="p-3">
                <div class="text-start ms-4">
                    <p class="mb-1 small"><strong>최종 거래 확정일:</strong> 2026-03-16 14:20</p>
                    <p class="mb-0 small"><strong>배송 현황:</strong> 배송 완료</p>
                </div>
            </td>
        </tr>
        <tr>
        <td class="text-center">7</td>
            <td class="text-start"> 
                <a href="${pageContext.request.contextPath}/product/detail.do?id=2" class="fw-bold text-decoration-none text-dark ps-3 link-primary" >
                    해리포터 지팡이
                </a>
            </td>
            <td>-</td>
            <td class="small text-muted">2026-03-10</td>
            <td><span class="badge bg-danger-subtle text-danger border border-danger">유찰</span></td>
            <td>
                <button type="button" class="btn btn-sm btn-light border detail-btn">사유</button>
            </td>
        </tr>
        <tr class="collapse bg-light">
            <td colspan="5" class="p-3 text-start">
                <div class="ms-4 text-danger">
                    <p class="mb-1 small"><strong>유찰 사유:</strong> 결제 기한 만료 (미결제)</p>
                    <p class="mb-0 small"><strong>최종 유찰 일시:</strong> 2026-03-11</p>
                </div>
            </td>
        </tr>
        <tr>
        <td class="text-center">6</td>
            <td class="text-start">
                <a href="${pageContext.request.contextPath}/product/detail.do?id=1" class="fw-bold text-decoration-none text-dark ps-3 link-primary">
                    도라에몽 피규어
                </a>
            </td>
            <td>120,000원</td>
            <td class="small text-muted">2026-03-15</td>
            <td><span class="badge bg-success-subtle text-success border border-success">거래완료</span></td>
            <td>
                <button type="button" class="btn btn-sm btn-outline-primary detail-btn">상세</button>
            </td>
        </tr>
        <tr class="collapse bg-light">
            <td colspan="5" class="p-3">
                <div class="text-start ms-4">
                    <p class="mb-1 small"><strong>최종 거래 확정일:</strong> 2026-03-16 14:20</p>
                    <p class="mb-0 small"><strong>배송 현황:</strong> 배송 완료</p>
                </div>
            </td>
        </tr>
        <tr>
        <td class="text-center">5</td>
            <td class="text-start">
                <a href="${pageContext.request.contextPath}/product/detail.do?id=2" class="fw-bold text-decoration-none text-dark ps-3 link-primary">
                    해리포터 지팡이
                </a>
            </td>
            <td>-</td>
            <td class="small text-muted">2026-03-10</td>
            <td><span class="badge bg-danger-subtle text-danger border border-danger">유찰</span></td>
            <td>
                <button type="button" class="btn btn-sm btn-light border detail-btn">사유</button>
            </td>
        </tr>
        <tr class="collapse bg-light">
            <td colspan="5" class="p-3 text-start">
                <div class="ms-4 text-danger">
                    <p class="mb-1 small"><strong>유찰 사유:</strong> 결제 기한 만료 (미결제)</p>
                    <p class="mb-0 small"><strong>최종 유찰 일시:</strong> 2026-03-11</p>
                </div>
            </td>
        </tr>
        <tr>
        <td class="text-center">4</td>
            <td class="text-start">
                <a href="${pageContext.request.contextPath}/product/detail.do?id=1" class="fw-bold text-decoration-none text-dark ps-3 link-primary" >
                    도라에몽 피규어
                </a>
            </td>
            <td>120,000원</td>
            <td class="small text-muted">2026-03-15</td>
            <td><span class="badge bg-success-subtle text-success border border-success">거래완료</span></td>
            <td>
                <button type="button" class="btn btn-sm btn-outline-primary detail-btn">상세</button>
            </td>
        </tr>
        <tr class="collapse bg-light">
            <td colspan="5" class="p-3">
                <div class="text-start ms-4">
                    <p class="mb-1 small"><strong>최종 거래 확정일:</strong> 2026-03-16 14:20</p>
                    <p class="mb-0 small"><strong>배송 현황:</strong> 배송 완료</p>
                </div>
            </td>
        </tr>
        <tr>
        <td class="text-center">3</td>
            <td class="text-start">
                <a href="${pageContext.request.contextPath}/product/detail.do?id=2" class="fw-bold text-decoration-none text-dark ps-3 link-primary">
                    해리포터 지팡이
                </a>
            </td>
            <td>-</td>
            <td class="small text-muted">2026-03-10</td>
            <td><span class="badge bg-danger-subtle text-danger border border-danger">유찰</span></td>
            <td>
                <button type="button" class="btn btn-sm btn-light border detail-btn">사유</button>
            </td>
        </tr>
        <tr class="collapse bg-light">
            <td colspan="5" class="p-3 text-start">
                <div class="ms-4 text-danger">
                    <p class="mb-1 small"><strong>유찰 사유:</strong> 결제 기한 만료 (미결제)</p>
                    <p class="mb-0 small"><strong>최종 유찰 일시:</strong> 2026-03-11</p>
                </div>
            </td>
        </tr>
        <tr>
        <td class="text-center">2</td>
            <td class="text-start">
                <a href="${pageContext.request.contextPath}/product/detail.do?id=1" class="fw-bold text-decoration-none text-dark ps-3 link-primary">
                    도라에몽 피규어
                </a>
            </td>
            <td>120,000원</td>
            <td class="small text-muted">2026-03-15</td>
            <td><span class="badge bg-success-subtle text-success border border-success">거래완료</span></td>
            <td>
                <button type="button" class="btn btn-sm btn-outline-primary detail-btn">상세</button>
            </td>
        </tr>
        <tr class="collapse bg-light">
            <td colspan="5" class="p-3">
                <div class="text-start ms-4">
                    <p class="mb-1 small"><strong>최종 거래 확정일:</strong> 2026-03-16 14:20</p>
                    <p class="mb-0 small"><strong>배송 현황:</strong> 배송 완료</p>
                </div>
            </td>
        </tr>
        <tr>
        <td class="text-center">1</td>
            <td class="text-start">
                <a href="${pageContext.request.contextPath}/product/detail.do?id=2" class="fw-bold text-decoration-none text-dark ps-3 link-primary">
                    해리포터 지팡이
                </a>
            </td>
            <td>-</td>
            <td class="small text-muted">2026-03-10</td>
            <td><span class="badge bg-danger-subtle text-danger border border-danger">유찰</span></td>
            <td>
                <button type="button" class="btn btn-sm btn-light border detail-btn">사유</button>
            </td>
        </tr>
        <tr class="collapse bg-light">
            <td colspan="5" class="p-3 text-start">
                <div class="ms-4 text-danger">
                    <p class="mb-1 small"><strong>유찰 사유:</strong> 결제 기한 만료 (미결제)</p>
                    <p class="mb-0 small"><strong>최종 유찰 일시:</strong> 2026-03-11</p>
                </div>
            </td>
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
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script> -->
</body>
</html>