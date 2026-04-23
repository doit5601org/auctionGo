<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쌍용피규어마켓 - 컬렉션</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        .product-card { cursor: pointer; }
        .product-card img { height: 180px; object-fit: cover; }
        .navbar-brand { font-weight: 700; color: #4F46E5 !important; }
    </style>
</head>
<body class="bg-light">

<jsp:include page="/common/header.jsp"></jsp:include>

<%-- 상단 헤더 --%>
<div class="page-header text-center">
    <div class="container">
        <h2 class="header-title">실시간 경매</h2>
        <p class="text-muted mb-0 small">지금 참여하고 최고의 컬렉션을 소유하세요!</p>
    </div>
</div>


<%-- 검색/필터 --%>
<%-- [Controller 연결 후] GET /product/list 로 전송, genreList·sizeList·makerList setAttribute로 전달 --%>
<div class="bg-white border-bottom py-2">
    <div class="container">
        <form method="get" action="productList.jsp" class="row g-2 align-items-center"><%-- action: ${ctx}/product/list --%>
            <div class="col-auto">
                <select name="genre" class="form-select form-select-sm">
                    <option value="">장르 전체</option>
                    <%-- [Controller 연결 후 활성화]
                    <c:forEach var="g" items="${genreList}">
                        <option value="${g.genreId}" <c:if test="${param.genre eq g.genreId}">selected</c:if>>${g.genreName}</option>
                    </c:forEach>
                    --%>
                    <%-- JSP 단독 실행용 샘플 옵션 --%>
                    <option value="1">애니메이션</option>
                    <option value="2">게임</option>
                    <option value="3">SF/로봇</option>
                    <option value="4">판타지</option>
                </select>
            </div>
            <div class="col-auto">
                <select name="size" class="form-select form-select-sm">
                    <option value="">사이즈 전체</option>
                    <%-- [Controller 연결 후 활성화]
                    <c:forEach var="s" items="${sizeList}">
                        <option value="${s.sizeId}" <c:if test="${param.size eq s.sizeId}">selected</c:if>>${s.sizeName}</option>
                    </c:forEach>
                    --%>
                    <%-- JSP 단독 실행용 샘플 옵션 --%>
                    <option value="1">1/4</option>
                    <option value="2">1/6</option>
                    <option value="3">1/7</option>
                    <option value="4">1/8</option>
                </select>
            </div>
            <div class="col-auto">
                <select name="maker" class="form-select form-select-sm">
                    <option value="">제조사 전체</option>
                    <%-- [Controller 연결 후 활성화]
                    <c:forEach var="m" items="${makerList}">
                        <option value="${m.makerId}" <c:if test="${param.maker eq m.makerId}">selected</c:if>>${m.makerName}</option>
                    </c:forEach>
                    --%>
                    <%-- JSP 단독 실행용 샘플 옵션 --%>
                    <option value="1">굿스마일컴퍼니</option>
                    <option value="2">알터</option>
                    <option value="3">코토부키야</option>
                    <option value="4">맥스팩토리</option>
                </select>
            </div>
            <div class="col-auto">
                <input type="text" name="keyword" class="form-control form-control-sm" placeholder="키워드 검색" value="${param.keyword}">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-dark btn-sm">검색</button>
            </div>
            <div class="col-auto ms-auto">
                <%-- 정렬 버튼 --%>
                <%-- [Controller 연결 후] action을 ${ctx}/product/list?sort=... 로 변경 --%>
                <div class="btn-group btn-group-sm">
                    <a href="productList.jsp?sort=newest&genre=${param.genre}&size=${param.size}&maker=${param.maker}&keyword=${param.keyword}"
                       class="btn btn-outline-secondary ${param.sort eq 'newest' or empty param.sort ? 'active' : ''}">등록순</a>
                    <a href="productList.jsp?sort=popular&genre=${param.genre}&size=${param.size}&maker=${param.maker}&keyword=${param.keyword}"
                       class="btn btn-outline-secondary ${param.sort eq 'popular' ? 'active' : ''}">인기순</a>
                    <a href="productList.jsp?sort=grade&genre=${param.genre}&size=${param.size}&maker=${param.maker}&keyword=${param.keyword}"
                       class="btn btn-outline-secondary ${param.sort eq 'grade' ? 'active' : ''}">등급순</a>
                </div>
            </div>
        </form>
    </div>
</div>

<%-- 상품 목록 --%>
<%-- [Controller 연결 후] request.setAttribute("productList", list), request.setAttribute("totalCount", n) 전달 --%>
<div class="container py-4">

    <%-- <p class="text-muted mb-3 small">총 <strong>${totalCount}</strong>개 상품</p> --%>
    <p class="text-muted mb-3 small">총 <strong>8</strong>개 상품</p>

    <div class="row g-3">
        <%-- [Controller 연결 후 활성화]
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
        --%>

        <%-- JSP 단독 실행용 샘플 데이터 --%>
        <div class="col-6 col-md-3">
            <div class="card product-card h-100" onclick="location.href='productDetail.jsp'">
                <img src="https://placehold.co/300x180/e9ecef/6c757d?text=No+Image" class="card-img-top" alt="">
                <div class="card-body p-2">
                    <span class="badge bg-secondary">S등급</span>
                    <p class="fw-semibold mb-0 mt-1">하츠네 미쿠 1/7 스케일</p>
                    <p class="text-muted mb-0 small">굿스마일컴퍼니 · 1/7</p>
                    <p class="fw-bold mb-0">128,000원</p>
                </div>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="card product-card h-100" onclick="location.href='productDetail.jsp'">
                <img src="https://placehold.co/300x180/e9ecef/6c757d?text=No+Image" class="card-img-top" alt="">
                <div class="card-body p-2">
                    <span class="badge bg-secondary">A등급</span>
                    <p class="fw-semibold mb-0 mt-1">렘 1/7 리제로</p>
                    <p class="text-muted mb-0 small">알터 · 1/7</p>
                    <p class="fw-bold mb-0">95,000원</p>
                </div>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="card product-card h-100" onclick="location.href='productDetail.jsp'">
                <img src="https://placehold.co/300x180/e9ecef/6c757d?text=No+Image" class="card-img-top" alt="">
                <div class="card-body p-2">
                    <span class="badge bg-secondary">S등급</span>
                    <p class="fw-semibold mb-0 mt-1">사쿠라지마 마이 1/7</p>
                    <p class="text-muted mb-0 small">굿스마일컴퍼니 · 1/7</p>
                    <p class="fw-bold mb-0">215,000원</p>
                </div>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="card product-card h-100" onclick="location.href='productDetail.jsp'">
                <img src="https://placehold.co/300x180/e9ecef/6c757d?text=No+Image" class="card-img-top" alt="">
                <div class="card-body p-2">
                    <span class="badge bg-secondary">B등급</span>
                    <p class="fw-semibold mb-0 mt-1">고블린 슬레이어 1/8</p>
                    <p class="text-muted mb-0 small">코토부키야 · 1/8</p>
                    <p class="fw-bold mb-0">62,000원</p>
                </div>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="card product-card h-100" onclick="location.href='productDetail.jsp'">
                <img src="https://placehold.co/300x180/e9ecef/6c757d?text=No+Image" class="card-img-top" alt="">
                <div class="card-body p-2">
                    <span class="badge bg-secondary">A등급</span>
                    <p class="fw-semibold mb-0 mt-1">에밀리아 1/7 리제로</p>
                    <p class="text-muted mb-0 small">알터 · 1/7</p>
                    <p class="fw-bold mb-0">110,000원</p>
                </div>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="card product-card h-100" onclick="location.href='productDetail.jsp'">
                <img src="https://placehold.co/300x180/e9ecef/6c757d?text=No+Image" class="card-img-top" alt="">
                <div class="card-body p-2">
                    <span class="badge bg-secondary">S등급</span>
                    <p class="fw-semibold mb-0 mt-1">제로투 1/6 오리지널</p>
                    <p class="text-muted mb-0 small">맥스팩토리 · 1/6</p>
                    <p class="fw-bold mb-0">320,000원</p>
                </div>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="card product-card h-100" onclick="location.href='productDetail.jsp'">
                <img src="https://placehold.co/300x180/e9ecef/6c757d?text=No+Image" class="card-img-top" alt="">
                <div class="card-body p-2">
                    <span class="badge bg-secondary">B등급</span>
                    <p class="fw-semibold mb-0 mt-1">리바이 병장 1/7</p>
                    <p class="text-muted mb-0 small">굿스마일컴퍼니 · 1/7</p>
                    <p class="fw-bold mb-0">78,000원</p>
                </div>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="card product-card h-100" onclick="location.href='productDetail.jsp'">
                <img src="https://placehold.co/300x180/e9ecef/6c757d?text=No+Image" class="card-img-top" alt="">
                <div class="card-body p-2">
                    <span class="badge bg-secondary">A등급</span>
                    <p class="fw-semibold mb-0 mt-1">키리토 1/8 SAO</p>
                    <p class="text-muted mb-0 small">알터 · 1/8</p>
                    <p class="fw-bold mb-0">55,000원</p>
                </div>
            </div>
        </div>
    </div>

    <%-- 페이지네이션 --%>
    <%-- [Controller 연결 후 활성화]
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
    --%>
    <%-- JSP 단독 실행용 샘플 페이지네이션 --%>
    <nav class="mt-4">
        <ul class="pagination justify-content-center">
            <li class="page-item active"><a class="page-link" href="productList.jsp?page=1">1</a></li>
            <li class="page-item"><a class="page-link" href="productList.jsp?page=2">2</a></li>
            <li class="page-item"><a class="page-link" href="productList.jsp?page=3">3</a></li>
        </ul>
    </nav>

</div>

<%-- bootstrap JS는 body 끝에 위치해야 정상 동작 --%>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
 -->
<jsp:include page="/common/footer.jsp"></jsp:include>

</body>
</html>
