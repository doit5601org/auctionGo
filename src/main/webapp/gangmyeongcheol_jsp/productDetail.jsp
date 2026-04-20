<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FigureMarket - 상품 상세</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; }
        .navbar-brand { font-weight: 700; color: #4F46E5 !important; }
        .main-img { width: 100%; height: 360px; object-fit: cover; border-radius: 12px; }
        .thumb-img { width: 70px; height: 70px; object-fit: cover; border-radius: 8px; border: 2px solid transparent; cursor: pointer; }
        .thumb-img.active { border-color: #4F46E5; }
        .info-card { background: #fff; border-radius: 12px; padding: 24px; box-shadow: 0 2px 8px rgba(0,0,0,.08); }
        .grade-badge { font-size: .85rem; padding: 4px 12px; border-radius: 20px; }
        .grade-S { background: #FEF3C7; color: #92400E; }
        .grade-A { background: #DBEAFE; color: #1E40AF; }
        .grade-B { background: #D1FAE5; color: #065F46; }
        .grade-C { background: #F3F4F6; color: #374151; }
    </style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
// 썸네일 클릭 시 메인 이미지 전환
function changeImg(el) {
    document.getElementById('mainImg').src = el.src;
    document.querySelectorAll('.thumb-img').forEach(t => t.classList.remove('active'));
    el.classList.add('active');
}
</script>   
</head>
<body>

<%-- 네비게이션 바 --%>
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="main.jsp"><i class="bi bi-box-seam"></i> FigureMarket</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto ms-3">
                <li class="nav-item"><a class="nav-link" href="productList.jsp">컬렉션</a></li>
                <li class="nav-item"><a class="nav-link" href="auctionList.jsp">경매</a></li>
                <li class="nav-item"><a class="nav-link" href="productMyList.jsp">내 상품</a></li>
            </ul>
        </div>
    </div>
</nav>

<%-- Servlet에서 request.setAttribute("product", productVO) 전달 --%>
<div class="container py-4">
    <nav aria-label="breadcrumb" class="mb-3">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="main.jsp">홈</a></li>
            <li class="breadcrumb-item"><a href="productList.jsp">컬렉션</a></li>
            <li class="breadcrumb-item active">${not empty product ? product.productName : '하츠네 미쿠 1/7'}</li>
        </ol>
    </nav>

    <div class="row g-4">
        <%-- 이미지 영역 --%>
        <div class="col-md-6">
            <c:choose>
                <c:when test="${not empty product}">
                    <img src="images/${product.mainImage}" class="main-img" id="mainImg" alt="${product.productName}">
                    <div class="d-flex gap-2 mt-2">
                        <img src="images/${product.mainImage}" class="thumb-img active" onclick="changeImg(this)" alt="">
                        <c:forEach var="img" items="${product.imageList}">
                            <img src="images/${img}" class="thumb-img" onclick="changeImg(this)" alt="">
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <%-- 더미 이미지 --%>
                    <img src="images/miku2.jpg" class="main-img" id="mainImg" alt="하츠네 미쿠 1/7">
                    <div class="d-flex gap-2 mt-2">
                        <img src="images/miku2.jpg" class="thumb-img active" onclick="changeImg(this)" alt="">
                        <img src="images/miku1.jpg" class="thumb-img" onclick="changeImg(this)" alt="">
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <%-- 상품 정보 --%>
        <div class="col-md-6">
            <div class="info-card">
                <c:set var="p" value="${not empty product ? product : null}"/>
                <div class="d-flex align-items-center gap-2 mb-2">
                    <span class="grade-badge grade-${not empty p ? p.grade : 'S'}">${not empty p ? p.grade : 'S'}등급</span>
                    <span class="text-muted" style="font-size:.85rem;">${not empty p ? p.makerName : 'Good Smile Company'}</span>
                </div>
                <h4 class="fw-bold">${not empty p ? p.productName : '하츠네 미쿠 1/7 스케일 피규어'}</h4>
                <p class="text-muted mb-3" style="font-size:.9rem;">${not empty p ? p.sizeName : '1/7 스케일'} · ${not empty p ? p.genreName : '애니메이션'}</p>
                <h3 class="fw-bold text-primary">
                    <fmt:formatNumber value="${not empty p ? p.price : 180000}" pattern="#,###"/>원
                </h3>
                <hr>
                <table class="table table-sm table-borderless">
                    <tr>
                        <th class="text-muted fw-normal" style="width:100px">상품 상태</th>
                        <td>${not empty p ? p.condition : '미개봉 (MISB)'}</td>
                    </tr>
                    <tr>
                        <th class="text-muted fw-normal">등록일</th>
                        <td>${not empty p ? p.createdAt : '2025-04-10'}</td>
                    </tr>
                    <tr>
                        <th class="text-muted fw-normal">조회수</th>
                        <td>${not empty p ? p.viewCount : '128'}회</td>
                    </tr>
                </table>
                <p style="font-size:.9rem; color: #374151; line-height: 1.7;">
                    ${not empty p ? p.description : '굿스마일컴퍼니 하츠네 미쿠 1/7 스케일 피규어입니다. 미개봉 상태이며 박스도 깨끗합니다. 직거래 또는 택배 모두 가능합니다.'}
                </p>
                <hr>
                <%-- 본인 상품이 아닐 때만 신고 버튼 표시 --%>
                <c:if test="${not empty sessionScope.loginUser and (empty product or product.userId ne sessionScope.loginUser.userId)}">
                    <a href="productReport.jsp?productId=${not empty p ? p.productId : 1}" class="btn btn-outline-danger btn-sm">
                        <i class="bi bi-flag"></i> 신고하기
                    </a>
                </c:if>
                <%-- 본인 상품일 때 수정/삭제 버튼 표시 --%>
                <c:if test="${not empty product and product.userId eq sessionScope.loginUser.userId}">
                    <div class="d-flex gap-2">
                        <a href="productUpdate.jsp?productId=${p.productId}" class="btn btn-outline-primary btn-sm flex-fill">수정</a>
                        <a href="productDelete.jsp?productId=${p.productId}" class="btn btn-outline-danger btn-sm flex-fill">삭제</a>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>

</body>
</html>
