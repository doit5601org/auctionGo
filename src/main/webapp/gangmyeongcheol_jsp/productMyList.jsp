<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 상품 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background-color: #f0f7ff; }
    .navbar { background: white; border-bottom: 1px solid #e3f2fd; }
    .navbar-brand { color: #1565c0 !important; font-weight: 900; font-size: 20px; }
    .nav-link { color: #444 !important; font-size: 14px; font-weight: 500; }
    .nav-link:hover, .nav-link.active { color: #1565c0 !important; }
    .page-header { background-color: #1565c0; color: white; padding: 18px 24px; border-radius: 10px; margin-bottom: 24px; }
    .card { border: none; border-radius: 10px; box-shadow: 0 2px 8px rgba(21,101,192,0.08); }
    .product-row:hover { background-color: #f5f9ff; }
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">🎌 FigureAuction</a>
        <div class="d-flex gap-3 ms-4">
            <a href="main.jsp" class="nav-link">경매</a>
            <a href="productList.jsp" class="nav-link">컬렉션</a>
            <a href="productMyList.jsp" class="nav-link active">내 상품</a>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5">
    <div class="page-header d-flex justify-content-between align-items-center">
        <div>
            <h5 class="mb-0 fw-bold">내 상품 목록</h5>
            <p class="mb-0 small opacity-75 mt-1">등록한 상품을 확인하고 관리하세요.</p>
        </div>
        <a href="productRegister.jsp" class="btn btn-light btn-sm fw-bold">+ 새 상품 등록</a>
    </div>

    <div class="card">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-light">
                    <tr>
                        <th class="ps-4" style="width:50px">#</th>
                        <th>상품명</th>
                        <th class="text-center">등급</th>
                        <th class="text-center">개봉여부</th>
                        <th class="text-center">상태</th>
                        <th class="text-center">등록일</th>
                        <th class="text-center">관리</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="product-row">
                        <td class="ps-4 text-muted small">1</td>
                        <td>
                            <a href="productDetail.jsp?productId=P001" class="fw-bold text-dark text-decoration-none">
                                하츠네 미쿠 1/7 스케일 피규어
                            </a>
                            <div class="text-muted small">굿스마일컴퍼니 · VOCALOID</div>
                        </td>
                        <td class="text-center"><span class="badge" style="background:#e3f2fd;color:#1565c0">S급</span></td>
                        <td class="text-center"><span class="badge bg-success" style="font-size:11px">미개봉</span></td>
                        <td class="text-center"><span class="badge bg-secondary" style="font-size:11px">판매중</span></td>
                        <td class="text-center text-muted small">2026-04-10</td>
                        <td class="text-center">
                            <a href="productUpdate.jsp?productId=P001" class="btn btn-outline-secondary btn-sm">수정</a>
                            <a href="productDelete.jsp?productId=P001" class="btn btn-outline-danger btn-sm">삭제</a>
                        </td>
                    </tr>
                    <tr class="product-row">
                        <td class="ps-4 text-muted small">2</td>
                        <td>
                            <a href="productDetail.jsp?productId=P002" class="fw-bold text-dark text-decoration-none">
                                하츠네 미쿠 Racing Miku 2023
                            </a>
                            <div class="text-muted small">굿스마일컴퍼니 · VOCALOID</div>
                        </td>
                        <td class="text-center"><span class="badge" style="background:#e3f2fd;color:#1565c0">A급</span></td>
                        <td class="text-center"><span class="badge bg-warning text-dark" style="font-size:11px">개봉</span></td>
                        <td class="text-center"><span class="badge bg-secondary" style="font-size:11px">판매중</span></td>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
