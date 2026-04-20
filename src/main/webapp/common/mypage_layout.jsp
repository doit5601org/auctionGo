<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">    
</head>
<body>

<%--  <div class="list-group shadow-sm">
    <div class="list-group-item bg-dark text-white fw-bold py-3">마이페이지</div>
    <a href="${pageContext.request.contextPath }/user/my/mypage.jsp" class="list-group-item list-group-item-action active">나의 활동 요약</a>
    <a href="${pageContext.request.contextPath }/user/product/myProduct.jsp" class="list-group-item list-group-item-action">내 등록 상품</a>
    <a href="myBids.do" class="list-group-item list-group-item-action">내 경매 내역</a>
    <a href="myBids.do" class="list-group-item list-group-item-action">내 입찰 내역</a>
    <a href="myBids.do" class="list-group-item list-group-item-action">내 낙찰 내역</a>
    <a href="myBids.do" class="list-group-item list-group-item-action">내 신고 내역</a>
    <a href="wishlist.do" class="list-group-item list-group-item-action">관심 상품</a>
    <a href="wishlist.do" class="list-group-item list-group-item-action">비밀번호 변경</a>
    <a href="editProfile.do" class="list-group-item list-group-item-action">개인정보 수정</a>
    <a href="deleteAccount.do" class="list-group-item list-group-item-action text-danger">회원 탈퇴</a>
</div> --%>

<div class="list-group shadow-sm mb-4">
    <a href="${pageContext.request.contextPath }/user/my/mypage.jsp" class="list-group-item list-group-item-action fw-bold border-0 py-3 bg-light">
        <i class="bi bi-person-badge me-2"></i>나의 활동 요약
    </a>
    <a href="${pageContext.request.contextPath }/user/product/myProduct.jsp" class="list-group-item list-group-item-action border-0 py-3">
        <i class="bi bi-box-seam me-2"></i>내 등록 상품
    </a>
    
    <div class="list-group-item border-0 p-0">
        <a href="#auctionSubmenu" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center py-3 border-0" 
        data-bs-toggle="collapse">
            <span><i class="bi bi-hammer me-2"></i>내 경매 내역</span>
            <i class="bi bi-chevron-down small text-muted"></i>
        </a>
        <div class="collapse" id="auctionSubmenu">
            <a href="${pageContext.request.contextPath }/user/auctions/auctionStatus.jsp" class="list-group-item list-group-item-action ps-5 py-2 border-0 small text-primary">• 경매 현황</a>
            <a href="${pageContext.request.contextPath }/user/auctions/auctionHistory.jsp" class="list-group-item list-group-item-action ps-5 py-2 border-0 small">• 경매 이력</a>
        </div>
    </div>

    <div class="list-group-item border-0 p-0">
        <a href="#bidSubmenu" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center py-3 border-0"
         data-bs-toggle="collapse">
            <span><i class="bi bi-currency-exchange me-2"></i>내 입찰 내역</span>
            <i class="bi bi-chevron-down small text-muted"></i>
        </a>
        <div class="collapse" id="bidSubmenu">
            <a href="${pageContext.request.contextPath }/user/bids/bidStatus.jsp" class="list-group-item list-group-item-action ps-5 py-2 border-0 small">• 입찰 현황</a>
            <a href="${pageContext.request.contextPath }/user/bids/bidHistory.jsp" class="list-group-item list-group-item-action ps-5 py-2 border-0 small">• 입찰 이력</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>