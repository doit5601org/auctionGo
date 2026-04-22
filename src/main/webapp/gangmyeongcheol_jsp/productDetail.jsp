<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        .navbar-brand { font-weight: 700; color: #4F46E5 !important; }
        .main-img { width: 100%; height: 360px; object-fit: cover; border-radius: 8px; }
        .thumb-img { width: 70px; height: 70px; object-fit: cover; border-radius: 6px; border: 2px solid transparent; cursor: pointer; }
        .thumb-img.active { border-color: #0d6efd; }
    </style>
</head>
<body class="bg-light">
<jsp:include page="/common/header.jsp"></jsp:include>
<%-- 네비게이션 바 --%>
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="main.jsp">경매나라</a><%-- ${ctx}/main --%>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto ms-3">
                <li class="nav-item"><a class="nav-link fw-semibold" href="productList.jsp">컬렉션</a></li><%-- ${ctx}/product/list --%>
                <li class="nav-item"><a class="nav-link" href="auctionList.jsp">경매</a></li><%-- ${ctx}/auction/list --%>
                <li class="nav-item"><a class="nav-link" href="productMyList.jsp">내 상품</a></li><%-- ${ctx}/product/myList --%>
            </ul>
        </div>
    </div>
</nav>

<%-- [Controller 연결 후] request.setAttribute("product", productVO) 전달 --%>
<div class="container py-4">
    <%-- 경로 표시 --%>
    <nav aria-label="breadcrumb" class="mb-3">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="main.jsp">홈</a></li><%-- ${ctx}/main --%>
            <li class="breadcrumb-item"><a href="productList.jsp">컬렉션</a></li><%-- ${ctx}/product/list --%>
            <%-- <li class="breadcrumb-item active">${product.productName}</li> --%>
            <li class="breadcrumb-item active">하츠네 미쿠 1/7 스케일</li>
        </ol>
    </nav>

    <div class="row g-4">
        <%-- 이미지 영역 --%>
        <div class="col-md-6">
            <%-- <img src="${ctx}/images/${product.mainImage}" class="main-img" id="mainImg" alt="${product.productName}"> --%>
            <img src="https://placehold.co/360x360/e9ecef/6c757d?text=No+Image" class="main-img" id="mainImg" alt="샘플 이미지">
            <div class="d-flex gap-2 mt-2">
                <%-- [Controller 연결 후 활성화]
                <img src="${ctx}/images/${product.mainImage}" class="thumb-img active" onclick="changeImg(this)" alt="">
                <c:forEach var="img" items="${product.imageList}">
                    <img src="${ctx}/images/${img}" class="thumb-img" onclick="changeImg(this)" alt="">
                </c:forEach>
                --%>
                <%-- JSP 단독 실행용 샘플 썸네일 --%>
                <img src="https://placehold.co/70x70/e9ecef/6c757d?text=1" class="thumb-img active" onclick="changeImg(this)" alt="">
                <img src="https://placehold.co/70x70/e9ecef/6c757d?text=2" class="thumb-img" onclick="changeImg(this)" alt="">
                <img src="https://placehold.co/70x70/e9ecef/6c757d?text=3" class="thumb-img" onclick="changeImg(this)" alt="">
            </div>
        </div>

        <%-- 상품 정보 --%>
        <div class="col-md-6">
            <div class="bg-white rounded-3 p-4 shadow-sm">
                <div class="mb-2">
                    <%-- <span class="badge bg-secondary me-1">${product.grade}등급</span> --%>
                    <%-- <span class="text-muted small">${product.makerName}</span> --%>
                    <span class="badge bg-secondary me-1">S등급</span>
                    <span class="text-muted small">굿스마일컴퍼니</span>
                </div>
                <%-- <h4 class="fw-bold">${product.productName}</h4> --%>
                <h4 class="fw-bold">하츠네 미쿠 1/7 스케일</h4>
                <%-- <p class="text-muted mb-3 small">${product.sizeName} · ${product.genreName}</p> --%>
                <p class="text-muted mb-3 small">1/7 · 애니메이션</p>
                <%-- <h3 class="fw-bold text-primary"><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</h3> --%>
                <h3 class="fw-bold text-primary">128,000원</h3>
                <hr>
                <table class="table table-sm table-borderless">
                    <tr>
                        <th class="text-muted fw-normal" style="width:90px">상품 상태</th>
                        <%-- <td>${product.condition}</td> --%>
                        <td>미개봉</td>
                    </tr>
                    <tr>
                        <th class="text-muted fw-normal">등록일</th>
                        <%-- <td>${product.createdAt}</td> --%>
                        <td>2025-04-10</td>
                    </tr>
                    <tr>
                        <th class="text-muted fw-normal">조회수</th>
                        <%-- <td>${product.viewCount}회</td> --%>
                        <td>128회</td>
                    </tr>
                </table>
                <%-- <p class="small">${product.description}</p> --%>
                <p class="small">2023년 굿스마일컴퍼니에서 출시한 하츠네 미쿠 1/7 스케일 피규어입니다. 미개봉 상태이며 박스 상태도 양호합니다.</p>
                <hr>

                <%-- 본인 상품이면 수정/삭제, 아니면 경매 요청 + 신고 버튼 표시 --%>
                <%-- [Controller 연결 후 활성화]
                <c:choose>
                    <c:when test="${not empty sessionScope.loginUser and product.userId eq sessionScope.loginUser.userId}">
                        <!-- 본인 상품: 수정/삭제 -->
                        <div class="d-flex gap-2">
                            <a href="${ctx}/product/update?productId=${product.productId}" class="btn btn-outline-primary w-50">수정</a>
                            <a href="${ctx}/product/delete?productId=${product.productId}" class="btn btn-outline-danger w-50">삭제</a>
                        </div>
                    </c:when>
                    <c:when test="${not empty sessionScope.loginUser}">
                        <!-- 타인 상품 + 로그인: 경매 요청 + 신고 -->
                        <form action="${ctx}/product/auctionRequest" method="post">
                            <input type="hidden" name="productId" value="${product.productId}">
                            <button type="submit" class="btn btn-dark w-100 mb-2">
                                <i class="bi bi-megaphone"></i> 경매로 올려주세요!
                            </button>
                        </form>
                        <div class="text-end">
                            <a href="${ctx}/product/report?productId=${product.productId}" class="btn btn-link btn-sm text-muted p-0 small">
                                <i class="bi bi-flag"></i> 신고하기
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- 비로그인: 로그인 유도 -->
                        <a href="${ctx}/user/login" class="btn btn-dark w-100 mb-2">
                            <i class="bi bi-megaphone"></i> 경매로 올려주세요!
                        </a>
                        <p class="text-muted small text-center mb-0">로그인 후 경매 요청이 가능합니다.</p>
                    </c:otherwise>
                </c:choose>
                --%>
                <%-- JSP 단독 실행용: 확인할 상태 하나만 주석 해제 --%>

                <%-- [상태 1] 본인 상품 → 수정/삭제 버튼
                <div class="d-flex gap-2">
                    <a href="productUpdate.jsp" class="btn btn-outline-primary w-50">수정</a>
                    <a href="productDelete.jsp" class="btn btn-outline-danger w-50">삭제</a>
                </div>
                --%>

                <%-- [상태 2] 타인 상품 + 로그인 → 경매 요청 + 신고 버튼 --%>
                <form action="productDetail.jsp" method="post">
                    <input type="hidden" name="productId" value="1">
                    <button type="submit" class="btn btn-dark w-100 mb-2">
                        <i class="bi bi-megaphone"></i> 경매 요청하기
                    </button>
                </form>
                <div class="text-end">
                    <a href="productReport.jsp" class="btn btn-link btn-sm text-muted p-0 small">
                        <i class="bi bi-flag"></i> 신고하기
                    </a>
                </div>

                <%-- [상태 3] 비로그인 → 로그인 유도
                <a href="login.jsp" class="btn btn-dark w-100 mb-2">
                    <i class="bi bi-megaphone"></i> 경매 요청하기
                </a>
                <p class="text-muted small text-center mb-0">로그인 후 경매 요청이 가능합니다.</p>
                --%>
            </div>
        </div>
    </div>
</div>

<%-- bootstrap JS는 body 끝에 위치해야 정상 동작 --%>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> -->
<jsp:include page="/common/footer.jsp"></jsp:include>
<script>
// 썸네일 클릭 시 메인 이미지 변경
function changeImg(el) {
    document.getElementById('mainImg').src = el.src;
    document.querySelectorAll('.thumb-img').forEach(function(t) { t.classList.remove('active'); });
    el.classList.add('active');
}
</script>
</body>
</html>
