<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 상품 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<%-- 네비바 --%>
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">FigureAuction</a>
        <div class="d-flex gap-3 ms-4">
            <a href="auctionList.jsp" class="nav-link">경매</a>
            <a href="productList.jsp" class="nav-link">컬렉션</a>
            <a href="productMyList.jsp" class="nav-link active">내 상품</a>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5">
    <div class="page-header d-flex justify-content-between align-items-center mb-3">
        <div>
            <h5 class="mb-0 fw-bold">내 상품 목록</h5>
            <p class="mb-0 small opacity-75 mt-1">등록한 상품을 확인하고 관리하세요.</p>
        </div>
        <a href="productRegister.jsp" class="btn btn-primary btn-sm">+ 새 상품 등록</a>
    </div>

    <div class="card">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-light">
                    <tr>
                        <th class="ps-4">#</th>
                        <th>상품명</th>
                        <th class="text-center">등급</th>
                        <th class="text-center">개봉여부</th>
                        <th class="text-center">상태</th>
                        <th class="text-center">등록일</th>
                        <th class="text-center">관리</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- 임시 데이터 P001 --%>
                    <tr>
                        <td class="ps-4 text-muted small">1</td>
                        <td>
                            <a href="productDetail.jsp?productId=P001" class="fw-bold text-dark text-decoration-none">
                                하츠네 미쿠 1/7 스케일 피규어
                            </a>
                            <div class="text-muted small">굿스마일컴퍼니 · VOCALOID</div>
                        </td>
                        <td class="text-center"><span class="badge bg-secondary">S급</span></td>
                        <td class="text-center"><span class="badge bg-success">미개봉</span></td>
                        <td class="text-center"><span class="badge bg-secondary">판매중</span></td>
                        <td class="text-center text-muted small">2026-04-10</td>
                        <td class="text-center">
                            <a href="productUpdate.jsp?productId=P001" class="btn btn-outline-secondary btn-sm">수정</a>
                            <a href="productDelete.jsp?productId=P001" class="btn btn-outline-danger btn-sm">삭제</a>
                        </td>
                    </tr>
                    <%-- 임시 데이터 P002 --%>
                    <tr>
                        <td class="ps-4 text-muted small">2</td>
                        <td>
                            <a href="productDetail.jsp?productId=P002" class="fw-bold text-dark text-decoration-none">
                                하츠네 미쿠 Racing Miku 2023
                            </a>
                            <div class="text-muted small">굿스마일컴퍼니 · VOCALOID</div>
                        </td>
                        <td class="text-center"><span class="badge bg-secondary">A급</span></td>
                        <td class="text-center"><span class="badge bg-warning text-dark">개봉</span></td>
                        <td class="text-center"><span class="badge bg-secondary">판매중</span></td>
                        <td class="text-center text-muted small">2026-04-11</td>
                        <td class="text-center">
                            <a href="productUpdate.jsp?productId=P002" class="btn btn-outline-secondary btn-sm">수정</a>
                            <a href="productDelete.jsp?productId=P002" class="btn btn-outline-danger btn-sm">삭제</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
