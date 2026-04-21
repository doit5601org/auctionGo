<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지 - Auction PKG</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
   	<style type="text/css">
		body { display: flex; flex-direction: column; min-height: 100vh; margin: 0; }
		.container { flex: 1; }
		
		/* 대시보드 카드 스타일 */
		.stat-card {
			transition: all 0.3s ease;
			cursor: pointer;
			border: 1px solid #eee;
			border-radius: 15px;
		}
		.stat-card:hover {
			transform: translateY(-5px);
			box-shadow: 0 10px 20px rgba(0,0,0,0.08) !important;
			border-color: #0d6efd;
		}
		.icon-box {
			width: 50px; height: 50px;
			display: flex; align-items: center; justify-content: center;
			border-radius: 12px; margin-bottom: 15px;
		}
   	</style>
</head>
<body class="bg-light">

	<jsp:include page="/common/header.jsp" />

	<main class="container" style="margin-top: 50px; margin-bottom: 50px;">
		<div class="row">
			<aside class="col-md-3">
				<jsp:include page="/common/mypage_layout.jsp" />
			</aside>
			
			<section class="col-md-9">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<div>
						<h3 class="fw-bold mb-1">반갑습니다, 사용자 님!</h3>
					</div>
					<a href="${pageContext.request.contextPath}/user/my/info/changeInfo.jsp" class="btn btn-outline-secondary btn-sm rounded-pill">정보 수정</a>
				</div>

				<div class="row g-3 mb-4">
					<div class="col-md-4" onclick="location.href='${pageContext.request.contextPath}/user/auctions/auctionStatus.jsp'">
						<div class="card stat-card shadow-sm p-3 bg-white text-center">
							<div class="icon-box bg-primary-subtle text-primary mx-auto">
								<i class="bi bi-hammer fs-4"></i>
							</div>
							<small class="text-muted fw-semibold">진행중인 경매</small>
							<h4 class="mt-1 fw-bold">5<span class="fs-6 fw-normal ms-1">건</span></h4>
						</div>
					</div>
					<div class="col-md-4" onclick="location.href='${pageContext.request.contextPath}/user/bids/bidStatus.jsp'">
						<div class="card stat-card shadow-sm p-3 bg-white text-center">
							<div class="icon-box bg-success-subtle text-success mx-auto">
								<i class="bi bi-clock-history fs-4"></i>
							</div>
							<small class="text-muted fw-semibold">진행중인 입찰</small>
							<h4 class="mt-1 fw-bold">3<span class="fs-6 fw-normal ms-1">건</span></h4>
						</div>
					</div>
					<div class="col-md-4" onclick="location.href='${pageContext.request.contextPath}/user/product/wishlist.jsp'">
						<div class="card stat-card shadow-sm p-3 bg-white text-center">
							<div class="icon-box bg-danger-subtle text-danger mx-auto">
								<i class="bi bi-heart-fill fs-4"></i>
							</div>
							<small class="text-muted fw-semibold">내 관심 상품</small>
							<h4 class="mt-1 fw-bold">12<span class="fs-6 fw-normal ms-1">건</span></h4>
						</div>
					</div>
				</div>

				<div class="row g-3">
					<div class="col-md-6" onclick="location.href='${pageContext.request.contextPath}/'">
						<div class="card stat-card shadow-sm p-4 bg-white border-start border-4 border-primary">
							<div class="d-flex justify-content-between align-items-center">
								<div>
									<small class="text-muted d-block mb-1">사용 가능한 보유머니</small>
									<h3 class="fw-bold text-primary mb-0">50,000원</h3>
								</div>
								<div class="btn btn-primary rounded-pill px-3">충전</div>
							</div>
						</div>
					</div>
					<div class="col-md-6" onclick="location.href='${pageContext.request.contextPath}/user/my/penaltyHistory.jsp'">
						<div class="card stat-card shadow-sm p-4 bg-white border-start border-4 border-danger">
							<div class="d-flex justify-content-between align-items-center">
								<div>
									<small class="text-muted d-block mb-1">나의 패널티 점수</small>
									<h3 class="fw-bold text-danger mb-0">1점</h3>
								</div>
								<div class="text-muted small">이력 확인 <i class="bi bi-chevron-right"></i></div>
							</div>
						</div>
					</div>
				</div>

				<!-- <div class="mt-5 p-4 bg-white border rounded-4 shadow-sm">
					<h5 class="fw-bold mb-3">알림 센터</h5>
					<div class="d-flex align-items-start mb-3 border-bottom pb-2">
						<div class="badge bg-info me-3">입찰</div>
						<div class="flex-grow-1">
							<div class="small fw-bold">도라에몽 피규어 세트</div>
							<div class="text-muted x-small" style="font-size: 0.8rem;">새로운 상위 입찰자가 나타났습니다. (10분 전)</div>
						</div>
					</div>
					<div class="d-flex align-items-start">
						<div class="badge bg-warning text-dark me-3">마감</div>
						<div class="flex-grow-1">
							<div class="small fw-bold">레고 스타워즈 경매 마감 임박</div>
							<div class="text-muted x-small" style="font-size: 0.8rem;">관심 상품의 경매 종료가 1시간 남았습니다. (30분 전)</div>
						</div>
					</div>
				</div> -->
			</section>
		</div>
	</main>

	<jsp:include page="/common/footer.jsp" />
</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지 - Auction PKG</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
   	<style type="text/css">
   		/* 페이지 전체를 flex 박스로 만듭니다 */
		body {
		    display: flex;
		    flex-direction: column;
		    min-height: 100vh; /* 화면 높이의 100%를 최소 높이로 설정 */
		    margin: 0;
		}
		
		/* 메인 콘텐츠 영역이 남는 공간을 모두 차지하게 합니다 */
		main.container, .container {
		    flex: 1;
		}
		
		/* 푸터는 자연스럽게 맨 아래로 밀려납니다 */
		footer {
		    flex-shrink: 0;
		}
   	</style>
    
    </head>
<body class="bg-light">

	<jsp:include page="/common/header.jsp" />

	<main class="container" style="margin-top: 50px; margin-bottom: 50px;">
		<div class="row">
			<aside class="col-md-3">
				<jsp:include page="/common/mypage_layout.jsp" />
			</aside>
			<section class="col-md-9">
				<div class="card shadow-sm p-4 bg-white">
					<h3 class="mb-4">나의 활동 요약</h3>

					<div class="row g-3">
						<div class="col-md-4">
							<div class="p-3 border rounded text-center">
								<small class="text-muted">진행중인 경매</small>
								<h4 class="mt-2 fw-bold">
									<span>5</span>건
								</h4>
							</div>
						</div>
						<div class="col-md-4">
							<div class="p-3 border rounded text-center">
								<small class="text-muted">진행중인 입찰</small>
								<h4 class="mt-2 fw-bold">
									<span>3</span>건
								</h4>
							</div>
						</div>
						<div class="col-md-4">
							<div class="p-3 border rounded text-center">
								<small class="text-muted">내 관심 상품</small>
								<h4 class="mt-2 fw-bold">
									<span>12</span>건
								</h4>
							</div>
						</div>
					</div>

					<div class="mt-5">
						<div class="row g-2">
							<div class="col-md-6">
								<div class="p-3 border rounded text-center">
									<small class="text-muted">보유머니</small>
									<h4 class="mt-2 fw-bold">
										<span>50,000</span>원
									</h4>
								</div>
							</div>
							<div class="col-md-6">
								<div class="p-3 border rounded text-center">
									<small class="text-muted">패널티 점수</small>
									<h4 class="mt-2 fw-bold">
										<span>1</span>점
									</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

		</div>
	</main>

	<jsp:include page="/common/footer.jsp" />
</body>
</html> --%>