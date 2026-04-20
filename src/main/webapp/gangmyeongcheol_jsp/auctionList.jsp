<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .auction-card img { width: 100%; aspect-ratio: 1/1; object-fit: cover; }
</style>
</head>
<body>

<%-- 네비바 --%>
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">🎌 FigureAuction</a>
        <div class="d-flex gap-3 ms-4">
            <a href="auctionList.jsp" class="nav-link active">경매</a>
            <a href="productList.jsp" class="nav-link">컬렉션</a>
            <a href="productMyList.jsp" class="nav-link">내 상품</a>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5">

    <%-- 페이지 헤더 --%>
    <div class="page-header">
        <h5 class="mb-0 fw-bold">경매 목록</h5>
        <p class="mb-0 small opacity-75 mt-1">현재 진행 중인 경매에 참여해보세요.</p>
    </div>

    <%-- 필터 영역: 장르/사이즈/경매상태/키워드 조회 --%>
    <div class="filter-card">
        <form action="auctionList.jsp" method="get" class="row g-2 align-items-end">
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
                <label class="form-label small fw-bold text-secondary mb-1">경매 상태</label>
                <select name="statusId" class="form-select form-select-sm">
                    <option value="">전체</option>
                    <option value="1">진행중</option>
                    <option value="2">종료</option>
                </select>
            </div>
            <div class="col-md-4">
                <label class="form-label small fw-bold text-secondary mb-1">경매명 검색</label>
                <input type="text" name="keyword" class="form-control form-control-sm" placeholder="경매명을 입력하세요">
            </div>
            <div class="col-md-2 d-flex gap-1">
                <button type="submit" class="btn btn-primary btn-sm w-100">검색</button>
                <a href="auctionList.jsp" class="btn btn-outline-secondary btn-sm w-100">초기화</a>
            </div>
        </form>
    </div>

    <%-- 총 개수 및 정렬: 등록순/마감순/높은가격순 정렬 조회 기능 --%>
    <div class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-muted small">총 <strong class="text-dark">4</strong>개</span>
        <select class="form-select form-select-sm" style="width:90px" id="sortSelect" onchange="sortAuctions()">
            <option value="latest">등록순</option>
            <option value="deadline">마감순</option>
            <option value="price">높은가격</option>
        </select>
    </div>

    <%-- 경매 목록 --%>
    <div class="row row-cols-2 row-cols-md-4 g-3" id="auctionGrid">

        <%-- 임시 데이터 A001 --%>
        <div class="col" data-date="20260415" data-deadline="20260419" data-price="35000">
            <a href="auctionDetail.jsp?auctionId=A001" class="text-decoration-none text-dark">
                <div class="auction-card card h-100">
                    <img src="https://goodsmileshop.com/medias/sys_master/images/images/h43/h21/8830676697118.jpg"
                         alt="미쿠 1/7"
                         onerror="this.src='https://placehold.co/300x300/e3f2fd/1565c0?text=Miku+1%2F7'">
                    <div class="card-body p-3">
                        <div class="d-flex justify-content-between align-items-center mb-1">
                            <span class="badge bg-warning text-dark" style="font-size:11px">23:14:05</span>
                            <span class="badge bg-success" style="font-size:11px">진행중</span>
                        </div>
                        <p class="fw-bold small mb-1">하츠네 미쿠 1/7 스케일 피규어</p>
                        <p class="text-muted small mb-1">굿스마일컴퍼니 · S급</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="fw-bold text-primary small">35,000원</span>
                            <span class="text-muted" style="font-size:11px">입찰 3회</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <%-- 임시 데이터 A002 --%>
        <div class="col" data-date="20260416" data-deadline="20260421" data-price="28000">
            <a href="auctionDetail.jsp?auctionId=A002" class="text-decoration-none text-dark">
                <div class="auction-card card h-100">
                    <img src="https://goodsmileshop.com/medias/sys_master/images/images/hb5/h90/9570322350110.jpg"
                         alt="Racing Miku 2023"
                         onerror="this.src='https://placehold.co/300x300/fce4ec/c62828?text=Racing+Miku'">
                    <div class="card-body p-3">
                        <div class="d-flex justify-content-between align-items-center mb-1">
                            <span class="badge bg-warning text-dark" style="font-size:11px">47:30:12</span>
                            <span class="badge bg-success" style="font-size:11px">진행중</span>
                        </div>
                        <p class="fw-bold small mb-1">하츠네 미쿠 Racing Miku 2023</p>
                        <p class="text-muted small mb-1">굿스마일컴퍼니 · A급</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="fw-bold text-primary small">28,000원</span>
                            <span class="text-muted" style="font-size:11px">입찰 1회</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <%-- 임시 데이터 A003 --%>
        <div class="col" data-date="20260417" data-deadline="20260418" data-price="62000">
            <a href="auctionDetail.jsp?auctionId=A003" class="text-decoration-none text-dark">
                <div class="auction-card card h-100">
                    <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png"
                         alt="피카츄"
                         onerror="this.src='https://placehold.co/300x300/ffe066/e65100?text=Pikachu'">
                    <div class="card-body p-3">
                        <div class="d-flex justify-content-between align-items-center mb-1">
                            <span class="badge bg-danger" style="font-size:11px">01:22:44</span>
                            <span class="badge bg-success" style="font-size:11px">진행중</span>
                        </div>
                        <p class="fw-bold small mb-1">피카츄 1/7 스케일 피규어</p>
                        <p class="text-muted small mb-1">반다이 · S급</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="fw-bold text-primary small">62,000원</span>
                            <span class="text-muted" style="font-size:11px">입찰 7회</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <%-- 임시 데이터 A004 --%>
        <div class="col" data-date="20260418" data-deadline="20260422" data-price="18000">
            <a href="auctionDetail.jsp?auctionId=A004" class="text-decoration-none text-dark">
                <div class="auction-card card h-100">
                    <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png"
                         alt="파이리"
                         onerror="this.src='https://placehold.co/300x300/ffccbc/bf360c?text=Charmander'">
                    <div class="card-body p-3">
                        <div class="d-flex justify-content-between align-items-center mb-1">
                            <span class="badge bg-warning text-dark" style="font-size:11px">71:05:30</span>
                            <span class="badge bg-success" style="font-size:11px">진행중</span>
                        </div>
                        <p class="fw-bold small mb-1">파이리 넨도로이드 피규어</p>
                        <p class="text-muted small mb-1">반다이 · A급</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="fw-bold text-primary small">18,000원</span>
                            <span class="text-muted" style="font-size:11px">입찰 2회</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script>
// 정렬 기능: 등록순, 마감순(마감 임박), 높은가격순
function sortAuctions() {
    const sort = document.getElementById('sortSelect').value;
    const grid = document.getElementById('auctionGrid');
    const items = Array.from(grid.querySelectorAll('.col'));

    items.sort((a, b) => {
        if (sort === 'latest')   return b.dataset.date     - a.dataset.date;
        if (sort === 'deadline') return a.dataset.deadline - b.dataset.deadline;
        if (sort === 'price')    return b.dataset.price    - a.dataset.price;
    });

    items.forEach(item => grid.appendChild(item));
}
</script>
</body>
</html>
