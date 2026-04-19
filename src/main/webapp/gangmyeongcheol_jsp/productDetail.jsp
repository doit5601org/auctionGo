<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background-color: #f0f7ff; }
    .navbar { background: white; border-bottom: 1px solid #e3f2fd; }
    .navbar-brand { color: #1565c0 !important; font-weight: 900; font-size: 20px; }
    .nav-link { color: #444 !important; font-size: 14px; font-weight: 500; }
    .nav-link:hover { color: #1565c0 !important; }
    .card { border: none; border-radius: 10px; box-shadow: 0 2px 8px rgba(21,101,192,0.08); }
    .section-title { font-size: 15px; font-weight: bold; color: #1565c0; border-left: 4px solid #1565c0; padding-left: 10px; margin-bottom: 14px; }
    .thumb-img { width: 64px; height: 64px; object-fit: cover; border-radius: 6px; border: 2px solid #e3f2fd; cursor: pointer; }
    .thumb-img:hover { border-color: #1565c0; }
    .info-label { color: #888; font-size: 13px; width: 110px; }
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">🎌 FigureAuction</a>
        <div class="d-flex gap-3 ms-4">
            <a href="main.jsp" class="nav-link">경매</a>
            <a href="productList.jsp" class="nav-link">컬렉션</a>
            <a href="productMyList.jsp" class="nav-link">내 상품</a>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5">

    <a href="productList.jsp" class="btn btn-outline-primary btn-sm mb-3">← 컬렉션 목록</a>

    <div class="row g-4">
        <div class="col-md-5">
            <div class="card p-3">
                <img id="mainImg" src="https://placehold.co/400x400/e3f2fd/1565c0?text=Miku+1%2F7"
                     class="img-fluid rounded mb-3" style="aspect-ratio:1; object-fit:cover; width:100%" alt="">
                <div class="d-flex gap-2 flex-wrap">
                    <img src="https://placehold.co/400x400/e3f2fd/1565c0?text=Miku+1%2F7" class="thumb-img"
                         onclick="document.getElementById('mainImg').src=this.src" alt="">
                    <img src="https://placehold.co/400x400/e3f2fd/1565c0?text=Side" class="thumb-img"
                         onclick="document.getElementById('mainImg').src=this.src" alt="">
                    <img src="https://placehold.co/400x400/e3f2fd/1565c0?text=Back" class="thumb-img"
                         onclick="document.getElementById('mainImg').src=this.src" alt="">
                </div>
            </div>
        </div>

        <div class="col-md-7">
            <div class="card p-4 h-100 d-flex flex-column">
                <h5 class="fw-bold mb-1">하츠네 미쿠 1/7 스케일 피규어</h5>
                <p class="text-muted small mb-3">Hatsune Miku 1/7 Scale Figure</p>

                <table class="table table-borderless table-sm mb-4">
                    <tr><td class="info-label">제조사</td><td class="fw-bold">굿스마일컴퍼니</td></tr>
                    <tr><td class="info-label">장르</td><td class="fw-bold">VOCALOID</td></tr>
                    <tr><td class="info-label">사이즈</td><td class="fw-bold">1/7 (전고 약 23cm)</td></tr>
                    <tr><td class="info-label">작품명</td><td class="fw-bold">VOCALOID</td></tr>
                    <tr><td class="info-label">캐릭터명</td><td class="fw-bold">하츠네 미쿠</td></tr>
                    <tr><td class="info-label">상태 등급</td><td><span class="badge" style="background-color:#e3f2fd;color:#1565c0">S급</span></td></tr>
                    <tr><td class="info-label">개봉 여부</td><td><span class="badge bg-success">미개봉</span></td></tr>
                    <tr><td class="info-label">파츠 누락</td><td class="fw-bold">없음</td></tr>
                    <tr><td class="info-label">구매일</td><td class="fw-bold">2025-12-01</td></tr>
                    <tr><td class="info-label">등록일</td><td class="fw-bold">2026-04-10</td></tr>
                </table>

                <%-- 본인 상품일 때 --%>
                <div class="d-flex gap-2 mt-auto">
                    <a href="productUpdate.jsp?productId=P001" class="btn btn-outline-secondary flex-fill">수정</a>
                    <a href="auctionRegister.jsp?productId=P001" class="btn btn-primary flex-fill">경매 등록</a>
                </div>
                <%-- 타인 상품일 때 (주석 해제)
                <div class="d-flex gap-2 mt-auto">
                    <button class="btn btn-outline-primary flex-fill">경매 요청</button>
                    <a href="productReport.jsp?productId=P001" class="btn btn-outline-danger flex-fill">신고</a>
                </div>
                --%>
            </div>
        </div>
    </div>

    <div class="card p-4 mt-4">
        <p class="section-title">상품 설명</p>
        <p class="text-secondary" style="white-space:pre-wrap; line-height:1.8">정품 굿스마일컴퍼니 하츠네 미쿠 1/7 스케일 피규어입니다.
미개봉 상태로 구입 후 보관만 하였습니다.
박스 상태 양호하며 파츠 누락 없습니다.
전고 약 23cm / 박스 크기 약 28 x 15 x 12cm</p>
    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
