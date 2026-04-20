<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FigureAuction</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<%-- 네비바 --%>
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">FigureAuction</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navMenu">
            <ul class="navbar-nav me-auto ms-4 gap-1">
                <li class="nav-item"><a class="nav-link active" href="auctionList.jsp">경매</a></li>
                <li class="nav-item"><a class="nav-link" href="productList.jsp">컬렉션</a></li>
                <li class="nav-item"><a class="nav-link" href="productMyList.jsp">내 상품</a></li>
            </ul>
            <div class="d-flex gap-2">
                <a href="#" class="btn btn-outline-primary btn-sm">로그인</a>
                <a href="#" class="btn btn-primary btn-sm">회원가입</a>
            </div>
        </div>
    </div>
</nav>

<%-- 히어로 배너 --%>
<section class="hero">
    <div class="container">
        <h1 class="mb-2">내 컬렉션을 전시하고<br>경매로 연결하세요</h1>
        <p class="mb-4 opacity-75">피규어를 보관·전시하고, 원하는 피규어의 경매를 요청해보세요.</p>
        <div class="input-group hero-search mb-4">
            <input type="text" class="form-control" placeholder="원하는 피규어를 검색해보세요">
            <button class="btn btn-dark">검색</button>
        </div>
        <div class="d-flex flex-wrap gap-2">
            <a href="auctionList.jsp" class="tag-chip"># VOCALOID</a>
            <a href="auctionList.jsp" class="tag-chip"># 원피스</a>
            <a href="auctionList.jsp" class="tag-chip"># 귀멸의칼날</a>
            <a href="auctionList.jsp" class="tag-chip"># 굿스마일</a>
            <a href="auctionList.jsp" class="tag-chip"># 미개봉</a>
        </div>
    </div>
</section>

<%-- 진행중인 경매 목록 --%>
<section class="container mt-5">
    <div class="section-header d-flex justify-content-between align-items-center mb-3">
        <h6 class="fw-bold mb-0">지금 진행중인 경매</h6>
        <a href="auctionList.jsp" class="text-decoration-none small">전체보기 →</a>
    </div>
    <div class="row row-cols-2 row-cols-md-4 g-3">

        <%-- 임시 데이터 A001 --%>
        <div class="col">
            <a href="auctionDetail.jsp?auctionId=A001" class="text-decoration-none text-dark">
                <div class="auction-card card h-100">
                    <img src="${pageContext.request.contextPath}/images/miku1.jpg"
                         class="w-100" alt="미쿠 1/7"
                         onerror="this.src='https://placehold.co/300x300/e3f2fd/1565c0?text=Miku+1%2F7'">
                    <div class="p-3">
                        <div class="d-flex justify-content-between align-items-center mb-1">
                            <span class="badge bg-warning text-dark">23:14:05</span>
                            <span class="badge bg-secondary">S급</span>
                        </div>
                        <p class="fw-bold small mb-1">하츠네 미쿠 1/7 스케일 피규어</p>
                        <p class="text-muted small mb-1">굿스마일컴퍼니</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="fw-bold text-primary">35,000원</span>
                            <span class="text-muted small">입찰 3회</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <%-- 임시 데이터 A002 --%>
        <div class="col">
            <a href="auctionDetail.jsp?auctionId=A002" class="text-decoration-none text-dark">
                <div class="auction-card card h-100">
                    <img src="${pageContext.request.contextPath}/images/miku2.jpg"
                         class="w-100" alt="Racing Miku 2023"
                         onerror="this.src='https://placehold.co/300x300/fce4ec/c62828?text=Racing+Miku'">
                    <div class="p-3">
                        <div class="d-flex justify-content-between align-items-center mb-1">
                            <span class="badge bg-warning text-dark">47:30:12</span>
                            <span class="badge bg-secondary">A급</span>
                        </div>
                        <p class="fw-bold small mb-1">하츠네 미쿠 Racing Miku 2023</p>
                        <p class="text-muted small mb-1">굿스마일컴퍼니</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="fw-bold text-primary">28,000원</span>
                            <span class="text-muted small">입찰 1회</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <%-- 임시 데이터 A003 --%>
        <div class="col">
            <a href="auctionDetail.jsp?auctionId=A003" class="text-decoration-none text-dark">
                <div class="auction-card card h-100">
                    <img src="${pageContext.request.contextPath}/images/pikachu1.jpg"
                         class="w-100" alt="피카츄"
                         onerror="this.src='https://placehold.co/300x300/ffe066/e65100?text=Pikachu'">
                    <div class="p-3">
                        <div class="d-flex justify-content-between align-items-center mb-1">
                            <span class="badge bg-danger">01:22:44</span>
                            <span class="badge bg-secondary">S급</span>
                        </div>
                        <p class="fw-bold small mb-1">피카츄 1/7 스케일 피규어</p>
                        <p class="text-muted small mb-1">반다이</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="fw-bold text-primary">62,000원</span>
                            <span class="text-muted small">입찰 7회</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <%-- 임시 데이터 A004 --%>
        <div class="col">
            <a href="auctionDetail.jsp?auctionId=A004" class="text-decoration-none text-dark">
                <div class="auction-card card h-100">
                    <img src="${pageContext.request.contextPath}/images/charmander.jpg"
                         class="w-100" alt="파이리"
                         onerror="this.src='https://placehold.co/300x300/ffccbc/bf360c?text=Charmander'">
                    <div class="p-3">
                        <div class="d-flex justify-content-between align-items-center mb-1">
                            <span class="badge bg-warning text-dark">71:05:30</span>
                            <span class="badge bg-secondary">A급</span>
                        </div>
                        <p class="fw-bold small mb-1">파이리 넨도로이드 피규어</p>
                        <p class="text-muted small mb-1">반다이</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="fw-bold text-primary">18,000원</span>
                            <span class="text-muted small">입찰 2회</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>

    </div>
</section>

<%-- 경매 요청 안내 배너 --%>
<section class="container mt-5">
    <div class="sub-banner d-flex justify-content-between align-items-center flex-wrap gap-3">
        <div>
            <h6 class="fw-bold mb-1">갖고 싶은 피규어가 있나요?</h6>
            <p class="mb-0 text-muted small">다른 유저의 컬렉션에서 원하는 피규어를 발견했다면 경매 요청을 보내보세요.</p>
        </div>
        <a href="productList.jsp" class="btn btn-primary btn-sm px-4">컬렉션 둘러보기 →</a>
    </div>
</section>

<%-- 유저 컬렉션 --%>
<section class="container mt-5 mb-5">
    <div class="section-header d-flex justify-content-between align-items-center mb-3">
        <h6 class="fw-bold mb-0">유저 컬렉션 구경하기</h6>
        <a href="productList.jsp" class="text-decoration-none small">전체보기 →</a>
    </div>
    <div class="row row-cols-2 row-cols-md-4 g-3">

        <div class="col">
            <a href="productDetail.jsp?productId=P001" class="text-decoration-none text-dark">
                <div class="collection-card card h-100">
                    <img src="${pageContext.request.contextPath}/images/miku1.jpg"
                         class="w-100" alt=""
                         onerror="this.src='https://placehold.co/300x300/e3f2fd/1565c0?text=Miku'">
                    <div class="p-3">
                        <p class="fw-bold small mb-1">하츠네 미쿠 1/7 스케일 피규어</p>
                        <p class="text-muted small mb-2">굿스마일컴퍼니 · S급 · 미개봉</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="small text-muted">miku_fan</span>
                            <button class="btn btn-outline-primary btn-sm" style="font-size:11px">경매 요청</button>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col">
            <a href="productDetail.jsp?productId=P002" class="text-decoration-none text-dark">
                <div class="collection-card card h-100">
                    <img src="${pageContext.request.contextPath}/images/miku2.jpg"
                         class="w-100" alt=""
                         onerror="this.src='https://placehold.co/300x300/fce4ec/c62828?text=Racing+Miku'">
                    <div class="p-3">
                        <p class="fw-bold small mb-1">하츠네 미쿠 Racing Miku 2023</p>
                        <p class="text-muted small mb-2">굿스마일컴퍼니 · A급 · 개봉</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="small text-muted">racing_col</span>
                            <button class="btn btn-outline-primary btn-sm" style="font-size:11px">경매 요청</button>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col">
            <a href="productDetail.jsp?productId=P003" class="text-decoration-none text-dark">
                <div class="collection-card card h-100">
                    <img src="${pageContext.request.contextPath}/images/pikachu1.jpg"
                         class="w-100" alt=""
                         onerror="this.src='https://placehold.co/300x300/ffe066/e65100?text=Pikachu'">
                    <div class="p-3">
                        <p class="fw-bold small mb-1">피카츄 1/7 스케일 피규어</p>
                        <p class="text-muted small mb-2">반다이 · S급 · 미개봉</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="small text-muted">poke_fan</span>
                            <button class="btn btn-outline-primary btn-sm" style="font-size:11px">경매 요청</button>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col">
            <a href="productDetail.jsp?productId=P004" class="text-decoration-none text-dark">
                <div class="collection-card card h-100">
                    <img src="${pageContext.request.contextPath}/images/charmander.jpg"
                         class="w-100" alt=""
                         onerror="this.src='https://placehold.co/300x300/ffccbc/bf360c?text=Charmander'">
                    <div class="p-3">
                        <p class="fw-bold small mb-1">파이리 넨도로이드 피규어</p>
                        <p class="text-muted small mb-2">반다이 · A급 · 개봉</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="small text-muted">nendo_shop</span>
                            <button class="btn btn-outline-primary btn-sm" style="font-size:11px">경매 요청</button>
                        </div>
                    </div>
                </div>
            </a>
        </div>

    </div>
</section>

</body>
</html>
