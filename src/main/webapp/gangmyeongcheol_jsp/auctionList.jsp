<%@ page contentType="text/html; charset=UTF-8"%>
<%--
    [DB연결 후 상단에 추가]
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background-color: #f0f7ff; }
    .navbar { background: white; border-bottom: 1px solid #e3f2fd; }
    .navbar-brand { color: #1565c0 !important; font-weight: 900; font-size: 20px; }
    .nav-link { color: #444 !important; font-size: 14px; font-weight: 500; }
    .nav-link:hover, .nav-link.active { color: #1565c0 !important; }
    .page-header { background-color: #1565c0; color: white; padding: 18px 24px; border-radius: 10px; margin-bottom: 24px; }
    .filter-card { background: white; border-radius: 10px; padding: 16px 20px; box-shadow: 0 2px 8px rgba(21,101,192,0.08); margin-bottom: 20px; }
    .auction-card { border: none; border-radius: 12px; box-shadow: 0 2px 8px rgba(21,101,192,0.07); transition: transform 0.15s; cursor: pointer; background: white; }
    .auction-card:hover { transform: translateY(-4px); box-shadow: 0 6px 16px rgba(21,101,192,0.13); }
    .auction-card img { aspect-ratio: 1; object-fit: cover; border-radius: 12px 12px 0 0; width: 100%; }
    .timer-pill { background: #fff3e0; color: #e65100; font-size: 11px; font-weight: bold; border-radius: 20px; padding: 2px 10px; }
    .current-price { color: #1565c0; font-size: 15px; font-weight: 800; }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<%-- ${ctx}/main, ${ctx}/auction/list, ${ctx}/product/list, ${ctx}/product/myList --%>
<nav class="navbar navbar-expand-lg ">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">경매나라</a>
        <div class="d-flex gap-3 ms-4">
            <a href="main.jsp" class="nav-link active">경매</a>
            <a href="productList.jsp" class="nav-link">컬렉션</a>
            <a href="productMyList.jsp" class="nav-link">내 상품</a>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5">
    <div class="page-header">
        <h5 class="mb-0 fw-bold">경매 목록</h5>
        <p class="mb-0 small opacity-75 mt-1">당신의 소장품을 뽐내고, 경매로 가치를 더하세요!!!</p>
    </div>

    <%-- form action="${ctx}/auction/list" --%>
    <div class="filter-card">
        <form action="auctionList.jsp" method="get" class="row g-2 align-items-end">

            <%--
                DB연결 select 옵션을 c:forEach로 교체
                <c:forEach var="g" items="${genreList}">
                    <option value="${g.genreId}" <c:if test="${pGenreId eq g.genreId}">selected</c:if>>${g.genreName}</option>
                </c:forEach>
            --%>
            <div class="col-md-2">
                <label class="form-label small fw-bold text-secondary mb-1">장르</label>
                <select name="genreId" class="form-select form-select-sm">
                    <option value="">전체</option>
                    <option value="1">VOCALOID</option>
                    <option value="2">애니메이션</option>
                </select>
            </div>
            <div class="col-md-2">
                <label class="form-label small fw-bold text-secondary mb-1">사이즈</label>
                <select name="sizeId" class="form-select form-select-sm">
                    <option value="">전체</option>
                    <option value="1">1/7</option>
                    <option value="2">1/8</option>
                </select>
            </div>

            <div class="col-md-4">
                <label class="form-label small fw-bold text-secondary mb-1">경매명 검색</label>
                <input type="text" name="keyword" class="form-control form-control-sm" placeholder="경매명을 입력하세요">
            </div>
            <div class="col-md-2 d-flex gap-1">
                <button type="submit" class="btn btn-primary btn-sm w-100">검색</button>
                <a href="auctionList.jsp" class="btn btn-outline-secondary btn-sm w-100">초기화</a>
            </div>
        </form>
    </div>

    <%-- DB연결  총 <strong>${totalCount}</strong>개 --%>
    <div class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-muted small">총 <strong class="text-dark">2</strong>개</span>
        <select class="form-select form-select-sm" style="width:120px">
            <option>최신순</option>
            <option>마감임박순</option>
            <option>입찰가높은순</option>
        </select>
    </div>

    <div class="row row-cols-2 row-cols-md-4 g-3">

        <%--
            DB연결 후 c:forEach로 
            <c:forEach var="a" items="${auctionList}">
            <div class="col">
                <div class="auction-card card h-100" onclick="location.href='${ctx}/auction/detail?auctionId=${a.auctionId}'">
                    <img src="${ctx}${a.imgUrl}" onerror="this.src='https://placehold.co/300x300/eee/999?text=No+Image'" alt="">
                    <div class="card-body p-3">
                        <div class="d-flex justify-content-between align-items-center mb-1">
                            <span class="timer-pill">${a.remainTime}</span>
                            <span class="badge" style="background:#e3f2fd;color:#1565c0;font-size:10px">${a.grade}급</span>
                        </div>
                        <p class="fw-bold small mb-1">${a.auctionName}</p>
                        <p class="text-muted mb-1" style="font-size:11px">${a.makerName}</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="current-price"><fmt:formatNumber value="${a.currentPrice}" pattern="#,###"/>원</span>
                            <span class="text-muted" style="font-size:11px">입찰 ${a.bidCount}회</span>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        --%>

        <%-- 임시데이터 1 --%>
        <div class="col">
            <div class="auction-card card h-100" onclick="location.href='auctionDetail.jsp?auctionId=A001'">
                <img src="https://placehold.co/300x300/e3f2fd/1565c0?text=Miku+1%2F7" alt="">
                <div class="card-body p-3">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <span class="timer-pill">23:14:05</span>
                        <span class="badge" style="background:#e3f2fd;color:#1565c0;font-size:10px">S급</span>
                    </div>
                    <p class="fw-bold small mb-1">하츠네 미쿠 1/7 스케일 피규어</p>
                    <p class="text-muted mb-1" style="font-size:11px">굿스마일컴퍼니</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="current-price">35,000원</span>
                        <span class="text-muted" style="font-size:11px">입찰 3회</span>
                    </div>
                </div>
            </div>
        </div>

        <%-- 임시데이터 2 --%>
        <div class="col">
            <div class="auction-card card h-100" onclick="location.href='auctionDetail.jsp?auctionId=A002'">
                <img src="https://placehold.co/300x300/fce4ec/c62828?text=Racing+Miku" alt="">
                <div class="card-body p-3">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <span class="timer-pill">47:30:12</span>
                        <span class="badge" style="background:#e3f2fd;color:#1565c0;font-size:10px">A급</span>
                    </div>
                    <p class="fw-bold small mb-1">하츠네 미쿠 Racing Miku 2023</p>
                    <p class="text-muted mb-1" style="font-size:11px">굿스마일컴퍼니</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="current-price">28,000원</span>
                        <span class="text-muted" style="font-size:11px">입찰 1회</span>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
