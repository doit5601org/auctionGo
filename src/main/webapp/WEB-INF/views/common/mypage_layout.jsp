<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">    
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script>
$(function() {
    const currentPath = window.location.pathname;
    const $sidebar = $('#mypage-sidebar');

    // 1. 초기 로드 시 활성화
    function init() {
        $sidebar.find('.list-group-item').removeClass('active');
        $sidebar.find('a.list-group-item').each(function() {
            const href = $(this).attr('href');
            if (href && currentPath === href) {
                $(this).addClass('active');
                const $sub = $(this).closest('.submenu-list');
                if ($sub.length) {
                    $sub.addClass('show');
                    $sidebar.find(`a[href="#${$sub.attr('id')}"]`).addClass('active').removeClass('collapsed');
                }
            }
        });
    }
    init();

    // 2. 대메뉴 클릭 (스타일 초기화 + 자기 활성화 + 아코디언)
    $sidebar.on('click', '.main-menu', function(e) {
        e.preventDefault();
        const targetId = $(this).attr('href');
        const $target = $(targetId);

        // 전체 active 제거
        $sidebar.find('.list-group-item').removeClass('active');
        
        // 클릭한 대메뉴 active
        $(this).addClass('active');

        // 아코디언 동작: 다른 거 닫고 내 거 열기
        $('.submenu-list').not($target).collapse('hide');
        $('.main-menu').not(this).addClass('collapsed');
        
        $target.collapse('toggle');
        $(this).toggleClass('collapsed');
    });

    // 3. 단일 메뉴 클릭 (전체 초기화 + 자기 활성화)
    $sidebar.on('click', '.menu-link', function() {
        $sidebar.find('.list-group-item').removeClass('active');
        $(this).addClass('active');
        $('.submenu-list').collapse('hide');
        $('.main-menu').addClass('collapsed');
    });

    // 4. 소메뉴 클릭 (전체 초기화 -> 소메뉴 활성화 + 부모 대메뉴 활성화)
    $sidebar.on('click', '.submenu-list a', function() {
        $sidebar.find('.list-group-item').removeClass('active');
        $(this).addClass('active');
        
        const $parentSub = $(this).closest('.submenu-list');
        $sidebar.find(`a[href="#${$parentSub.attr('id')}"]`).addClass('active');
    });
});
</script>
<style>
    /* 1. 기본 스타일: 모든 메뉴에서 보더 제거 및 부드러운 전환 */
    #mypage-sidebar .list-group-item {
        border: none !important;
        transition: all 0.2s;
        cursor: pointer;
    }

    /* 2. 대메뉴 및 단일 메뉴 활성화 스타일 (배경색 + 왼쪽 바) */
    #mypage-sidebar .main-menu.active, 
    #mypage-sidebar .menu-link.active {
        background-color: #e7f1ff !important;
        color: #120e63 !important;
        border-left: 5px solid #120e63 !important; /* 왼쪽 강조 바 */
        font-weight: bold !important;
    }

    /* 3. 소메뉴 기본 스타일 */
    #mypage-sidebar .submenu-list .list-group-item {
        padding-left: 3rem !important; /* 대메뉴보다 들여쓰기 */
        color: #666;
    }

    /* 4. 소메뉴 활성화 스타일 (왼쪽 바 추가) */
    #mypage-sidebar .submenu-list .list-group-item.active {
        color: #120e63 !important;
        font-weight: bold !important;
        background-color: #f8f9fa !important; /* 소메뉴는 아주 연한 회색 배경 */
        border-left: 5px solid #120e63 !important; /* 소메뉴에도 왼쪽 바 적용! */
        text-decoration: none !important; /* 밑줄 대신 선으로 강조 */
    }

    /* 화살표 애니메이션 */
    .arrow-icon { transition: transform 0.3s; }
    .main-menu:not(.collapsed) .arrow-icon { transform: rotate(180deg); }
</style>

</head>
<body>
<div class="list-group shadow-sm mb-4" id="mypage-sidebar">
    <a href="${pageContext.request.contextPath}/user/my/mypage.jsp" class="list-group-item list-group-item-action py-3 menu-link">
        <i class="bi bi-person-badge me-2"></i>나의 활동 요약
    </a>
    <a href="${pageContext.request.contextPath}/user/product/myProduct.jsp" class="list-group-item list-group-item-action py-3 menu-link">
        <i class="bi bi-box-seam me-2"></i>내 등록 상품
    </a>

    <div class="list-group-item p-0 border-0">
        <a href="#auctionSubmenu" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center py-3 main-menu collapsed">
            <span><i class="bi bi-hammer me-2"></i>내 경매 내역</span>
            <i class="bi bi-chevron-down small text-muted arrow-icon"></i>
        </a>
        <div class="collapse submenu-list" id="auctionSubmenu">
            <a href="${pageContext.request.contextPath}/user/auctions/auctionStatus.jsp" class="list-group-item list-group-item-action py-2 ps-5">• 경매 현황</a>
            <a href="${pageContext.request.contextPath}/user/auctions/auctionHistory.jsp" class="list-group-item list-group-item-action py-2 ps-5">• 경매 이력</a>
        </div>
    </div>

    <div class="list-group-item p-0 border-0">
        <a href="#bidSubmenu" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center py-3 main-menu collapsed">
            <span><i class="bi bi-currency-exchange me-2"></i>내 입찰 내역</span>
            <i class="bi bi-chevron-down small text-muted arrow-icon"></i>
        </a>
        <div class="collapse submenu-list" id="bidSubmenu">
            <a href="${pageContext.request.contextPath}/user/bids/bidStatus.jsp" class="list-group-item list-group-item-action py-2 ps-5">• 입찰 현황</a>
            <a href="${pageContext.request.contextPath}/user/bids/bidHistory.jsp" class="list-group-item list-group-item-action py-2 ps-5">• 입찰 이력</a>
        </div>
    </div>
     <a href="${pageContext.request.contextPath}/user/product/wishlist.jsp" class="list-group-item list-group-item-action py-3 menu-link">
        <i class="bi bi-heart-fill me-2"></i>내 관심 상품</a>
    <a href="${pageContext.request.contextPath}/user/my/penaltyHistory.jsp" class="list-group-item list-group-item-action py-3 menu-link">
        <i class="bi bi-exclamation-octagon me-2"></i>내 패널티 내역
    </a>

    <div class="list-group-item p-0 border-0">
        <a href="#infoSubmenu" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center py-3 main-menu collapsed">
            <span><i class="bi bi-gear me-2"></i>내 정보 관리</span>
            <i class="bi bi-chevron-down small text-muted arrow-icon"></i>
        </a>
        <div class="collapse submenu-list" id="infoSubmenu">
            <a href="${pageContext.request.contextPath}/user/my/info/changeInfo.jsp" class="list-group-item list-group-item-action py-2 ps-5">• 회원 정보 변경</a>
            <a href="${pageContext.request.contextPath}/user/my/info/changePwd.jsp" class="list-group-item list-group-item-action py-2 ps-5">• 비밀번호 변경</a>
            <a href="${pageContext.request.contextPath}/user/my/withdraw.jsp" class="list-group-item list-group-item-action py-2 ps-5">• 회원 탈퇴</a>
        </div>
    </div>
</div>

</body>
</html>