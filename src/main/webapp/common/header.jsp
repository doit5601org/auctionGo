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
	<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom sticky-top">
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
					<%-- 로그인 상태에 따른 분기 처리 (JSTL 사용 권장) --%>
					<%--  <%
					if (session.getAttribute("userId") == null) {
					%>
					<li class="nav-item">
						<a class="nav-link text-dark" href="${pageContext.request.contextPath}/user/auth/login.jsp">로그인</a>
					</li>
					<li class="nav-item ms-2">
						<a class="btn btn-secondary btn-sm px-3" href="${pageContext.request.contextPath}/user/auth/sign-up.jsp">회원가입</a>
					</li>
					<%
					} else {
					%> --%>
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
						<a class="nav-link dropdown-toggle" href="#" id="userDropdown"role="button" data-bs-toggle="dropdown"> 
							마이페이지 
						</a>
						<ul class="dropdown-menu dropdown-menu-end">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/my/mypage.jsp">내 활동 현황</a></li>
							<li><a class="dropdown-item" href="profileEdit.do">정보 수정</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item text-danger" href="logout.do">로그아웃</a></li>
						</ul></li>
			<%-- 		<%
					}
					%>  --%>
				</ul>
			</div>
		</div>
	</nav>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>

</body>
</html>