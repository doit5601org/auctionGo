<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${product.productReleaseName}</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<link rel="stylesheet" href="${ctx}/css/common.css" />
<script src="https://code.jquery.com/jquery.min.js"></script>
<style>
    body { background-color: #f8f9fa; }
    .main-img {
        width: 100%;
        height: 360px;
        object-fit: cover;
        border-radius: 10px;
        border: 1px solid #e9ecef;
    }
    .thumb-img {
        width: 70px;
        height: 70px;
        object-fit: cover;
        border-radius: 6px;
        border: 2px solid transparent;
        cursor: pointer;
        transition: border-color 0.2s;
    }
    .thumb-img.active { border-color: #212529; }
    .thumb-img:hover { border-color: #adb5bd; }
    .info-card {
        background: #fff;
        border: 1px solid #e9ecef;
        border-radius: 12px;
        padding: 24px;
    }
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container py-4">

    <c:if test="${param.reportOk eq '1'}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            신고가 접수되었습니다.
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <nav aria-label="breadcrumb" class="mb-3">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${ctx}/main">홈</a></li>
            <li class="breadcrumb-item"><a href="${ctx}/product/list">컬렉션</a></li>
            <li class="breadcrumb-item active">${product.productReleaseName}</li>
        </ol>
    </nav>

    <div class="row g-4">

        <%-- 이미지 영역 --%>
        <div class="col-md-6">
            <c:choose>
                <c:when test="${not empty product.imagePath1}">
                    <img src="${ctx}/${product.imagePath1}" class="main-img" id="mainImg" alt="${product.productReleaseName}">
                </c:when>
                <c:otherwise>
                    <img src="https://placehold.co/360x360/e9ecef/6c757d?text=No+Image"
                         class="main-img" id="mainImg" alt="이미지 없음">
                </c:otherwise>
            </c:choose>

            <div class="d-flex gap-2 mt-2 flex-wrap">
                <c:if test="${not empty product.imagePath1}"><img src="${ctx}/${product.imagePath1}" class="thumb-img active" onclick="changeImg(this)" alt=""></c:if>
                <c:if test="${not empty product.imagePath2}"><img src="${ctx}/${product.imagePath2}" class="thumb-img" onclick="changeImg(this)" alt=""></c:if>
                <c:if test="${not empty product.imagePath3}"><img src="${ctx}/${product.imagePath3}" class="thumb-img" onclick="changeImg(this)" alt=""></c:if>
                <c:if test="${not empty product.imagePath4}"><img src="${ctx}/${product.imagePath4}" class="thumb-img" onclick="changeImg(this)" alt=""></c:if>
                <c:if test="${not empty product.imagePath5}"><img src="${ctx}/${product.imagePath5}" class="thumb-img" onclick="changeImg(this)" alt=""></c:if>
                <c:if test="${not empty product.imagePath6}"><img src="${ctx}/${product.imagePath6}" class="thumb-img" onclick="changeImg(this)" alt=""></c:if>
                <c:if test="${not empty product.imagePath7}"><img src="${ctx}/${product.imagePath7}" class="thumb-img" onclick="changeImg(this)" alt=""></c:if>
                <c:if test="${not empty product.imagePath8}"><img src="${ctx}/${product.imagePath8}" class="thumb-img" onclick="changeImg(this)" alt=""></c:if>
                <c:if test="${not empty product.imagePath9}"><img src="${ctx}/${product.imagePath9}" class="thumb-img" onclick="changeImg(this)" alt=""></c:if>
                <c:if test="${not empty product.imagePath10}"><img src="${ctx}/${product.imagePath10}" class="thumb-img" onclick="changeImg(this)" alt=""></c:if>
            </div>
        </div>

        <%-- 상품 정보 --%>
        <div class="col-md-6">
            <div class="info-card">
                <div class="mb-2">
                    <span class="badge bg-secondary me-1">${product.productGradeName}</span>
                    <span class="text-muted small">${product.manufacturerName}</span>
                </div>
                <h4 class="fw-bold">${product.productReleaseName}</h4>
                <c:if test="${not empty product.productAlias}">
                    <p class="text-muted mb-1 small">${product.productAlias}</p>
                </c:if>
                <p class="text-muted mb-3 small">
                    ${product.productSizeName}
                    <c:if test="${not empty product.productGenreName}"> · ${product.productGenreName}</c:if>
                </p>

                <hr>
                <table class="table table-sm table-borderless">
                    <c:if test="${not empty product.workName}">
                        <tr><th class="text-muted fw-normal" style="width:100px">작품명</th><td>${product.workName}</td></tr>
                    </c:if>
                    <c:if test="${not empty product.characterName}">
                        <tr><th class="text-muted fw-normal">캐릭터</th><td>${product.characterName}</td></tr>
                    </c:if>
                    <c:if test="${not empty product.productCountryName}">
                        <tr><th class="text-muted fw-normal">제조국</th><td>${product.productCountryName}</td></tr>
                    </c:if>
                    <tr><th class="text-muted fw-normal">개봉 여부</th><td>${product.isOpenedName}</td></tr>
                    <tr><th class="text-muted fw-normal">부품 상태</th><td>${product.isPartsMissingName}</td></tr>
                    <c:if test="${not empty product.purchaseDateTime}">
                        <tr><th class="text-muted fw-normal">구매일</th><td>${product.purchaseDateTime}</td></tr>
                    </c:if>
                    <tr><th class="text-muted fw-normal">등록일</th><td>${product.createdAt}</td></tr>
                </table>

                <c:if test="${not empty product.descriptions}">
                    <p class="small" style="white-space:pre-line;">${product.descriptions}</p>
                </c:if>

                <hr>

                <c:choose>
                    <c:when test="${not empty loginUserId and product.userId eq loginUserId}">
                        <div class="d-flex gap-2">
                            <a href="${ctx}/product/update?productId=${product.productId}"
                               class="btn w-50 py-2 fw-bold"
                               style="background-color:#f1f1f1;color:#333;border:1px solid #ddd;border-radius:8px;">수정</a>
                            <a href="${ctx}/product/delete?productId=${product.productId}"
                               class="btn w-50 py-2 fw-bold"
                               style="background-color:#212529;color:#fff;border:none;border-radius:8px;">삭제</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-end">
                            <a href="${ctx}/product/report?productId=${product.productId}"
                               class="btn btn-link btn-sm text-muted">신고하기</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function changeImg(el) {
        document.getElementById('mainImg').src = el.src;
        document.querySelectorAll('.thumb-img').forEach(function(t) {
            t.classList.remove('active');
        });
        el.classList.add('active');
    }
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
