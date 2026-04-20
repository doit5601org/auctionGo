<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FigureMarket - 내 상품 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; }
        .navbar-brand { font-weight: 700; color: #4F46E5 !important; }
        .product-row { background: #fff; border-radius: 12px; padding: 14px; box-shadow: 0 1px 4px rgba(0,0,0,.07); margin-bottom: 10px; }
        .product-row img { width: 72px; height: 72px; object-fit: cover; border-radius: 8px; }
        .sort-btn.active { background: #4F46E5; color: #fff; border-color: #4F46E5; }
    </style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>    
</head>
<body>

<%-- 세션 체크: 로그인 안 된 경우 로그인 페이지로 — 실제로는 Servlet에서 처리 --%>

<%-- 네비게이션 바 --%>
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="main.jsp"><i class="bi bi-box-seam"></i> 쌍용피규어마켓</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto ms-3">
                <li class="nav-item"><a class="nav-link" href="productList.jsp">컬렉션</a></li>
                <li class="nav-item"><a class="nav-link" href="auctionList.jsp">경매</a></li>
                <li class="nav-item"><a class="nav-link fw-semibold text-primary" href="productMyList.jsp">내 상품</a></li>
            </ul>
        </div>
    </div>
</nav>

<%-- Servlet에서 request.setAttribute("myProductList", list), request.setAttribute("totalCount", n) 전달 --%>
<div class="container py-4">
    <div class="d-flex align-items-center justify-content-between mb-3">
        <h5 class="fw-bold mb-0">내 상품 목록</h5>
        <a href="productRegister.jsp" class="btn btn-primary btn-sm">
            <i class="bi bi-plus-lg"></i> 상품 등록
        </a>
    </div>

    <%-- 정렬 버튼 --%>
    <div class="d-flex gap-2 mb-3">
        <a href="?sort=newest" class="btn btn-outline-secondary btn-sm sort-btn ${param.sort eq 'newest' or empty param.sort ? 'active' : ''}">등록순</a>
        <a href="?sort=popular" class="btn btn-outline-secondary btn-sm sort-btn ${param.sort eq 'popular' ? 'active' : ''}">인기순</a>
        <a href="?sort=grade" class="btn btn-outline-secondary btn-sm sort-btn ${param.sort eq 'grade' ? 'active' : ''}">등급순</a>
    </div>

    <p class="text-muted mb-3" style="font-size:.9rem;">총 <strong>${not empty totalCount ? totalCount : '4'}</strong>개 상품</p>

    <c:choose>
        <c:when test="${not empty myProductList}">
            <c:forEach var="p" items="${myProductList}">
                <div class="product-row d-flex align-items-center gap-3">
                    <img src="images/${p.imageFile}" alt="${p.productName}">
                    <div class="flex-grow-1">
                        <p class="fw-semibold mb-0">${p.productName}</p>
                        <p class="text-muted mb-0" style="font-size:.85rem;">${p.grade}등급 · ${p.sizeName} · 조회 ${p.viewCount}회</p>
                        <p class="fw-bold mb-0" style="color:#4F46E5; font-size:.9rem;">
                            <fmt:formatNumber value="${p.price}" pattern="#,###"/>원
                        </p>
                    </div>
                    <div class="d-flex flex-column gap-1">
                        <a href="productDetail.jsp?productId=${p.productId}" class="btn btn-outline-secondary btn-sm">상세</a>
                        <a href="productUpdate.jsp?productId=${p.productId}" class="btn btn-outline-primary btn-sm">수정</a>
                        <a href="productDelete.jsp?productId=${p.productId}" class="btn btn-outline-danger btn-sm">삭제</a>
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <%-- 더미 데이터 (Servlet 연동 전 UI 확인용) --%>
            <div class="product-row d-flex align-items-center gap-3">
                <img src="images/miku2.jpg" alt="하츠네 미쿠 1/7">
                <div class="flex-grow-1">
                    <p class="fw-semibold mb-0">하츠네 미쿠 1/7</p>
                    <p class="text-muted mb-0" style="font-size:.85rem;">S등급 · 1/7 · 조회 128회</p>
                    <p class="fw-bold mb-0" style="color:#4F46E5; font-size:.9rem;">180,000원</p>
                </div>
                <div class="d-flex flex-column gap-1">
                    <a href="productDetail.jsp?productId=1" class="btn btn-outline-secondary btn-sm">상세</a>
                    <a href="productUpdate.jsp?productId=1" class="btn btn-outline-primary btn-sm">수정</a>
                    <a href="productDelete.jsp?productId=1" class="btn btn-outline-danger btn-sm">삭제</a>
                </div>
            </div>
            <div class="product-row d-flex align-items-center gap-3">
                <img src="images/miku1.jpg" alt="미쿠 Racing ver.">
                <div class="flex-grow-1">
                    <p class="fw-semibold mb-0">미쿠 Racing ver.</p>
                    <p class="text-muted mb-0" style="font-size:.85rem;">A등급 · 1/7 · 조회 74회</p>
                    <p class="fw-bold mb-0" style="color:#4F46E5; font-size:.9rem;">95,000원</p>
                </div>
                <div class="d-flex flex-column gap-1">
                    <a href="productDetail.jsp?productId=2" class="btn btn-outline-secondary btn-sm">상세</a>
                    <a href="productUpdate.jsp?productId=2" class="btn btn-outline-primary btn-sm">수정</a>
                    <a href="productDelete.jsp?productId=2" class="btn btn-outline-danger btn-sm">삭제</a>
                </div>
            </div>
            <div class="product-row d-flex align-items-center gap-3">
                <img src="images/pikachu1.jpg" alt="피카츄 팝업 피규어">
                <div class="flex-grow-1">
                    <p class="fw-semibold mb-0">피카츄 팝업 피규어</p>
                    <p class="text-muted mb-0" style="font-size:.85rem;">B등급 · Nendoroid · 조회 45회</p>
                    <p class="fw-bold mb-0" style="color:#4F46E5; font-size:.9rem;">32,000원</p>
                </div>
                <div class="d-flex flex-column gap-1">
                    <a href="productDetail.jsp?productId=3" class="btn btn-outline-secondary btn-sm">상세</a>
                    <a href="productUpdate.jsp?productId=3" class="btn btn-outline-primary btn-sm">수정</a>
                    <a href="productDelete.jsp?productId=3" class="btn btn-outline-danger btn-sm">삭제</a>
                </div>
            </div>
            <div class="product-row d-flex align-items-center gap-3">
                <img src="images/charmander.jpg" alt="파이리 1/4 스케일">
                <div class="flex-grow-1">
                    <p class="fw-semibold mb-0">파이리 1/4 스케일</p>
                    <p class="text-muted mb-0" style="font-size:.85rem;">C등급 · 1/4 · 조회 22회</p>
                    <p class="fw-bold mb-0" style="color:#4F46E5; font-size:.9rem;">45,000원</p>
                </div>
                <div class="d-flex flex-column gap-1">
                    <a href="productDetail.jsp?productId=4" class="btn btn-outline-secondary btn-sm">상세</a>
                    <a href="productUpdate.jsp?productId=4" class="btn btn-outline-primary btn-sm">수정</a>
                    <a href="productDelete.jsp?productId=4" class="btn btn-outline-danger btn-sm">삭제</a>
                </div>
            </div>
        </c:otherwise>
    </c:choose>

    <%-- 상품 없을 때 --%>
    <c:if test="${not empty myProductList and empty myProductList}">
        <div class="text-center py-5 text-muted">
            <i class="bi bi-inbox" style="font-size:2.5rem;"></i>
            <p class="mt-2">등록된 상품이 없습니다.</p>
            <a href="productRegister.jsp" class="btn btn-primary btn-sm">첫 상품 등록하기</a>
        </div>
    </c:if>
</div>


</body>
</html>
