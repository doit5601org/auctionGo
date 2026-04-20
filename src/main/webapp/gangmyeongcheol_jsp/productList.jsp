<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FigureMarket - 상품 조회</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; }
        .navbar-brand { font-weight: 700; color: #4F46E5 !important; }
        .filter-bar { background: #fff; border-bottom: 1px solid #e5e7eb; padding: 12px 0; position: sticky; top: 0; z-index: 100; }
        .product-card { border: none; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,.08); transition: transform .2s; cursor: pointer; }
        .product-card:hover { transform: translateY(-4px); }
        .product-card img { height: 180px; object-fit: cover; border-radius: 12px 12px 0 0; }
        .sort-btn.active { background: #4F46E5; color: #fff; border-color: #4F46E5; }
        .badge-S { background: #FEF3C7; color: #92400E; }
        .badge-A { background: #DBEAFE; color: #1E40AF; }
        .badge-B { background: #D1FAE5; color: #065F46; }
        .badge-C { background: #F3F4F6; color: #374151; }
    </style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>    
</head>
<body>

<%-- 네비게이션 바 --%>
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="main.jsp"><i class="bi bi-box-seam"></i> 쌍용피규어마켓</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto ms-3">
                <li class="nav-item"><a class="nav-link fw-semibold text-primary" href="productList.jsp">컬렉션</a></li>
                <li class="nav-item"><a class="nav-link" href="auctionList.jsp">경매</a></li>
                <li class="nav-item"><a class="nav-link" href="productMyList.jsp">내 상품</a></li>
            </ul>
        </div>
    </div>
</nav>

<%-- 필터 바 — Servlet이 genreList, sizeList, makerList를 setAttribute로 전달 --%>
<div class="filter-bar">
    <div class="container">
        <form method="get" action="/product/list" class="row g-2 align-items-center">
            <div class="col-auto">
                <select name="genre" class="form-select form-select-sm">
                    <option value="">장르 전체</option>
                    <c:forEach var="g" items="${genreList}">
                        <option value="${g.genreId}" <c:if test="${param.genre eq g.genreId}">selected</c:if>>${g.genreName}</option>
                    </c:forEach>
                    <%-- 더미 옵션 (Servlet 연동 전 확인용) --%>
                    <c:if test="${empty genreList}">
                        <option value="1">애니메이션</option>
                        <option value="2">게임</option>
                        <option value="3">특촬</option>
                    </c:if>
                </select>
            </div>
            <div class="col-auto">
                <select name="size" class="form-select form-select-sm">
                    <option value="">사이즈 전체</option>
                    <c:forEach var="s" items="${sizeList}">
                        <option value="${s.sizeId}" <c:if test="${param.size eq s.sizeId}">selected</c:if>>${s.sizeName}</option>
                    </c:forEach>
                    <c:if test="${empty sizeList}">
                        <option value="1">1/7</option>
                        <option value="2">1/4</option>
                        <option value="3">Nendoroid</option>
                    </c:if>
                </select>
            </div>
            <div class="col-auto">
                <select name="maker" class="form-select form-select-sm">
                    <option value="">제조사 전체</option>
                    <c:forEach var="m" items="${makerList}">
                        <option value="${m.makerId}" <c:if test="${param.maker eq m.makerId}">selected</c:if>>${m.makerName}</option>
                    </c:forEach>
                    <c:if test="${empty makerList}">
                        <option value="1">Good Smile Company</option>
                        <option value="2">Max Factory</option>
                        <option value="3">Bandai</option>
                    </c:if>
                </select>
            </div>
            <div class="col-auto">
                <input type="text" name="keyword" class="form-control form-control-sm" placeholder="키워드 검색" value="${param.keyword}">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary btn-sm">검색</button>
            </div>
            <div class="col-auto ms-auto">
                <%-- 정렬 — Servlet에서 sort 파라미터를 읽어 정렬된 리스트 전달 --%>
                <div class="btn-group btn-group-sm">
                    <a href="?sort=newest&genre=${param.genre}&size=${param.size}&maker=${param.maker}&keyword=${param.keyword}"
                       class="btn btn-outline-secondary sort-btn ${param.sort eq 'newest' or empty param.sort ? 'active' : ''}">등록순</a>
                    <a href="?sort=popular&genre=${param.genre}&size=${param.size}&maker=${param.maker}&keyword=${param.keyword}"
                       class="btn btn-outline-secondary sort-btn ${param.sort eq 'popular' ? 'active' : ''}">인기순</a>
                    <a href="?sort=grade&genre=${param.genre}&size=${param.size}&maker=${param.maker}&keyword=${param.keyword}"
                       class="btn btn-outline-secondary sort-btn ${param.sort eq 'grade' ? 'active' : ''}">등급순</a>
                </div>
            </div>
        </form>
    </div>
</div>

<%-- 상품 목록 — Servlet에서 request.setAttribute("productList", list), request.setAttribute("totalCount", n) 전달 --%>
<div class="container py-4">
    <p class="text-muted mb-3" style="font-size:.9rem;">
        총 <strong>${not empty totalCount ? totalCount : '4'}</strong>개 상품
    </p>

    <div class="row g-3" id="productGrid">
        <c:choose>
            <c:when test="${not empty productList}">
                <c:forEach var="p" items="${productList}">
                    <div class="col-6 col-md-3">
                        <div class="card product-card" onclick="location.href='productDetail.jsp?productId=${p.productId}'">
                            <img src="images/${p.imageFile}" alt="${p.productName}">
                            <div class="card-body p-2">
                                <span class="badge badge-${p.grade} rounded-pill" style="font-size:.7rem;">${p.grade}등급</span>
                                <p class="fw-semibold mb-0 mt-1" style="font-size:.9rem;">${p.productName}</p>
                                <p class="text-muted mb-0" style="font-size:.8rem;">${p.makerName} · ${p.sizeName}</p>
                                <p class="fw-bold mb-0" style="font-size:.95rem; color:#4F46E5;">
                                    <fmt:formatNumber value="${p.price}" pattern="#,###"/>원
                                </p>
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
                            <span class="badge badge-S rounded-pill" style="font-size:.7rem;">S등급</span>
                            <p class="fw-semibold mb-0 mt-1" style="font-size:.9rem;">하츠네 미쿠 1/7</p>
                            <p class="text-muted mb-0" style="font-size:.8rem;">Good Smile · 1/7</p>
                            <p class="fw-bold mb-0" style="font-size:.95rem; color:#4F46E5;">180,000원</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="card product-card" onclick="location.href='productDetail.jsp?productId=2'">
                        <img src="images/miku1.jpg" alt="미쿠 Racing ver.">
                        <div class="card-body p-2">
                            <span class="badge badge-A rounded-pill" style="font-size:.7rem;">A등급</span>
                            <p class="fw-semibold mb-0 mt-1" style="font-size:.9rem;">미쿠 Racing ver.</p>
                            <p class="text-muted mb-0" style="font-size:.8rem;">Max Factory · 1/7</p>
                            <p class="fw-bold mb-0" style="font-size:.95rem; color:#4F46E5;">95,000원</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="card product-card" onclick="location.href='productDetail.jsp?productId=3'">
                        <img src="images/pikachu1.jpg" alt="피카츄 팝업 피규어">
                        <div class="card-body p-2">
                            <span class="badge badge-B rounded-pill" style="font-size:.7rem;">B등급</span>
                            <p class="fw-semibold mb-0 mt-1" style="font-size:.9rem;">피카츄 팝업 피규어</p>
                            <p class="text-muted mb-0" style="font-size:.8rem;">Bandai · Nendoroid</p>
                            <p class="fw-bold mb-0" style="font-size:.95rem; color:#4F46E5;">32,000원</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="card product-card" onclick="location.href='productDetail.jsp?productId=4'">
                        <img src="images/charmander.jpg" alt="파이리 1/4 스케일">
                        <div class="card-body p-2">
                            <span class="badge badge-C rounded-pill" style="font-size:.7rem;">C등급</span>
                            <p class="fw-semibold mb-0 mt-1" style="font-size:.9rem;">파이리 1/4 스케일</p>
                            <p class="text-muted mb-0" style="font-size:.8rem;">Bandai · 1/4</p>
                            <p class="fw-bold mb-0" style="font-size:.95rem; color:#4F46E5;">45,000원</p>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <%-- 페이지네이션 — Servlet에서 currentPage, totalPage 전달 --%>
    <c:if test="${totalPage > 1}">
        <nav class="mt-4">
            <ul class="pagination justify-content-center">
                <c:forEach begin="1" end="${totalPage}" var="i">
                    <li class="page-item ${i eq currentPage ? 'active' : ''}">
                        <a class="page-link" href="?page=${i}&sort=${param.sort}&genre=${param.genre}&keyword=${param.keyword}">${i}</a>
                    </li>
                </c:forEach>
            </ul>
        </nav>
    </c:if>
</div>

</body>
</html>
