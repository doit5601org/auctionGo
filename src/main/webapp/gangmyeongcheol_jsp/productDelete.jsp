<%@ page contentType="text/html; charset=UTF-8"%>
<%
    String productId = request.getParameter("productId");
    if (productId == null) productId = "P001";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 삭제</title>
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
            <a href="productMyList.jsp" class="nav-link active">내 상품</a>
        </div>
    </div>
</nav>

<div class="container mt-5" style="max-width:480px">
    <div class="card p-4 text-center">
        <div class="fs-1 mb-3">⚠️</div>
        <h5 class="fw-bold mb-3">상품을 삭제하시겠습니까?</h5>
        <div class="alert alert-danger text-start small">
            삭제된 상품 정보는 <strong>복구가 불가능</strong>합니다.<br>
            현재 경매 진행 중인 상품인 경우, 취소 시 <strong>보증금 몰수 등의 패널티</strong>가 발생할 수 있습니다.
        </div>
        <form action="product_delete_act.do" method="post">
            <input type="hidden" name="productId" value="<%= productId %>">
            <div class="d-flex gap-2">
                <button type="button" class="btn btn-outline-secondary w-50"
                        onclick="location.href='productDetail.jsp?productId=<%= productId %>'">취소</button>
                <button type="button" class="btn btn-danger w-50" onclick="confirmDelete()">삭제하기</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script>
// 삭제 전 2차 확인 팝업
function confirmDelete() {
    if (confirm("정말 삭제하시겠습니까?\n삭제된 상품은 복구가 불가능합니다.")) {
        document.querySelector("form").submit();
    }
}
</script>
</body>
</html>
