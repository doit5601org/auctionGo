<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FigureMarket - 경매 신고</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; }
        .navbar-brand { font-weight: 700; color: #4F46E5 !important; }
        .report-card { background: #fff; border-radius: 14px; padding: 28px; box-shadow: 0 2px 8px rgba(0,0,0,.08); max-width: 520px; margin: 0 auto; }
        .char-count { font-size: .8rem; color: #6b7280; text-align: right; }
    </style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
function updateCount(el) {
    document.getElementById('charCount').textContent = el.value.length;
}
</script>    
</head>
<body>

<%-- 네비게이션 바 --%>
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="main.jsp"><i class="bi bi-box-seam"></i> 쌍용피규어마켓</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto ms-3">
                <li class="nav-item"><a class="nav-link" href="productList.jsp">컬렉션</a></li>
                <li class="nav-item"><a class="nav-link fw-semibold text-primary" href="auctionList.jsp">경매</a></li>
                <li class="nav-item"><a class="nav-link" href="productMyList.jsp">내 상품</a></li>
            </ul>
        </div>
    </div>
</nav>

<%-- 에러 메시지 — Servlet에서 forward 시 전달 --%>
<c:if test="${not empty errorMsg}">
    <div class="container mt-3">
        <div class="alert alert-danger">${errorMsg}</div>
    </div>
</c:if>

<div class="container py-4">
    <div class="report-card">
        <div class="d-flex align-items-center gap-2 mb-4">
            <i class="bi bi-flag-fill text-danger" style="font-size:1.3rem;"></i>
            <h5 class="fw-bold mb-0">경매 신고</h5>
        </div>

        <%-- 신고 대상 경매 표시 — Servlet에서 request.setAttribute("auction", auctionVO) 전달 --%>
        <div class="alert alert-light border mb-4">
            <p class="mb-0 text-muted" style="font-size:.85rem;">신고 대상 경매</p>
            <p class="fw-semibold mb-0">${not empty auction ? auction.auctionTitle : '하츠네 미쿠 한정판 경매'}</p>
        </div>

        <%-- Servlet: POST /auction/report/act 로 전송 --%>
        <form action="/auction/report/act" method="post">
            <input type="hidden" name="auctionId" value="${not empty auction ? auction.auctionId : param.auctionId}">

            <%-- 신고 유형 — Servlet에서 reportTypeList 전달 --%>
            <div class="mb-3">
                <label class="form-label fw-semibold">신고 유형 <span class="text-danger">*</span></label>
                <select name="reportTypeId" class="form-select" required>
                    <option value="">선택하세요</option>
                    <c:forEach var="t" items="${reportTypeList}">
                        <option value="${t.typeId}">${t.typeName}</option>
                    </c:forEach>
                    <c:if test="${empty reportTypeList}">
                        <option value="1">허위 경매 정보</option>
                        <option value="2">불법 상품 경매</option>
                        <option value="3">저작권 침해</option>
                        <option value="4">사기 의심</option>
                        <option value="5">기타</option>
                    </c:if>
                </select>
            </div>

            <%-- 신고 사유 (최대 500자) --%>
            <div class="mb-4">
                <label class="form-label fw-semibold">신고 사유 <span class="text-danger">*</span></label>
                <textarea name="reportContent" id="reportContent" class="form-control" rows="5"
                          required maxlength="500" placeholder="구체적인 신고 사유를 입력해 주세요 (최대 500자)"
                          oninput="updateCount(this)"></textarea>
                <p class="char-count mt-1"><span id="charCount">0</span> / 500</p>
            </div>

            <div class="d-flex gap-2">
                <button type="button" onclick="history.back()" class="btn btn-outline-secondary w-50">취소</button>
                <button type="submit" class="btn btn-danger w-50">
                    <i class="bi bi-flag"></i> 신고 제출
                </button>
            </div>
        </form>
    </div>
</div>


</body>
</html>
