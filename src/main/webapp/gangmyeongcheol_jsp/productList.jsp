<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컬렉션</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .product-card img { width: 100%; aspect-ratio: 1/1; object-fit: cover; }
</style>
</head>
<body>

<%-- 네비바 --%>
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">🎌 FigureAuction</a>
        <div class="d-flex gap-3 ms-4">
            <a href="auctionList.jsp" class="nav-link">경매</a>
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

    <%-- 필터 영역: 장르/사이즈/제조사/키워드 조회 --%>
    <div class="filter-card">
        <form action="productList.jsp" method="get" class="row g-2 align-items-end">
            <div class="col-md-2">
                <label class="form-label small fw-bold text-secondary mb-1">장르</label>
                <select name="genreId" class="form-select form-select-sm">
                    <option value="">전체</option>
                    <option value="1">VOCALOID</option>
                    <option value="2">애니메이션</option>
                    <option value="3">게임</option>
                </select>
            </div>
            <div class="col-md-2">
                <label class="form-label small fw-bold text-secondary mb-1">사이즈</label>
                <select name="sizeId" class="form-select form-select-sm">
                    <option value="">전체</option>
                    <option value="1">1/7</option>
                    <option value="2">1/8</option>
                    <option value="3">Nendoroid</option>
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

    <%-- 총 개수 및 정렬: 등록순/인기순/등급순 정렬 조회 기능 --%>
    <div class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-muted small">총 <strong class="text-dark">4</strong>개</span>
        <select class="form-select form-select-sm" style="width:90px" id="sortSelect" onchange="sortProducts()">
            <option value="latest">등록순</option>
            <option value="popular">인기순</option>
            <option value="grade">등급순</option>
        </select>
    </div>

    <%-- 상품 목록 --%>
    <div class="row row-cols-2 row-cols-md-4 g-3" id="productGrid">

        <%-- 임시 데이터 P001 --%>
        <div class="col" data-date="20260410" data-views="120" data-grade="1">
            <a href="productDetail.jsp?productId=P001" class="text-decoration-none text-dark">
                <div class="product-card card h-100">
                    <img src="https://goodsmileshop.com/medias/sys_master/images/images/h43/h21/8830676697118.jpg"
                         alt="하츠네 미쿠 1/7"
                         onerror="this.src='https://placehold.co/300x300/e3f2fd/1565c0?text=Miku+1%2F7'">
                    <div class="card-body p-3">
                        <p class="fw-bold small mb-1">하츠네 미쿠 1/7 스케일 피규어</p>
                        <p class="text-muted small mb-1">굿스마일컴퍼니 · VOCALOID</p>
                        <span class="badge bg-secondary">S급</span>
                    </div>
                </div>
            </a>
        </div>

        <%-- 임시 데이터 P002 --%>
        <div class="col" data-date="20260411" data-views="85" data-grade="2">
            <a href="productDetail.jsp?productId=P002" class="text-decoration-none text-dark">
                <div class="product-card card h-100">
                    <img src="https://goodsmileshop.com/medias/sys_master/images/images/hb5/h90/9570322350110.jpg"
                         alt="Racing Miku 2023"
                         onerror="this.src='https://placehold.co/300x300/fce4ec/c62828?text=Racing+Miku'">
                    <div class="card-body p-3">
                        <p class="fw-bold small mb-1">하츠네 미쿠 Racing Miku 2023</p>
                        <p class="text-muted small mb-1">굿스마일컴퍼니 · VOCALOID</p>
                        <span class="badge bg-secondary">A급</span>
                    </div>
                </div>
            </a>
        </div>

        <%-- 임시 데이터 P003 --%>
        <div class="col" data-date="20260412" data-views="210" data-grade="1">
            <a href="productDetail.jsp?productId=P003" class="text-decoration-none text-dark">
                <div class="product-card card h-100">
                    <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png"
                         alt="피카츄"
                         onerror="this.src='https://placehold.co/300x300/ffe066/e65100?text=Pikachu'">
                    <div class="card-body p-3">
                        <p class="fw-bold small mb-1">피카츄 1/7 스케일 피규어</p>
                        <p class="text-muted small mb-1">반다이 · 게임</p>
                        <span class="badge bg-secondary">S급</span>
                    </div>
                </div>
            </a>
        </div>

        <%-- 임시 데이터 P004 --%>
        <div class="col" data-date="20260413" data-views="150" data-grade="2">
            <a href="productDetail.jsp?productId=P004" class="text-decoration-none text-dark">
                <div class="product-card card h-100">
                    <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png"
                         alt="파이리"
                         onerror="this.src='https://placehold.co/300x300/ffccbc/bf360c?text=Charmander'">
                    <div class="card-body p-3">
                        <p class="fw-bold small mb-1">파이리 넨도로이드 피규어</p>
                        <p class="text-muted small mb-1">반다이 · 게임</p>
                        <span class="badge bg-secondary">A급</span>
                    </div>
                </div>
            </a>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script>
// 정렬 기능: 등록순, 인기순(조회수), 등급순
function sortProducts() {
    const sort = document.getElementById('sortSelect').value;
    const grid = document.getElementById('productGrid');
    const items = Array.from(grid.querySelectorAll('.col'));
    items.sort((a, b) => {
        if (sort === 'latest')  return b.dataset.date  - a.dataset.date;
        if (sort === 'popular') return b.dataset.views - a.dataset.views;
        if (sort === 'grade')   return a.dataset.grade - b.dataset.grade;
    });
    items.forEach(item => grid.appendChild(item));
}
</script>
</body>
</html>
