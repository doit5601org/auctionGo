<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 - 통합 경매 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
    .section-title { border-left: 5px solid #212529; padding-left: 15px; margin-bottom: 20px; font-weight: bold; }
    .auction-card { background: #fff; border: 1px solid #ced4da; border-radius: 4px; margin-bottom: 1rem; transition: all 0.2s; }
    .auction-card:hover { box-shadow: 0 4px 12px rgba(0,0,0,0.08); }
    
    /* 진행 중 스타일 */
    .status-active { border-left: 5px solid #0d6efd; }
    /* 종료 스타일 */
    .status-finished { border-left: 5px solid #6c757d; background-color: #f8f9fa; opacity: 0.8; }
    
    .auction-img { width: 140px; height: 140px; object-fit: cover; border-radius: 4px; border: 1px solid #dee2e6; }
    .btn-wf-sm { padding: 5px 15px; font-size: 0.85rem; border: 1px solid #ced4da; background-color: #fff; font-weight: bold; }
    .price-text { color: #0d6efd; font-weight: bold; font-size: 1.2rem; }
    .finished-price { color: #495057; font-weight: bold; font-size: 1.1rem; }
</style>
</head>
<body class="bg-light">
    <div class="container-fluid py-4">
        <h4 class="fw-bold mb-4">전체 경매 관리 (통합)</h4>

        <div class="mb-5">
            <h5 class="section-title text-primary">진행 중인 경매 <span class="badge bg-primary ms-2">3</span></h5>
            <div id="activeAuctions">
                <div class="auction-card status-active p-3 shadow-sm">
                    <div class="d-flex gap-4 align-items-center">
                        <img src="${ pageContext.request.contextPath }/images/tempFigureImage.png" class="auction-img" alt="상품">
                        <div class="flex-grow-1">
                            <div class="row align-items-center">
                                <div class="col-md-4 border-end">
                                    <h6 class="fw-bold mb-1">하츠네 미쿠 피규어 (진행중)</h6>
                                    <p class="mb-0 small text-muted">등록자: 회원A | 개시: 2026-04-19</p>
                                </div>
                                <div class="col-md-3 border-end text-center">
                                    <p class="mb-0 small text-muted">현재가</p>
                                    <div class="price-text">165,000원</div>
                                </div>
                                <div class="col-md-3 border-end text-center">
                                    <p class="mb-0 small text-muted">종료 예정</p>
                                    <p class="mb-0 fw-bold small text-danger">4일 12시간 남음</p>
                                </div>
                                <div class="col-md-2 text-end">
                                    <button class="btn btn-wf-sm" onclick="location.href='auctionDetail.jsp'">관리</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div>
            <h5 class="section-title text-secondary">종료된 경매 <span class="badge bg-secondary ms-2">12</span></h5>
            <div id="finishedAuctions">
                <div class="auction-card status-finished p-3 shadow-sm">
                    <div class="d-flex gap-4 align-items-center">
                        <img src="${ pageContext.request.contextPath }/images/tempFigureImage.png" class="auction-img" alt="상품">
                        <div class="flex-grow-1">
                            <div class="row align-items-center">
                                <div class="col-md-4 border-end">
                                    <h6 class="fw-bold mb-1 text-muted">마법소녀 리리컬 나노하 (종료)</h6>
                                    <p class="mb-0 small text-muted">낙찰자: user_win | 종료: 2026-04-20</p>
                                </div>
                                <div class="col-md-3 border-end text-center">
                                    <p class="mb-0 small text-muted">최종 낙찰가</p>
                                    <div class="finished-price">210,000원</div>
                                </div>
                                <div class="col-md-3 border-end text-center text-muted small">
                                    <p class="mb-0">거래 상태</p>
                                    <p class="mb-0 fw-bold text-success">입금 완료</p>
                                </div>
                                <div class="col-md-2 text-end">
                                    <button class="btn btn-wf-sm">이력</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>