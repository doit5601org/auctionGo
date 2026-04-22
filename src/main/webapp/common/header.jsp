<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
	<style>
/* 메뉴 호버 효과 */
.hover-primary:hover {
    color: #120e63 !important;
    text-decoration: underline;
    text-underline-offset: 8px;
}
/* 드롭다운 메뉴 위치 조정 */
.dropdown-menu {
    margin-top: 10px !important;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}
.btn-primary{
	background-color: #120e63 !important;
	border-color: #120e63 !important;
}
.page-link{
	color: #120e63 !important;
}
.page-item.active .page-link{
	background-color: #120e63 !important;
	color: #fff !important;
	border-color: #120e63 !important;
} 

.bgColor{background-color: #120e63;}
.txtColor{color: #120e63;}

.btn-outline-primary{
	color: #120e63 !important;
	border-color: #120e63 !important;
}
.btn-outline-primary:hover {
background-color: #120e63 !important;
color: #fff !important;
}


</style>
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom sticky-top py-3">
    <div class="container-fluid px-lg-5">
    	<h1>
	        <a class="navbar-brand fw-bold text-secondary fs-3" href="${pageContext.request.contextPath}/common/main.jsp">
				<img src="${pageContext.request.contextPath}/images/logo.png" alt="로고이미지" style="width: 200px;" />
	        </a>
    	</h1>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                <li class="nav-item px-3">
                    <a class="nav-link text-dark fw-bold fs-5 hover-primary" href="${pageContext.request.contextPath}/gangmyeongcheol_jsp/productList.jsp">컬렉션</a>
                </li>
                <li class="nav-item px-3">
                    <a class="nav-link text-dark fw-bold fs-5 hover-primary" href="${pageContext.request.contextPath}/gangmyeongcheol_jsp/auctionList.jsp">경매</a>
                </li>
            </ul>

            <div class="d-flex align-items-center justify-content-end" style="flex-basis: 70%; min-width: 800px;">
                
<!--                 <form action="productSearch.do" method="get" class="flex-grow-1 me-4" style="max-width: 700px;">
                    <div class="input-group input-group-lg"> 
                    	<select class="form-select border-secondary-subtle" style=" width: 150px; flex: none; font-size: 1rem;">
                            <option value="name" selected>상품명 검색</option>
                            <option value="brand">제조사 검색</option>
                            <option value="user">판매자 검색</option>
                        </select>
                        <input class="form-control border-secondary-subtle" type="search" placeholder="검색어를 입력하세요." aria-label="Search">
                        <button class="btn btn-dark px-4" type="submit">
                             검색
                        </button>
                    </div>
                </form> -->

                <ul class="navbar-nav align-items-center flex-row" style="gap: 20px; flex-shrink: 0;">
                    <%-- <c:choose>
                        <c:when test="${empty sessionScope.loginUser}">--%>
                            <li class="nav-item">
                                <a class="nav-link text-dark fw-semibold" href="${pageContext.request.contextPath}/user/auth/login.jsp">로그인</a>
                            </li>
                            <li class="nav-item">
                                <a class="btn btn-outline-dark px-3" href="${pageContext.request.contextPath}/user/auth/signUp.jsp">회원가입</a>
                            </li>
                         <%-- </c:when>
                        <c:otherwise> --%>
                            <li class="nav-item text-end border-end pe-3">
                                <div class="d-flex flex-column" style="line-height: 1.2;">
                                    <span class="text-muted" style="font-size: 0.75rem;">보유머니</span>
                                    <span class="txtColor fw-bold fs-5">50,000<small class="text-dark fw-normal ms-1" style="font-size: 0.9rem;">원</small></span>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="btn btn-primary btn-sm px-3 py-2 rounded-pill fw-bold">충전</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle fw-bold ms-2 fs-6" href="#" id="userDropdown" role="button">
                                    마이페이지
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end shadow border-0" id="userDropdownMenu">
                                    <li><a class="dropdown-item py-2" href="${pageContext.request.contextPath}/user/my/mypage.jsp">내 활동 현황</a></li>
                                    <li><a class="dropdown-item py-2" href="${pageContext.request.contextPath}/user/my/info/changeInfo.jsp">정보 수정</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item py-2 text-danger" href="logout.do">로그아웃</a></li>
                                </ul>
                            </li>
               <%--          </c:otherwise>
                    </c:choose> --%>
                </ul>
            </div>
        </div>
    </div>
</nav>

<script>
$(function() {
    // 1. 드롭다운 버튼 클릭 이벤트
    $(document).on('click', '#userDropdown', function(e) {
        e.preventDefault();
        e.stopPropagation(); // 이벤트 전파 방지

        const $menu = $('#userDropdownMenu');
        
        // 클래스를 직접 넣었다 빼서 제어 (가장 확실한 방법)
        if ($menu.hasClass('show')) {
            $menu.removeClass('show');
            $(this).attr('aria-expanded', 'false');
        } else {
            // 다른 열려있을지 모르는 드롭다운들 닫기
            $('.dropdown-menu.show').removeClass('show');
            $menu.addClass('show');
            $(this).attr('aria-expanded', 'true');
        }
    });

    // 2. 메뉴 바깥쪽 클릭 시 드롭다운 닫기
    $(document).on('click', function(e) {
        if (!$(e.target).closest('.dropdown').length) {
            $('.dropdown-menu.show').removeClass('show');
            $('.dropdown-toggle').attr('aria-expanded', 'false');
        }
    });
});
</script>

</body>
</html>