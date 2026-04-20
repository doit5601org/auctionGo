<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FigureMarket - 메인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; }
        .navbar-brand { font-weight: 700; font-size: 1.3rem; color: #4F46E5 !important; }
        .hero { background: linear-gradient(135deg, #4F46E5 0%, #7C3AED 100%); color: #fff; padding: 60px 0; }
        .section-title { font-weight: 700; font-size: 1.2rem; margin-bottom: 1rem; }
        .product-card { border: none; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,.08); transition: transform .2s; cursor: pointer; }
        .product-card:hover { transform: translateY(-4px); }
        .product-card img { height: 180px; object-fit: cover; border-radius: 12px 12px 0 0; }
        .badge-grade { font-size: .7rem; }
    </style>
    
</head>
<body>

<%-- 네비게이션 바 --%>
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="main.jsp"><i class="bi bi-box-seam"></i> 쌍용피규어마켓</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navMenu">
            <ul class="navbar-nav me-auto ms-3">
                <li class="nav-item"><a class="nav-link" href="productList.jsp">컬렉션</a></li>
                <li class="nav-item"><a class="nav-link" href="auctionList.jsp">경매</a></li>
                <li class="nav-item"><a class="nav-link" href="productMyList.jsp">내 상품</a></li>
            </ul>
            <div class="d-flex gap-2">
                <%-- 세션에 로그인 정보가 있으면 사용자명 표시, 없으면 로그인 버튼 --%>
                <c:choose>
                    <c:when test="${not empty sessionScope.loginUser}">
                        <span class="navbar-text me-2">
                            <i class="bi bi-person-circle"></i> ${sessionScope.loginUser.userName}님
                        </span>
                        <a href="/user/logout" class="btn btn-outline-secondary btn-sm">로그아웃</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/user/login" class="btn btn-outline-primary btn-sm">로그인</a>
                        <a href="/user/register" class="btn btn-primary btn-sm">회원가입</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>

<%-- 히어로 섹션 --%>
<section class="hero">
    <div class="container text-center">
        <h1 class="fw-bold mb-3">피규어 컬렉터들의 마켓</h1>
        <p class="mb-4 opacity-75">희귀 피규어를 사고팔고, 경매로 최고가를 노려보세요</p>
        <div class="d-flex justify-content-center gap-3">
            <a href="productList.jsp" class="btn btn-light btn-lg">컬렉션 보기</a>
            <a href="auctionList.jsp" class="btn btn-outline-light btn-lg">경매 참여</a>
        </div>
    </div>
</section>

<%-- 최신 상품 목록 — Servlet에서 request.setAttribute("newProductList", list) 로 전달 --%>
<div class="container py-4">
    <p class="section-title">최근 등록 상품</p>
    <div class="row g-3">
        <c:choose>
            <c:when test="${not empty newProductList}">
                <c:forEach var="p" items="${newProductList}">
                    <div class="col-6 col-md-3">
                        <div class="card product-card" onclick="location.href='productDetail.jsp?productId=${p.productId}'">
                            <img src="images/${p.imageFile}" alt="${p.productName}">
                            <div class="card-body p-2">
                                <span class="badge bg-secondary badge-grade">${p.grade}</span>
                                <p class="fw-semibold mb-0 mt-1" style="font-size:.9rem;">${p.productName}</p>
                                <p class="text-muted mb-0" style="font-size:.85rem;"><fmt:formatNumber value="${p.price}" pattern="#,###"/>원</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <%-- 더미 데이터 (Servlet 연동 전 UI 확인용) --%>
                <div class="col-6 col-md-3">
                    <div class="card product-card" onclick="location.href='productDetail.jsp?productId=1'">
                        <img src="images/miku2.jpg" alt="하츠네 미쿠 1/7">
                        <div class="card-body p-2">
                            <span class="badge bg-warning text-dark badge-grade">S</span>
                            <p class="fw-semibold mb-0 mt-1" style="font-size:.9rem;">하츠네 미쿠 1/7</p>
                            <p class="text-muted mb-0" style="font-size:.85rem;">180,000원</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="card product-card" onclick="location.href='productDetail.jsp?productId=2'">
                        <img src="images/miku1.jpg" alt="미쿠 Racing ver.">
                        <div class="card-body p-2">
                            <span class="badge bg-primary badge-grade">A</span>
                            <p class="fw-semibold mb-0 mt-1" style="font-size:.9rem;">미쿠 Racing ver.</p>
                            <p class="text-muted mb-0" style="font-size:.85rem;">95,000원</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="card product-card" onclick="location.href='productDetail.jsp?productId=3'">
                        <img src="images/pikachu1.jpg" alt="피카츄 팝업 피규어">
                        <div class="card-body p-2">
                            <span class="badge bg-success badge-grade">B</span>
                            <p class="fw-semibold mb-0 mt-1" style="font-size:.9rem;">피카츄 팝업 피규어</p>
                            <p class="text-muted mb-0" style="font-size:.85rem;">32,000원</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="card product-card" onclick="location.href='productDetail.jsp?productId=4'">
                        <img src="images/charmander.jpg" alt="파이리 1/4 스케일">
                        <div class="card-body p-2">
                            <span class="badge bg-secondary badge-grade">C</span>
                            <p class="fw-semibold mb-0 mt-1" style="font-size:.9rem;">파이리 1/4 스케일</p>
                            <p class="text-muted mb-0" style="font-size:.85rem;">45,000원</p>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="text-center mt-3">
        <a href="productList.jsp" class="btn btn-outline-primary">전체 상품 보기</a>
    </div>
</div>

<%-- 진행중 경매 — Servlet에서 request.setAttribute("liveAuctionList", list) 로 전달 --%>
<div class="container pb-5">
    <p class="section-title">진행중인 경매</p>
    <div class="row g-3">
        <c:choose>
            <c:when test="${not empty liveAuctionList}">
                <c:forEach var="a" items="${liveAuctionList}">
                    <div class="col-6 col-md-3">
                        <div class="card product-card" onclick="location.href='auctionDetail.jsp?auctionId=${a.auctionId}'">
                            <img src="images/${a.imageFile}" alt="${a.auctionTitle}">
                            <div class="card-body p-2">
                                <span class="badge bg-danger" style="font-size:.7rem;">경매중</span>
                                <p class="fw-semibold mb-0 mt-1" style="font-size:.9rem;">${a.auctionTitle}</p>
                                <p class="text-danger fw-bold mb-0" style="font-size:.85rem;">현재가 <fmt:formatNumber value="${a.currentPrice}" pattern="#,###"/>원</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="col-6 col-md-3">
                    <div class="card product-card" onclick="location.href='auctionDetail.jsp?auctionId=1'">
                        <img src="images/miku2.jpg" alt="경매 - 미쿠 한정판">
                        <div class="card-body p-2">
                            <span class="badge bg-danger" style="font-size:.7rem;">경매중</span>
                            <p class="fw-semibold mb-0 mt-1" style="font-size:.9rem;">하츠네 미쿠 한정판</p>
                            <p class="text-danger fw-bold mb-0" style="font-size:.85rem;">현재가 210,000원</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="card product-card" onclick="location.href='auctionDetail.jsp?auctionId=2'">
                        <img src="images/pikachu1.jpg" alt="경매 - 피카츄">
                        <div class="card-body p-2">
                            <span class="badge bg-danger" style="font-size:.7rem;">경매중</span>
                            <p class="fw-semibold mb-0 mt-1" style="font-size:.9rem;">피카츄 희귀 피규어</p>
                            <p class="text-danger fw-bold mb-0" style="font-size:.85rem;">현재가 58,000원</p>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="text-center mt-3">
        <a href="auctionList.jsp" class="btn btn-outline-danger">전체 경매 보기</a>
    </div>
</div>

</body>
</html>
