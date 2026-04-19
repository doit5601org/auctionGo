<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컬렉션</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background-color: #f0f7ff; }
    .navbar { background: white; border-bottom: 1px solid #e3f2fd; }
    .navbar-brand { color: #1565c0 !important; font-weight: 900; font-size: 20px; }
    .nav-link { color: #444 !important; font-size: 14px; font-weight: 500; }
    .nav-link:hover, .nav-link.active { color: #1565c0 !important; }
    .page-header { background-color: #1565c0; color: white; padding: 18px 24px; border-radius: 10px; margin-bottom: 24px; }
    .filter-card { background: white; border-radius: 10px; padding: 16px 20px; box-shadow: 0 2px 8px rgba(21,101,192,0.08); margin-bottom: 20px; }
    .product-card { border: none; border-radius: 12px; box-shadow: 0 2px 8px rgba(21,101,192,0.07); transition: transform 0.15s; cursor: pointer; background: white; }
    .product-card:hover { transform: translateY(-4px); box-shadow: 0 6px 16px rgba(21,101,192,0.13); }
    .product-card img { aspect-ratio: 1; object-fit: cover; border-radius: 12px 12px 0 0; width: 100%; }
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">🎌 FigureAuction</a>
        <div class="d-flex gap-3 ms-4">
            <a href="main.jsp" class="nav-link">경매</a>
            <a href="productList.jsp" class="nav-link active">컬렉션</a>
            <a href="productMyList.jsp" class="nav-link">내 상품</a>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5">
    <div class="page-header">
        <h5 class="mb-0 fw-bold">컬렉션</h5>
        <p class="mb-0 small opacity-75 mt-1">유저들의 피규어 컬렉션을 구경해보세요.</p>
    </div>

    <div class="filter-card">
        <form action="productList.jsp" method="get" class="row g-2 align-items-end">
            <div class="col-md-2">
                <label class="form-label small fw-bold text-secondary mb-1">장르</label>
                <select name="genreId" class="form-select form-select-sm">
                    <option value="">전체</option>
                    <option value="1">VOCALOID</option>
                    <option value="2">애니메이션</option>
                </select>
            </div>
            <div class="col-md-2">
                <label class="form-label small fw-bold text-secondary mb-1">사이즈</label>
                <select name="sizeId" class="form-select form-select-sm">
                    <option value="">전체</option>
                    <option value="1">1/7</option>
                    <option value="2">1/8</option>
                </select>
            </div>
            <div class="col-md-2">
                <label class="form-label small fw-bold text-secondary mb-1">제조사</label>
                <select name="manufacturerId" class="form-select form-select-sm">
                    <option value="">전체</option>
                    <option value="1">굿스마일컴퍼니</option>
                    <option value="2">반다이</option>
                </select>
            </div>
            <div class="col-md-4">
                <label class="form-label small fw-bold text-secondary mb-1">상품명 검색</label>
                <input type="text" name="keyword" class="form-control form-control-sm" placeholder="상품명을 입력하세요">
            </div>
            <div class="col-md-2 d-flex gap-1">
                <button type="submit" class="btn btn-primary btn-sm w-100">검색</button>
                <a href="productList.jsp" class="btn btn-outline-secondary btn-sm w-100">초기화</a>
            </div>
        </form>
    </div>

    <div class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-muted small">총 <strong class="text-dark">2</strong>개</span>
        <select class="form-select form-select-sm" style="width:110px">
            <option>최신순</option>
            <option>등급순</option>
        </select>
    </div>

    <div class="row row-cols-2 row-cols-md-4 g-3">
        <div class="col">
            <div class="product-card card h-100" onclick="location.href='productDetail.jsp?productId=P001'">
                <img src="https://placehold.co/300x300/e3f2fd/1565c0?text=Miku+1%2F7" alt="">
                <div class="card-body p-3">
                    <p class="fw-bold small mb-1">하츠네 미쿠 1/7 스케일 피규어</p>
                    <p class="text-muted mb-1" style="font-size:12px">굿스마일컴퍼니 · VOCALOID</p>
                    <span class="badge" style="background:#e3f2fd;color:#1565c0;font-size:11px">S급</span>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="product-card card h-100" onclick="location.href='productDetail.jsp?productId=P002'">
                <img src="https://placehold.co/300x300/fce4ec/c62828?text=Racing+Miku" alt="">
                <div class="card-body p-3">
                    <p class="fw-bold small mb-1">하츠네 미쿠 Racing Miku 2023</p>
                    <p class="text-muted mb-1" style="font-size:12px">굿스마일컴퍼니 · VOCALOID</p>
                    <span class="badge" style="background:#e3f2fd;color:#1565c0;font-size:11px">A급</span>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
