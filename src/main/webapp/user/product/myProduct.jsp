<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>

</head>
<body class="bg-light">
<jsp:include page="/common/header.jsp"></jsp:include>
	<main class="container" style="margin-top: 50px; margin-bottom: 50px;">
		<div class="row">
			<aside class="col-md-3">
				<jsp:include page="/common/mypage_layout.jsp" />
			</aside>
			<section class="col-md-9">
				<div class="card shadow-sm border-0 bg-white">
					<div
						class="card-header bg-white py-3 d-flex justify-content-between align-items-center border-bottom">
						<h5 class="mb-0 fw-bold">
							내 등록 상품 <span class="text-primary small">45</span>
						</h5>
						<button class="btn btn-primary btn-sm px-3"
							onclick="location.href='/product/register'">
							<i class="bi bi-plus-lg"></i> 새 상품 등록
						</button>
					</div>
					<div class="card-body">
						<ul class="nav nav-tabs mb-4" id="productTab" role="tablist">
							<li class="nav-item"><button class="nav-link active"
									data-bs-toggle="tab" id="tab-all" data-type="ALL">전체</button></li>
							<li class="nav-item"><button class="nav-link"
									data-bs-toggle="tab" id="tab-public" data-type="PUBLIC">공개</button></li>
							<li class="nav-item"><button class="nav-link"
									data-bs-toggle="tab" id="tab-private" data-type="PRIVATE">비공개</button></li>
						</ul>

						<div class="table-responsive">
							<table class="table align-middle">
								<thead class="table-light">
									<tr class="text-center">
										<th style="width: 5%">번호</th>
										<th style="width: 12%">이미지</th>
										<th style="width: 33%" class="text-start ps-4">상품 정보</th>
										<th style="width: 15%">상태</th>
										<th style="width: 15%">등록일</th>
										<th style="width: 20%">관리</th>
									</tr>
								</thead>
								<tbody id="product-list-body">
									<!-- <tr>
                    		<td class="text-center" colspan="6">등록된 상품이 존재하지 않습니다.</td>
                    	</tr> -->

									<tr>
										<td class="text-center">10</td>
										<td class="text-center"><img
											src="https://picsum.photos/id/1/60/60"
											class="rounded shadow-sm" alt="상품"></td>
										<td class="ps-4">
											<div class="fw-bold">
												<a href="/product/detail?product_id=101"
													class="text-decoration-none text-dark link-primary">아이언맨
													마크 85 피규어</a>
											</div>
										</td>
										<td class="text-center"><span
											class="badge bg-success-subtle text-success border border-success px-3">공개</span></td>
										<td class="text-center text-muted small">2026-04-20</td>
										<td class="text-center">
											<div class="d-flex gap-1 justify-content-center">
												<button class="btn btn-outline-secondary btn-sm">수정</button>
												<button class="btn btn-outline-primary btn-sm fw-bold">경매
													등록</button>
											</div>
										</td>
									</tr>

									<tr>
										<td class="text-center">9</td>
										<td class="text-center"><img
											src="https://picsum.photos/id/2/60/60"
											class="rounded shadow-sm" alt="상품"></td>
										<td class="ps-4">
											<div class="fw-bold">
												<a href="/product/detail?product_id=102"
													class="text-decoration-none text-dark link-primary">도라에몽
													한정판 세트</a>
											</div>
										</td>
										<td class="text-center"><span
											class="badge bg-secondary-subtle text-secondary border border-secondary px-3">비공개</span></td>
										<td class="text-center text-muted small">2026-04-19</td>
										<td class="text-center">
											<div class="d-flex gap-1 justify-content-center">
												<button class="btn btn-outline-secondary btn-sm">수정</button>
												<button class="btn btn-light btn-sm text-primary border">공개
													전환</button>
											</div>
										</td>
									</tr>

									<tr>
										<td class="text-center">8</td>
										<td class="text-center"><img
											src="https://picsum.photos/id/3/60/60" class="rounded"
											alt="상품"></td>
										<td class="ps-4">
											<div class="fw-bold">
												<a href="#"
													class="text-decoration-none text-dark link-primary">해리포터
													지팡이 (레플리카)</a>
											</div>
										</td>
										<td class="text-center"><span
											class="badge bg-success-subtle text-success border border-success px-3">공개</span></td>
										<td class="text-center text-muted small">2026-04-18</td>
										<td class="text-center"><div
												class="d-flex gap-1 justify-content-center">
												<button class="btn btn-outline-secondary btn-sm">수정</button>
												<button class="btn btn-outline-primary btn-sm fw-bold">경매
													등록</button>
											</div></td>
									</tr>
									<tr>
										<td class="text-center">7</td>
										<td class="text-center"><img
											src="https://picsum.photos/id/4/60/60" class="rounded"
											alt="상품"></td>
										<td class="ps-4">
											<div class="fw-bold">
												<a href="#"
													class="text-decoration-none text-dark link-primary">원피스
													루피 기어4</a>
											</div>
										</td>
										<td class="text-center"><span
											class="badge bg-success-subtle text-success border border-success px-3">공개</span></td>
										<td class="text-center text-muted small">2026-04-17</td>
										<td class="text-center"><div
												class="d-flex gap-1 justify-content-center">
												<button class="btn btn-outline-secondary btn-sm">수정</button>
												<button class="btn btn-outline-primary btn-sm fw-bold">경매
													등록</button>
											</div></td>
									</tr>
									<tr>
										<td class="text-center">6</td>
										<td class="text-center"><img
											src="https://picsum.photos/id/5/60/60" class="rounded"
											alt="상품"></td>
										<td class="ps-4">
											<div class="fw-bold">
												<a href="#"
													class="text-decoration-none text-dark link-primary">포켓몬
													센터 꼬부기 인형</a>
											</div>
										</td>
										<td class="text-center"><span
											class="badge bg-secondary-subtle text-secondary border border-secondary px-3">비공개</span></td>
										<td class="text-center text-muted small">2026-04-16</td>
										<td class="text-center"><div
												class="d-flex gap-1 justify-content-center">
												<button class="btn btn-outline-secondary btn-sm">수정</button>
												<button class="btn btn-light btn-sm text-primary border">공개
													전환</button>
											</div></td>
									</tr>
									<tr>
										<td class="text-center">5</td>
										<td class="text-center"><img
											src="https://picsum.photos/id/10/60/60" class="rounded"
											alt="상품"></td>
										<td class="ps-4">
											<div class="fw-bold">
												<a href="#"
													class="text-decoration-none text-dark link-primary">슬램덩크
													강백호 유니폼</a>
											</div>
										</td>
										<td class="text-center"><span
											class="badge bg-success-subtle text-success border border-success px-3">공개</span></td>
										<td class="text-center text-muted small">2026-04-15</td>
										<td class="text-center"><div
												class="d-flex gap-1 justify-content-center">
												<button class="btn btn-outline-secondary btn-sm">수정</button>
												<button class="btn btn-outline-primary btn-sm fw-bold">경매
													등록</button>
											</div></td>
									</tr>
									<tr>
										<td class="text-center">4</td>
										<td class="text-center"><img
											src="https://picsum.photos/id/11/60/60" class="rounded"
											alt="상품"></td>
										<td class="ps-4">
											<div class="fw-bold">
												<a href="#"
													class="text-decoration-none text-dark link-primary">지브리
													토토로 오르골</a>
											</div>
										</td>
										<td class="text-center"><span
											class="badge bg-secondary-subtle text-secondary border border-secondary px-3">비공개</span></td>
										<td class="text-center text-muted small">2026-04-14</td>
										<td class="text-center"><div
												class="d-flex gap-1 justify-content-center">
												<button class="btn btn-outline-secondary btn-sm">수정</button>
												<button class="btn btn-light btn-sm text-primary border">공개
													전환</button>
											</div></td>
									</tr>
									<tr>
										<td class="text-center">3</td>
										<td class="text-center"><img
											src="https://picsum.photos/id/12/60/60" class="rounded"
											alt="상품"></td>
										<td class="ps-4">
											<div class="fw-bold">
												<a href="#"
													class="text-decoration-none text-dark link-primary">에반게리온
													초호기</a>
											</div>
										</td>
										<td class="text-center"><span
											class="badge bg-success-subtle text-success border border-success px-3">공개</span></td>
										<td class="text-center text-muted small">2026-04-13</td>
										<td class="text-center"><div
												class="d-flex gap-1 justify-content-center">
												<button class="btn btn-outline-secondary btn-sm">수정</button>
												<button class="btn btn-outline-primary btn-sm fw-bold">경매
													등록</button>
											</div></td>
									</tr>
									<tr>
										<td class="text-center">2</td>
										<td class="text-center"><img
											src="https://picsum.photos/id/13/60/60" class="rounded"
											alt="상품"></td>
										<td class="ps-4">
											<div class="fw-bold">
												<a href="#"
													class="text-decoration-none text-dark link-primary">진격의
													거인 조사병단 망토</a>
											</div>
										</td>
										<td class="text-center"><span
											class="badge bg-success-subtle text-success border border-success px-3">공개</span></td>
										<td class="text-center text-muted small">2026-04-12</td>
										<td class="text-center"><div
												class="d-flex gap-1 justify-content-center">
												<button class="btn btn-outline-secondary btn-sm">수정</button>
												<button class="btn btn-outline-primary btn-sm fw-bold">경매
													등록</button>
											</div></td>
									</tr>
									<tr>
										<td class="text-center">1</td>
										<td class="text-center"><img
											src="https://picsum.photos/id/14/60/60" class="rounded"
											alt="상품"></td>
										<td class="ps-4">
											<div class="fw-bold">
												<a href="#"
													class="text-decoration-none text-dark link-primary">드래곤볼
													7성구 세트</a>
											</div>
										</td>
										<td class="text-center"><span
											class="badge bg-secondary-subtle text-secondary border border-secondary px-3">비공개</span></td>
										<td class="text-center text-muted small">2026-04-11</td>
										<td class="text-center"><div
												class="d-flex gap-1 justify-content-center">
												<button class="btn btn-outline-secondary btn-sm">수정</button>
												<button class="btn btn-light btn-sm text-primary border">공개
													전환</button>
											</div></td>
									</tr>
								</tbody>
							</table>
						</div>

						<nav class="mt-4">
							<ul class="pagination pagination-sm justify-content-center">
								<li class="page-item disabled"><a class="page-link"
									href="#">&laquo;</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</section>


		</div>

	</main>


	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>