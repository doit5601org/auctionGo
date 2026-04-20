<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FigureMarket - 상품 삭제</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; }
        .navbar-brand { font-weight: 700; color: #4F46E5 !important; }
        .delete-card { background: #fff; border-radius: 14px; padding: 32px; box-shadow: 0 2px 8px rgba(0,0,0,.08); max-width: 480px; margin: 0 auto; }
        .product-thumb { width: 80px; height: 80px; object-fit: cover; border-radius: 10px; }
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
                <li class="nav-item"><a class="nav-link" href="productList.jsp">컬렉션</a></li>
                <li class="nav-item"><a class="nav-link" href="auctionList.jsp">경매</a></li>
                <li class="nav-item"><a class="nav-link fw-semibold text-primary" href="productMyList.jsp">내 상품</a></li>
            </ul>
        </div>
    </div>
</nav>

<%-- Servlet에서 request.setAttribute("product", productVO) 전달 --%>
<div class="container py-5">
    <div class="delete-card text-center">
        <div class="mb-3">
            <i class="bi bi-trash3-fill text-danger" style="font-size: 2.5rem;"></i>
        </div>
        <h5 class="fw-bold mb-1">상품을 삭제하시겠습니까?</h5>
        <p class="text-muted mb-4" style="font-size:.9rem;">삭제 후에는 복구할 수 없습니다.</p>

        <%-- 삭제할 상품 정보 표시 --%>
        <div class="d-flex align-items-center gap-3 bg-light rounded-3 p-3 mb-4 text-start">
            <c:choose>
                <c:when test="${not empty product}">
                    <img src="images/${product.mainImage}" class="product-thumb" alt="${product.productName}">
                    <div>
                        <p class="fw-semibold mb-0">${product.productName}</p>
                        <p class="text-muted mb-0" style="font-size:.85rem;">${product.grade}등급 · ${product.sizeName}</p>
                        <p class="fw-bold mb-0 text-primary" style="font-size:.9rem;">
                            <fmt:formatNumber value="${product.price}" pattern="#,###"/>원
                        </p>
                    </div>
                </c:when>
                <c:otherwise>
                    <%-- 더미 데이터 --%>
                    <img src="images/miku2.jpg" class="product-thumb" alt="하츠네 미쿠 1/7">
                    <div>
                        <p class="fw-semibold mb-0">하츠네 미쿠 1/7</p>
                        <p class="text-muted mb-0" style="font-size:.85rem;">S등급 · 1/7</p>
                        <p class="fw-bold mb-0 text-primary" style="font-size:.9rem;">180,000원</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <%-- Servlet: POST /product/delete/act 로 전송 --%>
        <form action="/product/delete/act" method="post">
            <input type="hidden" name="productId" value="${not empty product ? product.productId : param.productId}">
            <div class="d-flex gap-2">
                <a href="productMyList.jsp" class="btn btn-outline-secondary w-50">취소</a>
                <button type="submit" class="btn btn-danger w-50">
                    <i class="bi bi-trash3"></i> 삭제하기
                </button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
