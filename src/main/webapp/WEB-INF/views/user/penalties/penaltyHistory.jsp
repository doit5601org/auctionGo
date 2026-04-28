<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 패널티 이력</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>
<script>
	$(function() {
		$('#penalty-history-table').on(
				'click',
				'.detail-btn',
				function(e) {
					e.preventDefault();
					const $targetRow = $(this).closest('tr').next('.collapse');
					const $otherRows = $('#penalty-history-table').find(
							'.collapse').not($targetRow);

					$otherRows.stop(true, true).hide().removeClass('show');
					$targetRow.stop(true, true).slideToggle(200, function() {
						$(this).toggleClass('show', $(this).is(':visible'));
					});
				});
	});
</script>

<style>
#penalty-history-table tr:has(+.collapse.show) td {
	border-bottom: none !important;
}

#penalty-history-table .collapse.bg-light {
	background-color: #f8f9fa !important;
}

.btn-primary {
	background-color: #120e63 !important;
	border-color: #120e63 !important;
}

.bg-primary {
	background-color: #120e63 !important;
}

i.text-primary {
	color: #120e63 !important;
}

.btn-primary, .bg-primary, .btn-outline-primary:hover {
	background-color: #120e63 !important;
	border-color: #120e63 !important;
	color: #ffffff !important;
}

.btn-outline-primary {
	background-color: #fff !important;
	border-color: #120e63 !important;
	color: #120e63 !important;
}

.badge.bg-primary {
	background-color: #5172a6 !important;
}

.pagination .page-item.active .page-link {
	background-color: #5172a6 !important;
	border-color: #5172a6 !important;
	color: #ffffff !important;
}

.pagination .page-link:hover {
	color: #5172a6;
}

.page-link:focus {
	box-shadow: 0 0 0 0.25rem rgba(18, 14, 99, 0.25);
}

.nav-link {
	color: #5172a6 !important;
}

.dropdown-item.active, .dropdown-item:active {
	background-color: #5172a6 !important;
}
</style>
</head>
<body class="bg-light">
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
		<div class="row">
			<aside class="col-md-3">
				<%@ include file="/WEB-INF/views/common/mypage_layout.jsp"%>
			</aside>
			<section class="col-md-9">
				<div class="card shadow-sm border-0 bg-white p-4">
					<div
						class="card-header bg-white py-3 border-bottom d-flex justify-content-between align-items-center">
						<h5 class="mb-0 fw-bold">
							<i class="bi bi-exclamation-octagon-fill me-2"></i>패널티 이력
						</h5>
						<span class="badge bg-danger"
							style="width: 200px; height: 40px; font-size: 16px; line-height: 30px;">최종
							패널티 점수: ${penaltyScore}점</span>
					</div>

					<div class="card-body">
						<div class="alert alert-light border small mb-4 shadow-sm">
							<div class="row text-center g-0">
								<div class="col-3 border-end">
									<span class="badge rounded-pill bg-warning text-dark mb-1">1단계</span><br>
									<strong>1점:</strong> 경고
								</div>
								<div class="col-3 border-end">
									<span class="badge rounded-pill bg-orange text-white mb-1"
										style="background-color: #fd7e14;">2단계</span><br> <strong>2점:</strong>
									7일 정지
								</div>
								<div class="col-3 border-end">
									<span class="badge rounded-pill bg-danger mb-1">3단계</span><br>
									<strong>3점:</strong> 30일 정지
								</div>
								<div class="col-3">
									<span class="badge rounded-pill bg-dark mb-1">4단계</span><br>
									<strong>4점:</strong> 영구 정지
								</div>
							</div>
						</div>

						<div class="table-responsive">
							<table class="table align-middle text-center"
								id="penalty-history-table">
								<thead class="table-light">
									<tr>
										<th style="width: 60px;">No.</th>
										<th>부여일</th>
										<th>내용</th>
										<th>부여점수</th>
										<th>누적점수</th>
										<th>상태</th>
										<th style="width: 100px;">비고</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty result.list}">
											<tr>
												<td colspan="7" class="py-5 text-center text-muted"><i
													class="bi bi-info-circle d-block mb-2 fs-4"></i> 패널티 이력이
													존재하지 않습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="dto" items="${result.list}"
												varStatus="status">
												<tr
													class="${dto.penaltyCancelId > 0 ? 'table-active opacity-50' : ''}">
													<td>${status.count}</td>
													<td>${fn:substring(dto.penaltyCreatedAt, 0, 10)}</td>

													<td class="fw-bold"><c:choose>
															<c:when test="${dto.givenScore == 1}">경고</c:when>
															<c:when test="${dto.givenScore == 2}">7일 정지</c:when>
															<c:when test="${dto.givenScore == 3}">30일 정지</c:when>
															<c:when test="${dto.givenScore == 4}">영구 정지</c:when>
															<c:otherwise>기타 제재</c:otherwise>
														</c:choose></td>

													<td><span class="text-secondary">+${dto.givenScore}점</span></td>

													<td><span
														class="badge fs-6 fw-bold
                                    <c:choose>
                                        <c:when test="${dto.penaltyCancelId > 0}">bg-white text-secondary border</c:when>
                                        <c:when test="${dto.accumulatedScore == 1}">text-warning</c:when>
                                        <c:when test="${dto.accumulatedScore == 3}">text-danger</c:when>
                                        <c:when test="${dto.accumulatedScore == 4}">text-dark</c:when>
                                    </c:choose>"
														style="${dto.accumulatedScore == 2 && dto.penaltyCancelId <= 0 ? 'color: #fd7e14;' : ''}">
															${dto.accumulatedScore}점 </span></td>

													<td><c:choose>
															<c:when test="${dto.penaltyCancelId > 0}">
																<span class="badge bg-light text-secondary border">부여취소</span>
															</c:when>
															<c:when test="${dto.historyStatus eq '적용중'}">
																<span class="badge bg-danger">적용중</span>
															</c:when>
															<c:otherwise>
																<span class="badge bg-light text-muted border">기한종료</span>
															</c:otherwise>
														</c:choose></td>

													<td>
														<button type="button"
															class="btn btn-sm ${dto.penaltyCancelId > 0 ? 'btn-primary' : 'btn-outline-primary'} detail-btn">
															${dto.penaltyCancelId > 0 ? '취소사유' : '상세'}</button>
													</td>
												</tr>

												<%-- 상세 슬라이드 영역 --%>
												<tr class="collapse bg-light">
													<td colspan="7" class="p-4 text-start"><c:choose>
															<c:when test="${dto.penaltyCancelId > 0}">
																<div
																	class="ms-4 border-start ps-3 border-3 border-secondary">
																	<h6 class="fw-bold text-secondary">취소 및 철회 정보</h6>
																	<p class="mb-1 small">
																		<strong>취소 일시:</strong> ${dto.canceledAt}
																	</p>
																	<p class="mb-0 small text-muted">
																		<strong>철회 사유:</strong> ${dto.cancleReason}
																	</p>
																</div>
															</c:when>
															<c:otherwise>
																<div
																	class="ms-4 border-start ps-3 border-3 border-danger">
																	<h6 class="fw-bold">제재 상세 내용</h6>
																	<c:if test="${not empty dto.penaltyStartDate}">
																		<p class="mb-1 small">
																			<strong>제재 기간:</strong> ${dto.penaltyStartDate} ~
																			${dto.penaltyEndDate}
																		</p>
																	</c:if>
																	<p class="mb-0 small text-muted">
																		<strong>부여 사유:</strong> ${dto.penaltyTypeName}
																	</p>
																</div>
															</c:otherwise>
														</c:choose></td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</section>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>