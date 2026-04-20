<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
<%-- 	<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom sticky-top">
		<div class="container">
			<a class="navbar-brand fw-bold text-secondary" href="${pageContext.request.contextPath }/common/main.jsp">
				경매나라
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<form action="productSearch.do" method="get" class="d-flex mx-auto col-lg-5 my-2 my-lg-0" >
					<div class="input-group">
						<input class="form-control" type="search" placeholder="상품명, 작품명으로 검색" aria-label="Search">
						<button class="btn btn-outline-secondary" type="submit">
							<i class="bi bi-search"> 검색 </i>
						</button>
					</div>
				</form>

				<ul class="navbar-nav ms-auto align-items-center">
					로그인 상태에 따른 분기 처리 (JSTL 사용 권장)
					 <%
					if (session.getAttribute("userId") == null) {
					%>
					<li class="nav-item">
						<a class="nav-link text-dark" href="${pageContext.request.contextPath}/user/auth/login.jsp">로그인</a>
					</li>
					<li class="nav-item ms-2">
						<a class="btn btn-secondary btn-sm px-3" href="${pageContext.request.contextPath}/user/auth/signUp.jsp">회원가입</a>
					</li>
					<%
					} else {
					%>
					<li class="nav-item me-3">
						보유머니
						<span class="badge bg-light text-primary border p-2">
							<i class="bi bi-coin text-warning"></i> 
							<span>50,000</span>원
						</span>
					</li>
					<li>
						<a href="#" class="btn btn-primary">충전</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="wishlist.do">
							<i class="bi bi-heart"></i>
						</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown"> 
							마이페이지 
						</a>
						<ul class="dropdown-menu dropdown-menu-end">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/my/mypage.jsp">내 활동 현황</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/my/info/changeInfo.jsp">정보 수정</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item text-danger" href="logout.do">로그아웃</a></li>
						</ul></li>
					<%
					}
					%> 
				</ul>
			</div>
		</div>
	</nav>
 --%>

<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom sticky-top">
    <div class="container">
        <a class="navbar-brand fw-bold text-secondary" href="${pageContext.request.contextPath}/common/main.jsp">
            경매나라
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <form action="productSearch.do" method="get" class="d-flex mx-auto col-lg-5 my-2 my-lg-0">
                <div class="input-group">
                    <input class="form-control" type="search" placeholder="상품명, 작품명으로 검색" aria-label="Search">
                    <button class="btn btn-outline-secondary" type="submit">
                        <i class="bi bi-search"></i> 검색
                    </button>
                </div>
            </form>

            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item">
                    <a class="nav-link text-dark" href="${pageContext.request.contextPath}/user/auth/login.jsp">로그인</a>
                </li>
                <li class="nav-item ms-2">
                    <a class="btn btn-secondary btn-sm px-3" href="${pageContext.request.contextPath}/user/auth/signUp.jsp">회원가입</a>
                </li>

                <li class="nav-item me-3">
                    보유머니
                    <span class="badge bg-light text-primary border p-2">
                        <i class="bi bi-coin text-warning"></i> 
                        <span>50,000</span>원
                    </span>
                </li>
                <li class="me-2">
                    <a href="#" class="btn btn-primary btn-sm">충전</a>
                </li>
                <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"> 
        마이페이지 
    </a>
    <ul class="dropdown-menu dropdown-menu-end" id="userDropdownMenu">
        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/my/mypage.jsp">내 활동 현황</a></li>
        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/my/info/changeInfo.jsp">정보 수정</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item text-danger" href="logout.do">로그아웃</a></li>
    </ul>
</li>
            </ul>
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