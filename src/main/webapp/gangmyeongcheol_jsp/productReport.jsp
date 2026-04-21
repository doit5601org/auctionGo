<%@ page contentType="text/html; charset=UTF-8"%>
<%--
    [DB연결 후 상단에 추가]
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 신고</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background-color: #f0f7ff; }
    .navbar { background: white; border-bottom: 1px solid #e3f2fd; }
    .navbar-brand { color: #1565c0 !important; font-weight: 900; font-size: 20px; }
    .nav-link { color: #444 !important; font-size: 14px; font-weight: 500; }
    .nav-link:hover { color: #1565c0 !important; }
    .page-header { background-color: #1565c0; color: white; padding: 18px 24px; border-radius: 10px; margin-bottom: 24px; }
    .card { border: none; border-radius: 10px; box-shadow: 0 2px 8px rgba(21,101,192,0.08); }
</style>
</head>
<body>

<%-- [DB연결 후] href를 ${ctx}/main, ${ctx}/product/list, ${ctx}/product/myList 로 변경 --%>
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">FigureAuction</a>
        <div class="d-flex gap-3 ms-4">
            <a href="main.jsp" class="nav-link">경매</a>
            <a href="productList.jsp" class="nav-link">컬렉션</a>
            <a href="productMyList.jsp" class="nav-link">내 상품</a>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5" style="max-width:600px">
    <div class="page-header">
        <h5 class="mb-0 fw-bold">상품 신고</h5>
    </div>

    <div class="card p-4">

        <%-- [DB연결 후] ${product.productName}, ${product.makerName}, ${product.grade} 로 교체 --%>
        <div class="d-flex align-items-center gap-3 p-3 rounded mb-4" style="background-color:#e3f2fd">
            <img src="https://placehold.co/56x56/e3f2fd/1565c0?text=Miku"
                 style="width:56px;height:56px;object-fit:cover;border-radius:8px;border:1px solid #90caf9" alt="">
            <div>
                <p class="fw-bold mb-0">하츠네 미쿠 1/7 스케일 피규어</p>
                <p class="text-muted small mb-0">굿스마일컴퍼니 · S급</p>
            </div>
        </div>

        <div class="alert alert-warning small">
            <strong>유의사항</strong><br>
            허위 신고 시 본인에게 패널티가 부여될 수 있습니다.<br>
            신고 내용은 관리자가 검토 후 처리 결과를 알려드립니다.
        </div>

        <%-- [DB연결 후] form action="${ctx}/product/report" --%>
        <form action="producutReport.jsp" method="post">
            <%-- [DB연결 후] value="${product.productId}" --%>
            <input type="hidden" name="productId" value="P001">

            <div class="mb-3">
                <label class="form-label fw-bold">신고 유형 <span class="text-danger">*</span></label>
                <%--
                    [DB연결 후] 옵션을 c:forEach로 교체
                    <c:forEach var="t" items="${reportTypeList}">
                        <option value="${t.typeId}">${t.typeName}</option>
                    </c:forEach>
                --%>
                <select name="reportTypeId" class="form-select" required>
                    <option value="">선택하세요</option>
                    <option value="1">허위 상품 정보</option>
                    <option value="2">직거래 유도</option>
                    <option value="3">사기 의심</option>
                    <option value="4">부적절한 이미지</option>
                    <option value="5">기타</option>
                </select>
            </div>

            <div class="mb-4">
                <label class="form-label fw-bold">신고 사유 <span class="text-danger">*</span></label>
                <textarea name="reportContent" class="form-control" rows="5" maxlength="500"
                          placeholder="신고 사유를 상세히 입력해주세요 (최대 500자)"
                          oninput="document.getElementById('cnt').innerText=this.value.length"></textarea>
                <div class="text-end text-muted small mt-1"><span id="cnt">0</span> / 500</div>
            </div>

            <div class="d-flex gap-2">
                <%-- [DB연결 후] href="${ctx}/product/detail?productId=${product.productId}" --%>
                <button type="button" class="btn btn-outline-secondary w-50" onclick="location.href='productDetail.jsp?productId=P001'">취소</button>
                <button type="submit" class="btn btn-danger w-50">신고 제출</button>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
