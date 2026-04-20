<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매나라 - 개인 컬렉션 & 비크리 경매</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    /* 전체 레이아웃 Sticky Footer 설정 */
    body { display: flex; flex-direction: column; min-height: 100vh; }
    main { flex: 1; }

    /* 히어로 섹션: 윈도우 너비 전체 차지 */
    .hero-section {
        background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                    url('https://images.unsplash.com/photo-1550751827-4bd374c3f58b?auto=format&fit=crop&q=80&w=1920');
        background-size: cover;
        background-position: center;
        padding: 120px 0;
        color: white;
    }

    /* 카드 공통 호버 효과 */
    .custom-card {
        transition: all 0.3s cubic-bezier(.25,.8,.25,1);
        border: none !important;
        border-radius: 15px;
    }
    .custom-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(0,0,0,0.1) !important;
    }

    /* 찜하기 버튼 스타일 */
    .btn-wish {
        position: absolute;
        top: 15px;
        left: 15px;
        z-index: 10;
        background: rgba(255,255,255,0.8);
        border-radius: 50%;
        width: 38px;
        height: 38px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #ff4757;
        transition: 0.2s;
    }
    .btn-wish:hover { background: #ff4757; color: white; }

    .text-truncate-2 {
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }
</style>
</head>
<body class="bg-light">

<jsp:include page="header.jsp"></jsp:include>

<main>
    <section class="hero-section text-center mb-5">
        <div class="container">
            <h1 class="display-3 fw-bold mb-3">나만의 컬렉션, 특별한 경매</h1>
            <p class="lead mb-5 opacity-75">비크리(Vickrey) 방식으로 제안하는 합리적인 가치 공유 시스템</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="auctionList.do" class="btn btn-primary btn-lg px-5 py-3 rounded-pill fw-bold">경매 입장</a>
                <a href="productList.do" class="btn btn-outline-light btn-lg px-5 py-3 rounded-pill fw-bold">갤러리 구경</a>
            </div>
        </div>
    </section>

    <div class="container">
        <section class="mb-5">
            <div class="d-flex justify-content-between align-items-end mb-4">
                <div>
                    <h2 class="fw-bold m-0"><i class="bi bi-fire text-danger me-2"></i>마감 임박 경매</h2>
                    <p class="text-muted mb-0">현재 입찰 경쟁이 치열한 컬렉션입니다.</p>
                </div>
                <a href="auctionList.do" class="btn btn-outline-dark rounded-pill px-4">더보기</a>
            </div>
            
            <div class="row g-4">
                <c:forEach var="i" begin="1" end="3">
                <div class="col-md-4">
                    <div class="card h-100 shadow-sm custom-card position-relative overflow-hidden">
                        <div class="badge bg-danger position-absolute top-0 end-0 m-3 py-2 px-3 shadow-sm">00:15:32</div>
                        <img src="https://placehold.jp/24/444444/ffffff/400x320.png?text=Collection+Item+${i}" class="card-img-top" alt="경매상품">
                        
                        <div class="card-body">
                            <h5 class="fw-bold mb-3">레트로 리미티드 에디션 #${i}</h5>
                            <div class="bg-light p-3 rounded-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="small text-muted">현재 낙찰 예정가</span>
                                    <span class="fw-bold text-danger fs-5">155,000원</span>
                                </div>
                            </div>
                            <a href="auctionDetail.do?id=${i}" class="stretched-link"></a>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </section>

        <section class="mb-5 py-5 border-top">
            <div class="d-flex justify-content-between align-items-end mb-4">
                <div>
                    <h2 class="fw-bold m-0"><i class="bi bi-box2-heart text-primary me-2"></i>새로운 소장품</h2>
                    <p class="text-muted mb-0">판매 목적이 아닌 개인 전시물입니다. 즐겨찾기에 추가해보세요.</p>
                </div>
                <a href="productList.do" class="btn btn-outline-dark rounded-pill px-4">갤러리 전체보기</a>
            </div>

            <div class="row g-4">
                <c:forEach var="i" begin="1" end="3">
                <div class="col-md-4">
                    <div class="card h-100 shadow-sm custom-card">
                        <button class="btn btn-wish shadow-sm border-0" onclick="event.preventDefault(); alert('관심 상품으로 등록되었습니다!');">
                            <i class="bi bi-heart-fill"></i>
                        </button>
                        
                        <img src="https://placehold.jp/24/666666/ffffff/400x320.png?text=New+Gallery+${i}" class="card-img-top" alt="갤러리상품">
                        
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <span class="badge bg-secondary-subtle text-secondary px-2 py-1">Collector's Item</span>
                                <span class="text-muted small"><i class="bi bi-eye me-1"></i>124</span>
                            </div>
                            <h5 class="fw-bold">개인 소장용 피규어 시리즈 #${i}</h5>
                            <p class="text-muted small text-truncate-2">이 아이템은 개인 소장품으로 전시 목적으로 업로드되었습니다. 상세 정보를 통해 제작 비화를 확인하세요.</p>
                            <a href="productDetail.do?id=${i}" class="stretched-link"></a>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </section>
    </div>
</main>

<jsp:include page="footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

</head>
<body class="bg-light">
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
<section class="py-5 text-center bg-dark text-white mb-5">
        <div class="container py-lg-5">
            <h1 class="display-4 fw-bold">가장 합리적인 경매 경험</h1>
            <p class="lead mb-4">비크리(Vickrey) 방식으로 진행되는 투명한 경매 시스템을 만나보세요.</p>
            <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                <a href="auctionList.do" class="btn btn-primary btn-lg px-4 gap-3">경매 참여하기</a>
                <a href="productList.do" class="btn btn-outline-light btn-lg px-4">일반 구매</a>
            </div>
        </div>
    </section>
    <section class="mb-5">
        <div class="d-flex justify-content-between align-items-end mb-4">
            <div>
                <h3 class="fw-bold m-0">🔥 마감 임박 경매</h3>
                <p class="text-muted small mb-0">지금 놓치면 다시 오지 않을 기회!</p>
            </div>
            <a href="auctionList.do" class="btn btn-sm btn-outline-secondary">전체보기</a>
        </div>
        
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <div class="col">
                <div class="card h-100 border-0 shadow-sm position-relative overflow-hidden">
                    <div class="badge bg-danger position-absolute top-0 end-0 m-3 py-2 px-3 shadow" style="z-index: 1;">00:15:32</div>
                    <img src="https://placehold.jp/24/444444/ffffff/400x300.png?text=Auction+Item+1" class="card-img p-2 rounded-4" alt="경매상품1">
                    <div class="card-body pt-0">
                        <h5 class="card-title fw-bold text-truncate">레트로 한정판 게임기</h5>
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <div>
                                <span class="text-muted small d-block">현재 낙찰가</span>
                                <span class="text-danger fw-bold fs-5">155,000원</span>
                            </div>
                            <div class="text-end">
                                <span class="badge bg-light text-dark border fw-normal">입찰 12회</span>
                            </div>
                        </div>
                        <a href="auctionDetail.do?id=1" class="stretched-link"></a>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card h-100 border-0 shadow-sm position-relative overflow-hidden">
                    <div class="badge bg-danger position-absolute top-0 end-0 m-3 py-2 px-3 shadow" style="z-index: 1;">00:08:45</div>
                    <img src="https://placehold.jp/24/444444/ffffff/400x300.png?text=Auction+Item+2" class="card-img p-2 rounded-4" alt="경매상품2">
                    <div class="card-body pt-0">
                        <h5 class="card-title fw-bold text-truncate">아이언맨 마크 50 피규어</h5>
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <div>
                                <span class="text-muted small d-block">현재 낙찰가</span>
                                <span class="text-danger fw-bold fs-5">280,000원</span>
                            </div>
                            <div class="text-end">
                                <span class="badge bg-light text-dark border fw-normal">입찰 25회</span>
                            </div>
                        </div>
                        <a href="auctionDetail.do?id=2" class="stretched-link"></a>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card h-100 border-0 shadow-sm position-relative overflow-hidden">
                    <div class="badge bg-danger position-absolute top-0 end-0 m-3 py-2 px-3 shadow" style="z-index: 1;">01:22:10</div>
                    <img src="https://placehold.jp/24/444444/ffffff/400x300.png?text=Auction+Item+3" class="card-img p-2 rounded-4" alt="경매상품3">
                    <div class="card-body pt-0">
                        <h5 class="card-title fw-bold text-truncate">빈티지 필름 카메라</h5>
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <div>
                                <span class="text-muted small d-block">현재 낙찰가</span>
                                <span class="text-danger fw-bold fs-5">98,000원</span>
                            </div>
                            <div class="text-end">
                                <span class="badge bg-light text-dark border fw-normal">입찰 5회</span>
                            </div>
                        </div>
                        <a href="auctionDetail.do?id=3" class="stretched-link"></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="mb-5 py-5 border-top">
        <div class="d-flex justify-content-between align-items-end mb-4">
            <div>
                <h3 class="fw-bold m-0">✨ 신규 등록 상품</h3>
                <p class="text-muted small mb-0">방금 막 도착한 따끈따끈한 아이템</p>
            </div>
            <a href="productList.do" class="btn btn-sm btn-outline-secondary">전체보기</a>
        </div>

        <div class="row row-cols-1 row-cols-md-3 g-4">
            <div class="col">
                <div class="card h-100 border-0 shadow-sm hover-up">
                    <img src="https://placehold.jp/24/666666/ffffff/400x300.png?text=New+Product+1" class="card-img-top p-2 rounded-4" alt="일반상품1">
                    <div class="card-body">
                        <p class="text-muted small mb-1">삼성전자</p>
                        <h5 class="card-title fw-bold">갤럭시 버즈 3 프로</h5>
                        <p class="card-text fw-bold fs-5">249,000원</p>
                        <a href="productDetail.do?id=101" class="stretched-link"></a>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card h-100 border-0 shadow-sm hover-up">
                    <img src="https://placehold.jp/24/666666/ffffff/400x300.png?text=New+Product+2" class="card-img-top p-2 rounded-4" alt="일반상품2">
                    <div class="card-body">
                        <p class="text-muted small mb-1">애플</p>
                        <h5 class="card-title fw-bold">매직 키보드 화이트</h5>
                        <p class="card-text fw-bold fs-5">120,000원</p>
                        <a href="productDetail.do?id=102" class="stretched-link"></a>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card h-100 border-0 shadow-sm hover-up">
                    <img src="https://placehold.jp/24/666666/ffffff/400x300.png?text=New+Product+3" class="card-img-top p-2 rounded-4" alt="일반상품3">
                    <div class="card-body">
                        <p class="text-muted small mb-1">나이키</p>
                        <h5 class="card-title fw-bold">에어 포스 1 '07</h5>
                        <p class="card-text fw-bold fs-5">139,000원</p>
                        <a href="productDetail.do?id=103" class="stretched-link"></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<style>
/* 카드 호버 시 살짝 떠오르는 효과 */
.hover-up {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.hover-up:hover {
    transform: translateY(-8px);
    box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important;
}
/* 카드 내 텍스트 말줄임표 처리 */
.text-truncate {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
</style>
<jsp:include page="footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html> --%>