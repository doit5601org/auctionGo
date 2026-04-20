<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</html>