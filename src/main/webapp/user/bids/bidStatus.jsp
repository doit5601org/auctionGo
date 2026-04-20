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
            <h5 class="mb-0 fw-bold">내 입찰 현황</h5>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table align-middle">
                    <thead class="table-light">
                        <tr class="text-center text-nowrap">
                            <th>상품명</th>
                            <th>현재가</th>
                            <th>나의 최고 입찰가</th>
                            <th>내 예상 순위</th>
                            <th>마감 기한</th>
                            <th>입찰 관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="fw-bold">아이언맨 피규어</div>
                                <div class="text-muted small">총 3회 입찰</div>
                            </td>
                            <td class="text-center fw-bold text-danger">155,000원</td>
                            <td class="text-center">150,000원</td>
                            <td class="text-center">
                                <span class="badge bg-danger">4순위</span>
                            </td>
                            <td class="text-center text-danger fw-bold">00:24:57</td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-primary">추가 입찰</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="fw-bold">아이언맨 피규어</div>
                                <div class="text-muted small">총 3회 입찰</div>
                            </td>
                            <td class="text-center fw-bold text-danger">155,000원</td>
                            <td class="text-center">150,000원</td>
                            <td class="text-center">
                                <span class="badge bg-danger">4순위</span>
                            </td>
                            <td class="text-center text-danger fw-bold">00:24:57</td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-primary">추가 입찰</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="fw-bold">아이언맨 피규어</div>
                                <div class="text-muted small">총 3회 입찰</div>
                            </td>
                            <td class="text-center fw-bold text-danger">155,000원</td>
                            <td class="text-center">150,000원</td>
                            <td class="text-center">
                                <span class="badge bg-danger">4순위</span>
                            </td>
                            <td class="text-center text-danger fw-bold">00:24:57</td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-primary">추가 입찰</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="fw-bold">아이언맨 피규어</div>
                                <div class="text-muted small">총 1회 입찰</div>
                            </td>
                            <td class="text-center fw-bold text-danger">155,000원</td>
                            <td class="text-center">160,000원</td>
                            <td class="text-center">
                                <span class="badge bg-success">1순위</span>
                            </td>
                            <td class="text-center text-danger fw-bold">00:24:57</td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-primary">추가 입찰</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="fw-bold">아이언맨 피규어</div>
                                <div class="text-muted small">총 3회 입찰</div>
                            </td>
                            <td class="text-center fw-bold text-danger">155,000원</td>
                            <td class="text-center">150,000원</td>
                            <td class="text-center">
                                <span class="badge bg-danger">4순위</span>
                            </td>
                            <td class="text-center text-danger fw-bold">00:24:57</td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-primary">추가 입찰</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="fw-bold">아이언맨 피규어</div>
                                <div class="text-muted small">총 1회 입찰</div>
                            </td>
                            <td class="text-center fw-bold text-danger">155,000원</td>
                            <td class="text-center">160,000원</td>
                            <td class="text-center">
                                <span class="badge bg-success">1순위</span>
                            </td>
                            <td class="text-center text-danger fw-bold">00:24:57</td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-primary">추가 입찰</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="fw-bold">아이언맨 피규어</div>
                                <div class="text-muted small">총 1회 입찰</div>
                            </td>
                            <td class="text-center fw-bold text-danger">155,000원</td>
                            <td class="text-center">160,000원</td>
                            <td class="text-center">
                                <span class="badge bg-success">1순위</span>
                            </td>
                            <td class="text-center text-danger fw-bold">00:24:57</td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-primary">추가 입찰</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="fw-bold">아이언맨 피규어</div>
                                <div class="text-muted small">총 1회 입찰</div>
                            </td>
                            <td class="text-center fw-bold text-danger">155,000원</td>
                            <td class="text-center">160,000원</td>
                            <td class="text-center">
                                <span class="badge bg-success">1순위</span>
                            </td>
                            <td class="text-center text-danger fw-bold">00:24:57</td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-primary">추가 입찰</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="fw-bold">아이언맨 피규어</div>
                                <div class="text-muted small">총 1회 입찰</div>
                            </td>
                            <td class="text-center fw-bold text-danger">155,000원</td>
                            <td class="text-center">160,000원</td>
                            <td class="text-center">
                                <span class="badge bg-success">1순위</span>
                            </td>
                            <td class="text-center text-danger fw-bold">00:24:57</td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-primary">추가 입찰</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="fw-bold">아이언맨 피규어</div>
                                <div class="text-muted small">총 1회 입찰</div>
                            </td>
                            <td class="text-center fw-bold text-danger">155,000원</td>
                            <td class="text-center">160,000원</td>
                            <td class="text-center">
                                <span class="badge bg-success">1순위</span>
                            </td>
                            <td class="text-center text-danger fw-bold">00:24:57</td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-primary">추가 입찰</button>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>