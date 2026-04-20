<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쌍용피규어마켓 - 컬렉션</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<style>
        .product-card { cursor: pointer; }
        .product-card img { height: 180px; object-fit: cover; }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>   
</head>
<body class="bg-light">

<%-- 네비게이션 바 --%>
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${ctx}/main">쌍용피규어마켓</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto ms-3">
                <li class="nav-item"><a class="nav-link fw-semibold" href="${ctx}/product/list">컬렉션</a></li>
                <li class="nav-item"><a class="nav-link" href="${ctx}/auction/list">경매</a></li>
                <li class="nav-item"><a class="nav-link" href="${ctx}/product/myList">내 상품</a></li>
            </ul>
        </div>
    </div>
</nav>

<%-- 검색/필터 (Servlet GET /product/list 로 전송, genreList·sizeList·makerList를 setAttribute로 전달) --%>
<div class="bg-white border-bottom py-2">
    <div class="container">
        <form method="get" action="${ctx}/product/list" class="row g-2 align-items-center">
            <div class="col-auto">
                <select name="genre" class="form-select form-select-sm">
                    <option value="">장르 전체</option>
                    <c:forEach var="g" items="${genreList}">
                        <option value="${g.genreId}" <c:if test="${param.genre eq g.genreId}">selected</c:if>>${g.genreName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-auto">
                <select name="size" class="form-select form-select-sm">
                    <option value="">사이즈 전체</option>
                    <c:forEach var="s" items="${sizeList}">
                        <option value="${s.sizeId}" <c:if test="${param.size eq s.sizeId}">selected</c:if>>${s.sizeName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-auto">
                <select name="maker" class="form-select form-select-sm">
                    <option value="">제조사 전체</option>
                    <c:forEach var="m" items="${makerList}">
                        <option value="${m.makerId}" <c:if test="${param.maker eq m.makerId}">selected</c:if>>${m.makerName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-auto">
                <input type="text" name="keyword" class="form-control form-control-sm" placeholder="키워드 검색" value="${param.keyword}">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-dark btn-sm">검색</button>
            </div>
            <div class="col-auto ms-auto">
                <%-- 정렬 버튼 (Servlet에서 sort 파라미터로 정렬된 리스트 전달) --%>
                <div class="btn-group btn-group-sm">
                    <a href="${ctx}/product/list?sort=newest&genre=${param.genre}&size=${param.size}&maker=${param.maker}&keyword=${param.keyword}"
                       class="btn btn-outline-secondary ${param.sort eq 'newest' or empty param.sort ? 'active' : ''}">등록순</a>
                    <a href="${ctx}/product/list?sort=popular&genre=${param.genre}&size=${param.size}&maker=${param.maker}&keyword=${param.keyword}"
                       class="btn btn-outline-secondary ${param.sort eq 'popular' ? 'active' : ''}">인기순</a>
                    <a href="${ctx}/product/list?sort=grade&genre=${param.genre}&size=${param.size}&maker=${param.maker}&keyword=${param.keyword}"
                       class="btn btn-outline-secondary ${param.sort eq 'grade' ? 'active' : ''}">등급순</a>
                </div>
            </div>
        </form>
    </div>
</div>

<%-- 상품 목록 (Servlet에서 request.setAttribute("productList", list), request.setAttribute("totalCount", n) 전달) --%>
<div class="container py-4">
    <p class="text-muted mb-3 small">총 <strong>${totalCount}</strong>개 상품</p>

    <div class="row g-3">
        <c:forEach var="p" items="${productList}">
            <div class="col-6 col-md-3">
                <div class="card product-card h-100" onclick="location.href='${ctx}/product/detail?productId=${p.productId}'">
                    <img src="${ctx}/images/${p.imageFile}" class="card-img-top" alt="${p.productName}">
                    <div class="card-body p-2">
                        <span class="badge bg-secondary">${p.grade}등급</span>
                        <p class="fw-semibold mb-0 mt-1">${p.productName}</p>
                        <p class="text-muted mb-0 small">${p.makerName} · ${p.sizeName}</p>
                        <p class="fw-bold mb-0"><fmt:formatNumber value="${p.price}" pattern="#,###"/>원</p>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:if test="${empty productList}">
            <div class="col-12 text-center text-muted py-5">검색 결과가 없습니다.</div>
        </c:if>
    </div>

    <%-- 페이지네이션 (Servlet에서 currentPage, totalPage 전달) --%>
    <c:if test="${totalPage > 1}">
        <nav class="mt-4">
            <ul class="pagination justify-content-center">
                <c:forEach begin="1" end="${totalPage}" var="i">
                    <li class="page-item ${i eq currentPage ? 'active' : ''}">
                        <a class="page-link" href="${ctx}/product/list?page=${i}&sort=${param.sort}&genre=${param.genre}&keyword=${param.keyword}">${i}</a>
                    </li>
                </c:forEach>
            </ul>
        </nav>
    </c:if>
</div>


</body>
</html>
