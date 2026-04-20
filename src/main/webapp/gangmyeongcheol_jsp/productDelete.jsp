<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 삭제</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background-color: #f0f7ff; }
    .navbar { background: white; border-bottom: 1px solid #e3f2fd; }
    .navbar-brand { color: #1565c0 !important; font-weight: 900; font-size: 20px; }
    .nav-link { color: #444 !important; font-size: 14px; font-weight: 500; }
    .nav-link:hover { color: #1565c0 !important; }
    .delete-card { border: none; border-radius: 14px; box-shadow: 0 4px 16px rgba(21,101,192,0.1); max-width: 480px; margin: 60px auto; padding: 40px; }
    .icon-circle { width: 56px; height: 56px; border-radius: 50%; background-color: #ffebee; color: #c62828; font-size: 26px; font-weight: bold; display: flex; align-items: center; justify-content: center; margin: 0 auto 20px; }
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">🎌 FigureAuction</a>
        <div class="d-flex gap-3 ms-4">
            <a href="main.jsp" class="nav-link">경매</a>
            <a href="productList.jsp" class="nav-link">컬렉션</a>
            <a href="productMyList.jsp" class="nav-link active">내 상품</a>
        </div>
    </div>
</nav>

<div class="container">
    <div class="card delete-card text-center">
        <div class="icon-circle">!</div>
        <h5 class="fw-bold mb-3">상품을 삭제하시겠습니까?</h5>
        <div class="alert alert-danger text-start small">
            삭제된 상품 정보는 <strong>복구가 불가능</strong>합니다.<br>
            현재 경매 진행 중인 상품인 경우, 취소 시 <strong>보증금 몰수 등의 패널티</strong>가 발생할 수 있습니다.
        </div>
        <div class="border rounded p-3 mb-4 text-start bg-light">
            <p class="fw-bold mb-1">하츠네 미쿠 1/7 스케일 피규어</p>
            <p class="text-muted small mb-0">등록일: 2026-04-10</p>
        </div>
        <form action="product_delete_act.do" method="post">
            <input type="hidden" name="productId" value="P001">
            <div class="d-flex gap-2">
                <button type="button" class="btn btn-outline-secondary w-50" onclick="location.href='productDetail.jsp?productId=P001'">취소</button>
                <button type="submit" class="btn btn-danger w-50">삭제하기</button>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
