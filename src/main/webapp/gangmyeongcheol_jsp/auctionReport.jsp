<%@ page contentType="text/html; charset=UTF-8"%>
<%
    String auctionId = request.getParameter("auctionId");
    if (auctionId == null) auctionId = "A001";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 신고</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%-- 네비바 --%>
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">🎌 FigureAuction</a>
        <div class="d-flex gap-3 ms-4">
            <a href="auctionList.jsp" class="nav-link">경매</a>
            <a href="productList.jsp" class="nav-link">컬렉션</a>
            <a href="productMyList.jsp" class="nav-link">내 상품</a>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5" style="max-width:600px">
    <div class="page-header">
        <h5 class="mb-0 fw-bold">경매 신고</h5>
    </div>

    <div class="card p-4">
        <div class="alert alert-warning small">
            <strong>유의사항</strong><br>
            허위 신고 시 본인에게 패널티가 부여될 수 있습니다.<br>
            신고 내용은 관리자가 검토 후 처리 결과를 알려드립니다.
        </div>

        <%-- API 명세서: POST /report/report-submit --%>
        <form action="/report/report-submit" method="post">
            <input type="hidden" name="auctionId" value="<%= auctionId %>">
            <div class="mb-3">
                <label class="form-label fw-bold">신고 유형 <span class="text-danger">*</span></label>
                <select name="reportTypeId" class="form-select" required>
                    <option value="">선택하세요</option>
                    <option value="1">허위 상품 정보</option>
                    <option value="2">직거래 유도</option>
                    <option value="3">사기 의심</option>
                    <option value="4">부적절한 이미지</option>
                    <option value="5">입찰 조작 의심</option>
                    <option value="6">기타</option>
                </select>
            </div>
            <div class="mb-4">
                <label class="form-label fw-bold">신고 사유 <span class="text-danger">*</span></label>
                <textarea name="reportReason" class="form-control" rows="5" maxlength="500"
                          placeholder="신고 사유를 상세히 입력해주세요 (최대 500자)"
                          oninput="document.getElementById('cnt').innerText=this.value.length"></textarea>
                <div class="text-end text-muted small mt-1"><span id="cnt">0</span> / 500</div>
            </div>
            <div class="d-flex gap-2">
                <button type="button" class="btn btn-outline-secondary w-50"
                        onclick="location.href='auctionDetail.jsp?auctionId=<%= auctionId %>'">취소</button>
                <button type="submit" class="btn btn-danger w-50">신고 제출</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
