<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FigureMarket - 경매 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<style>
        body { background: #f8f9fa; }
        .navbar-brand { font-weight: 700; color: #4F46E5 !important; }
        .main-img { width: 100%; height: 360px; object-fit: cover; border-radius: 12px; }
        .thumb-img { width: 70px; height: 70px; object-fit: cover; border-radius: 8px; border: 2px solid transparent; cursor: pointer; }
        .thumb-img.active { border-color: #EF4444; }
        .info-card { background: #fff; border-radius: 12px; padding: 24px; box-shadow: 0 2px 8px rgba(0,0,0,.08); }
        .current-price { color: #EF4444; font-size: 1.6rem; font-weight: 700; }
        .notice-box { background: #FEF2F2; border: 1px solid #FCA5A5; border-radius: 8px; padding: 12px 16px; font-size: .85rem; color: #7F1D1D; }
        .countdown { font-size: 1.1rem; font-weight: 700; color: #4F46E5; font-variant-numeric: tabular-nums; }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
function changeImg(el) {
    document.getElementById('mainImg').src = el.src;
    document.querySelectorAll('.thumb-img').forEach(t => t.classList.remove('active'));
    el.classList.add('active');
}

// 카운트다운 타이머 (남은 시간은 Servlet에서 초 단위로 전달)
// 실제 연동 시: const totalSeconds = ${not empty auction ? auction.remainSeconds : 9251};
const totalSeconds = ${not empty auction ? auction.remainSeconds : 9251};
let remaining = totalSeconds;
const el = document.getElementById('countdown');

function updateTimer() {
    if (remaining <= 0) { el.textContent = '마감'; return; }
    const h = String(Math.floor(remaining / 3600)).padStart(2,'0');
    const m = String(Math.floor((remaining % 3600) / 60)).padStart(2,'0');
    const s = String(remaining % 60).padStart(2,'0');
    el.textContent = h + ':' + m + ':' + s;
    remaining--;
}
updateTimer();
setInterval(updateTimer, 1000);
</script>    
</head>
<body>

<%-- 네비게이션 바 --%>
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="main.jsp"><i class="bi bi-box-seam"></i> 쌍용피규어마켓</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto ms-3">
                <li class="nav-item"><a class="nav-link" href="productList.jsp">컬렉션</a></li>
                <li class="nav-item"><a class="nav-link fw-semibold text-primary" href="auctionList.jsp">경매</a></li>
                <li class="nav-item"><a class="nav-link" href="productMyList.jsp">내 상품</a></li>
            </ul>
        </div>
    </div>
</nav>

<%-- Servlet에서 request.setAttribute("auction", auctionVO) 전달 --%>
<div class="container py-4">
    <nav aria-label="breadcrumb" class="mb-3">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="main.jsp">홈</a></li>
            <li class="breadcrumb-item"><a href="auctionList.jsp">경매</a></li>
            <li class="breadcrumb-item active">${not empty auction ? auction.auctionTitle : '하츠네 미쿠 한정판 경매'}</li>
        </ol>
    </nav>

    <div class="row g-4">
        <%-- 이미지 영역 --%>
        <div class="col-md-6">
            <c:choose>
                <c:when test="${not empty auction}">
                    <img src="images/${auction.mainImage}" class="main-img" id="mainImg" alt="${auction.auctionTitle}">
                    <div class="d-flex gap-2 mt-2">
                        <img src="images/${auction.mainImage}" class="thumb-img active" onclick="changeImg(this)" alt="">
                        <c:forEach var="img" items="${auction.imageList}">
                            <img src="images/${img}" class="thumb-img" onclick="changeImg(this)" alt="">
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <img src="images/miku2.jpg" class="main-img" id="mainImg" alt="하츠네 미쿠 한정판">
                    <div class="d-flex gap-2 mt-2">
                        <img src="images/miku2.jpg" class="thumb-img active" onclick="changeImg(this)" alt="">
                        <img src="images/miku1.jpg" class="thumb-img" onclick="changeImg(this)" alt="">
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <%-- 경매 정보 --%>
        <div class="col-md-6">
            <div class="info-card">
                <div class="d-flex align-items-center gap-2 mb-2">
                    <span class="badge bg-danger">진행중</span>
                    <span class="text-muted" style="font-size:.85rem;">
                        마감 <span class="countdown" id="countdown">${not empty auction ? auction.remainTime : '02:34:11'}</span>
                    </span>
                </div>

                <h4 class="fw-bold">${not empty auction ? auction.auctionTitle : '하츠네 미쿠 한정판 경매'}</h4>
                <p class="text-muted mb-3" style="font-size:.9rem;">
                    시작가: <fmt:formatNumber value="${not empty auction ? auction.startPrice : 100000}" pattern="#,###"/>원 ·
                    입찰 단위: <fmt:formatNumber value="${not empty auction ? auction.bidUnit : 10000}" pattern="#,###"/>원
                </p>

                <p class="text-muted mb-1" style="font-size:.85rem;">현재가 (비크리 방식)</p>
                <p class="current-price mb-3">
                    <fmt:formatNumber value="${not empty auction ? auction.currentPrice : 210000}" pattern="#,###"/>원
                </p>

                <hr>

                <%-- 입찰 고지사항 --%>
                <div class="notice-box mb-3">
                    <p class="fw-semibold mb-1"><i class="bi bi-exclamation-circle-fill me-1"></i> 입찰 전 꼭 확인하세요</p>
                    <ul class="mb-0 ps-3" style="line-height: 1.8;">
                        <li>입찰 시 보증금 <strong>30,000원</strong>이 차감됩니다.</li>
                        <li>낙찰 후 <strong>24시간 이내</strong> 결제하지 않으면 보증금이 몰수됩니다.</li>
                        <li>경매 개시 후 취소는 불가합니다.</li>
                    </ul>
                </div>

                <%-- 동시 입찰 10개 초과 시 비활성화 — Servlet에서 bidCount 전달 --%>
                <c:choose>
                    <c:when test="${not empty sessionScope.loginUser}">
                        <c:choose>
                            <c:when test="${not empty bidCount and bidCount >= 10}">
                                <div class="alert alert-warning py-2 mb-2" style="font-size:.85rem;">
                                    <i class="bi bi-exclamation-triangle"></i> 동시 입찰 참여는 최대 10개입니다.
                                </div>
                                <button class="btn btn-secondary w-100" disabled>입찰 불가 (한도 초과)</button>
                            </c:when>
                            <c:otherwise>
                                <a href="/bid/form?auctionId=${not empty auction ? auction.auctionId : 1}" class="btn btn-danger w-100 btn-lg">
                                    <i class="bi bi-hammer"></i> 입찰 참여
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <a href="/user/login" class="btn btn-outline-danger w-100">로그인 후 입찰 가능</a>
                    </c:otherwise>
                </c:choose>

                <%-- 신고 버튼 --%>
                <div class="text-end mt-2">
                    <a href="auctionReport.jsp?auctionId=${not empty auction ? auction.auctionId : 1}"
                       class="btn btn-link btn-sm text-muted p-0">
                        <i class="bi bi-flag"></i> 신고하기
                    </a>
                </div>
            </div>
        </div>
    </div>

    <%-- 경매 설명 --%>
    <div class="bg-white rounded-3 p-4 mt-4 shadow-sm">
        <h6 class="fw-bold mb-3">경매 상품 설명</h6>
        <p style="font-size:.9rem; line-height: 1.8; color: #374151;">
            ${not empty auction ? auction.description : '굿스마일컴퍼니 하츠네 미쿠 1/7 스케일 한정판입니다. 미개봉 상태이며 박스 상태도 매우 좋습니다. 경매 종료 후 24시간 이내 결제 부탁드립니다.'}
        </p>
    </div>
</div>


</body>
</html>
