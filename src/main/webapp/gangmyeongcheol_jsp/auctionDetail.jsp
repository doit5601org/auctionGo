<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쌍용피규어마켓 - 경매 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<style>
        .main-img { width: 100%; height: 360px; object-fit: cover; border-radius: 8px; }
        .thumb-img { width: 70px; height: 70px; object-fit: cover; border-radius: 6px; border: 2px solid transparent; cursor: pointer; }
        .thumb-img.active { border-color: #dc3545; }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
// 썸네일 클릭 시 메인 이미지 변경
function changeImg(el) {
    document.getElementById('mainImg').src = el.src;
    document.querySelectorAll('.thumb-img').forEach(function(t) { t.classList.remove('active'); });
    el.classList.add('active');
}
</script>    
</head>
<body class="bg-light">

<%-- 네비게이션 바 --%>
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm">
    <div class="container">             //${ctx}/main
        <a class="navbar-brand fw-bold" href="main.jsp">쌍용피규어마켓</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto ms-3">               //${ctx}/product/list
                <li class="nav-item"><a class="nav-link" href="productList.jsp">컬렉션</a></li>
                                                                           //${ctx}/auction/list
                <li class="nav-item"><a class="nav-link fw-semibold" href="auctionList.jsp">경매</a></li>
                                                               //${ctx}/product/myList
                <li class="nav-item"><a class="nav-link" href="productMyList.jsp">내 상품</a></li>
            </ul>
        </div>
    </div>
</nav>

<%-- Servlet에서 request.setAttribute("auction", auctionVO) 전달 --%>
<div class="container py-4">
    <%-- 경로 표시 --%>
    <nav aria-label="breadcrumb" class="mb-3">
        <ol class="breadcrumb">
                                                //${ctx}/main
            <li class="breadcrumb-item"><a href="main.jsp">홈</a></li>
                                                //${ctx}/auction/list
            <li class="breadcrumb-item"><a href="auctionList.jsp">경매</a></li>
                                                
            <li class="breadcrumb-item active">${auction.auctionTitle}</li>
        </ol>
    </nav>

    <div class="row g-4">
        <%-- 이미지 영역 --%>
        <div class="col-md-6">
            <img src="${ctx}/images/${auction.mainImage}" class="main-img" id="mainImg" alt="${auction.auctionTitle}">
            <div class="d-flex gap-2 mt-2">
                <img src="${ctx}/images/${auction.mainImage}" class="thumb-img active" onclick="changeImg(this)" alt="">
                <c:forEach var="img" items="${auction.imageList}">
                    <img src="${ctx}/images/${img}" class="thumb-img" onclick="changeImg(this)" alt="">
                </c:forEach>
            </div>
        </div>

        <%-- 경매 정보 --%>
        <div class="col-md-6">
            <div class="bg-white rounded-3 p-4 shadow-sm">
                <div class="d-flex align-items-center gap-2 mb-2">
                    <span class="badge bg-danger">진행중</span>
                    <span class="text-muted small">
                        마감까지 <span class="fw-bold text-primary" id="countdown"></span>
                    </span>
                </div>

                <h4 class="fw-bold">${auction.auctionTitle}</h4>
                <p class="text-muted mb-3 small">
                    시작가: <fmt:formatNumber value="${auction.startPrice}" pattern="#,###"/>원 ·
                    입찰 단위: <fmt:formatNumber value="${auction.bidUnit}" pattern="#,###"/>원
                </p>

                <p class="text-muted mb-1 small">현재가</p>
                <h3 class="fw-bold text-danger mb-3">
                    <fmt:formatNumber value="${auction.currentPrice}" pattern="#,###"/>원
                </h3>

                <hr>

                <%-- 입찰 전 고지사항 --%>
                <div class="alert alert-warning py-2 mb-3 small">
                    <p class="fw-semibold mb-1"><i class="bi bi-exclamation-circle-fill me-1"></i> 입찰 전 꼭 확인하세요</p>
                    <ul class="mb-0 ps-3">
                        <li>입찰 시 보증금 <strong>30,000원</strong>이 차감됩니다.</li>
                        <li>낙찰 후 <strong>24시간 이내</strong> 결제하지 않으면 보증금이 몰수됩니다.</li>
                        <li>경매 개시 후 취소는 불가합니다.</li>
                    </ul>
                </div>

                <%-- 로그인 여부 및 동시 입찰 한도 체크 (Servlet에서 bidCount 전달) --%>
                <c:choose>
                    <c:when test="${not empty sessionScope.loginUser}">
                        <c:choose>
                            <c:when test="${bidCount >= 10}">
                                <div class="alert alert-warning py-2 mb-2 small">
                                    <i class="bi bi-exclamation-triangle"></i> 동시 입찰은 최대 10개까지 가능합니다.
                                </div>
                                <button class="btn btn-secondary w-100" disabled>입찰 불가 (한도 초과)</button>
                            </c:when>
                            <c:otherwise>
                                <a href="${ctx}/bid/form?auctionId=${auction.auctionId}" class="btn btn-danger w-100 btn-lg">
                                    <i class="bi bi-hammer"></i> 입찰 참여
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <a href="${ctx}/user/login" class="btn btn-outline-danger w-100">로그인 후 입찰 가능</a>
                    </c:otherwise>
                </c:choose>

                <%-- 신고 버튼 --%>
                <div class="text-end mt-2">
                    <a href="${ctx}/auction/report?auctionId=${auction.auctionId}" class="btn btn-link btn-sm text-muted p-0 small">
                        <i class="bi bi-flag"></i> 신고하기
                    </a>
                </div>
            </div>
        </div>
    </div>

    <%-- 경매 설명 --%>
    <div class="bg-white rounded-3 p-4 mt-4 shadow-sm">
        <h6 class="fw-bold mb-3">경매 상품 설명</h6>
        <p class="small" style="line-height: 1.8;">${auction.description}</p>
    </div>
</div>


</body>
</html>
