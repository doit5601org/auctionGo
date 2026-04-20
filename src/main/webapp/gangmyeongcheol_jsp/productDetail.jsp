<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쌍용피규어마켓 - 상품 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<style>
        .main-img { width: 100%; height: 360px; object-fit: cover; border-radius: 8px; }
        .thumb-img { width: 70px; height: 70px; object-fit: cover; border-radius: 6px; border: 2px solid transparent; cursor: pointer; }
        .thumb-img.active { border-color: #0d6efd; }
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
    <div class="container">                   //${ctx}/main
        <a class="navbar-brand fw-bold" href="main.jsp">쌍용피규어마켓</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto ms-3">                           //${ctx}/product/list
                <li class="nav-item"><a class="nav-link fw-semibold" href="productList.jsp">컬렉션</a></li>
                                                                //${ctx}/auction/list
                <li class="nav-item"><a class="nav-link" href="auctionList.jsp">경매</a></li>
                                                                //${ctx}/product/myList
                <li class="nav-item"><a class="nav-link" href="productMyList.jsp">내 상품</a></li>
            </ul>
        </div>
    </div>
</nav>

<%-- Servlet에서 request.setAttribute("product", productVO) 전달 --%>
<div class="container py-4">
    <%-- 경로 표시 --%>
    <nav aria-label="breadcrumb" class="mb-3">
        <ol class="breadcrumb">
                                                //{ctx}/main
            <li class="breadcrumb-item"><a href="main.jsp">홈</a></li>
                                                    //${ctx}/product/list
            <li class="breadcrumb-item"><a href="productList.jsp">컬렉션</a></li>
            <li class="breadcrumb-item active">${product.productName}</li>
        </ol>
    </nav>

    <div class="row g-4">
        <%-- 이미지 영역 --%>
        <div class="col-md-6">
            <img src="${ctx}/images/${product.mainImage}" class="main-img" id="mainImg" alt="${product.productName}">
            <div class="d-flex gap-2 mt-2">
                <img src="${ctx}/images/${product.mainImage}" class="thumb-img active" onclick="changeImg(this)" alt="">
                <c:forEach var="img" items="${product.imageList}">
                    <img src="${ctx}/images/${img}" class="thumb-img" onclick="changeImg(this)" alt="">
                </c:forEach>
            </div>
        </div>

        <%-- 상품 정보 --%>
        <div class="col-md-6">
            <div class="bg-white rounded-3 p-4 shadow-sm">
                <div class="mb-2">
                    <span class="badge bg-secondary me-1">${product.grade}등급</span>
                    <span class="text-muted small">${product.makerName}</span>
                </div>
                <h4 class="fw-bold">${product.productName}</h4>
                <p class="text-muted mb-3 small">${product.sizeName} · ${product.genreName}</p>
                <h3 class="fw-bold text-primary">
                    <fmt:formatNumber value="${product.price}" pattern="#,###"/>원
                </h3>
                <hr>
                <table class="table table-sm table-borderless">
                    <tr>
                        <th class="text-muted fw-normal" style="width:90px">상품 상태</th>
                        <td>${product.condition}</td>
                    </tr>
                    <tr>
                        <th class="text-muted fw-normal">등록일</th>
                        <td>${product.createdAt}</td>
                    </tr>
                    <tr>
                        <th class="text-muted fw-normal">조회수</th>
                        <td>${product.viewCount}회</td>
                    </tr>
                </table>
                <p class="small">${product.description}</p>
                <hr>

                <%-- 본인 상품이면 수정/삭제, 아니면 신고 버튼 표시 --%>
                <c:choose>
                    <c:when test="${not empty sessionScope.loginUser and product.userId eq sessionScope.loginUser.userId}">
                        <div class="d-flex gap-2">
                            <a href="${ctx}/product/update?productId=${product.productId}" class="btn btn-outline-primary w-50">수정</a>
                            <a href="${ctx}/product/delete?productId=${product.productId}" class="btn btn-outline-danger w-50">삭제</a>
                        </div>
                    </c:when>
                    <c:when test="${not empty sessionScope.loginUser}">
                        <a href="${ctx}/product/report?productId=${product.productId}" class="btn btn-outline-danger btn-sm">
                            <i class="bi bi-flag"></i> 신고하기
                        </a>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</div>


</body>
</html>
