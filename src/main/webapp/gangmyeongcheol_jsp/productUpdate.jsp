<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FigureMarket - 상품 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; }
        .navbar-brand { font-weight: 700; color: #4F46E5 !important; }
        .form-card { background: #fff; border-radius: 14px; padding: 28px; box-shadow: 0 2px 8px rgba(0,0,0,.08); max-width: 640px; margin: 0 auto; }
        .img-preview { display: flex; gap: 8px; flex-wrap: wrap; margin-top: 8px; }
        .img-preview img { width: 80px; height: 80px; object-fit: cover; border-radius: 8px; border: 1px solid #e5e7eb; }
    </style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
function showPreview(input) {
    const preview = document.getElementById('imgPreview');
    preview.innerHTML = '';
    Array.from(input.files).slice(0, 5).forEach(file => {
        const reader = new FileReader();
        reader.onload = e => {
            const img = document.createElement('img');
            img.src = e.target.result;
            preview.appendChild(img);
        };
        reader.readAsDataURL(file);
    });
}
</script>    
</head>
<body>

<%-- 네비게이션 바 --%>
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="main.jsp"><i class="bi bi-box-seam"></i>쌍용피규어마켓</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto ms-3">
                <li class="nav-item"><a class="nav-link" href="productList.jsp">컬렉션</a></li>
                <li class="nav-item"><a class="nav-link" href="auctionList.jsp">경매</a></li>
                <li class="nav-item"><a class="nav-link fw-semibold text-primary" href="productMyList.jsp">내 상품</a></li>
            </ul>
        </div>
    </div>
</nav>

<%-- 에러 메시지 — Servlet에서 forward 시 request.setAttribute("errorMsg", msg) 전달 --%>
<c:if test="${not empty errorMsg}">
    <div class="container mt-3">
        <div class="alert alert-danger">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>${errorMsg}
        </div>
    </div>
</c:if>

<%-- Servlet에서 request.setAttribute("product", productVO) 전달 --%>
<div class="container py-4">
    <div class="form-card">
        <h5 class="fw-bold mb-4">상품 수정</h5>

        <%-- Servlet: POST /product/update/act 로 전송 --%>
        <form action="/product/update/act" method="post" enctype="multipart/form-data">
            <%-- 상품 ID 히든 --%>
            <input type="hidden" name="productId" value="${not empty product ? product.productId : param.productId}">

            <%-- 기존 이미지 표시 --%>
            <div class="mb-3">
                <label class="form-label fw-semibold">기존 이미지</label>
                <div class="img-preview">
                    <c:choose>
                        <c:when test="${not empty product}">
                            <img src="images/${product.mainImage}" alt="기존 이미지">
                            <c:forEach var="img" items="${product.imageList}">
                                <img src="images/${img}" alt="">
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <img src="images/miku2.jpg" alt="기존 이미지">
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <%-- 새 이미지 업로드 --%>
            <div class="mb-3">
                <label class="form-label fw-semibold">이미지 교체 <span class="text-muted fw-normal">(선택, 최대 5장)</span></label>
                <input type="file" name="productImages" class="form-control" accept="image/jpeg,image/png" multiple onchange="showPreview(this)">
                <div class="img-preview" id="imgPreview"></div>
            </div>

            <%-- 상품명 --%>
            <div class="mb-3">
                <label class="form-label fw-semibold">상품명 <span class="text-danger">*</span></label>
                <input type="text" name="productName" class="form-control" required maxlength="100"
                       value="${not empty product ? product.productName : ''}">
            </div>

            <%-- 장르 --%>
            <div class="mb-3">
                <label class="form-label fw-semibold">장르 <span class="text-danger">*</span></label>
                <select name="genreId" class="form-select" required>
                    <option value="">선택하세요</option>
                    <c:forEach var="g" items="${genreList}">
                        <option value="${g.genreId}" <c:if test="${not empty product and product.genreId eq g.genreId}">selected</c:if>>${g.genreName}</option>
                    </c:forEach>
                    <c:if test="${empty genreList}">
                        <option value="1">애니메이션</option>
                        <option value="2">게임</option>
                    </c:if>
                </select>
            </div>

            <%-- 사이즈 --%>
            <div class="mb-3">
                <label class="form-label fw-semibold">사이즈 <span class="text-danger">*</span></label>
                <select name="sizeId" class="form-select" required>
                    <option value="">선택하세요</option>
                    <c:forEach var="s" items="${sizeList}">
                        <option value="${s.sizeId}" <c:if test="${not empty product and product.sizeId eq s.sizeId}">selected</c:if>>${s.sizeName}</option>
                    </c:forEach>
                    <c:if test="${empty sizeList}">
                        <option value="1">1/7</option>
                        <option value="2">1/4</option>
                    </c:if>
                </select>
            </div>

            <%-- 제조사 --%>
            <div class="mb-3">
                <label class="form-label fw-semibold">제조사 <span class="text-danger">*</span></label>
                <select name="makerId" class="form-select" required>
                    <option value="">선택하세요</option>
                    <c:forEach var="m" items="${makerList}">
                        <option value="${m.makerId}" <c:if test="${not empty product and product.makerId eq m.makerId}">selected</c:if>>${m.makerName}</option>
                    </c:forEach>
                    <c:if test="${empty makerList}">
                        <option value="1">Good Smile Company</option>
                        <option value="2">Max Factory</option>
                    </c:if>
                </select>
            </div>

            <%-- 등급 --%>
            <div class="mb-3">
                <label class="form-label fw-semibold">상품 등급 <span class="text-danger">*</span></label>
                <div class="d-flex gap-3">
                   <c:forEach var="g" items="S,A,B,C">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="grade" id="grade${g}" value="${g}"
                                   <c:if test="${(not empty product and product.grade eq g) or (empty product and g eq 'S')}">checked</c:if>>
                            <label class="form-check-label" for="grade${g}">${g}</label>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <%-- 가격 --%>
            <div class="mb-3">
                <label class="form-label fw-semibold">판매가 (원) <span class="text-danger">*</span></label>
                <input type="number" name="price" class="form-control" required min="1000"
                       value="${not empty product ? product.price : ''}">
            </div>

            <%-- 상품 설명 --%>
            <div class="mb-4">
                <label class="form-label fw-semibold">상품 설명</label>
                <textarea name="description" class="form-control" rows="4" maxlength="1000">${not empty product ? product.description : ''}</textarea>
            </div>

            <div class="d-flex gap-2">
                <a href="productMyList.jsp" class="btn btn-outline-secondary w-50">취소</a>
                <button type="submit" class="btn btn-primary w-50">수정 완료</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
