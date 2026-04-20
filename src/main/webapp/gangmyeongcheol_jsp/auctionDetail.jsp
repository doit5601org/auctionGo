<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background-color: #f0f7ff; }
    .navbar { background: white; border-bottom: 1px solid #e3f2fd; }
    .navbar-brand { color: #1565c0 !important; font-weight: 900; font-size: 20px; }
    .nav-link { color: #444 !important; font-size: 14px; font-weight: 500; }
    .nav-link:hover { color: #1565c0 !important; }
    .card { border: none; border-radius: 10px; box-shadow: 0 2px 8px rgba(21,101,192,0.08); }
    .section-title { font-size: 15px; font-weight: bold; color: #1565c0; border-left: 4px solid #1565c0; padding-left: 10px; margin-bottom: 14px; }
    .price-box { background: linear-gradient(135deg, #1565c0, #1976d2); color: white; border-radius: 12px; padding: 20px; }
    .timer-box { background-color: #fff3e0; border: 1px solid #ffcc02; border-radius: 10px; padding: 14px; text-align: center; }
    .timer-text { font-size: 28px; font-weight: bold; color: #e65100; letter-spacing: 2px; }
    .info-label { color: #888; font-size: 13px; width: 110px; }
    .thumb-img { width: 64px; height: 64px; object-fit: cover; border-radius: 6px; border: 2px solid #e3f2fd; cursor: pointer; }
    .thumb-img:hover { border-color: #1565c0; }
</style>
</head>
<body>

<!-- 네비바 -->
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">🎌 FigureAuction</a>
        <div class="d-flex gap-3 ms-4">
            <a href="main.jsp" class="nav-link">경매</a>
            <a href="productList.jsp" class="nav-link">컬렉션</a>
            <a href="productMyList.jsp" class="nav-link">내 상품</a>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5">

    <a href="main.jsp" class="btn btn-outline-primary btn-sm mb-3">← 경매 목록</a>

    <div class="row g-4">
        <div class="col-md-5">
            <div class="card p-3">
                <img id="mainImg" src="https://placehold.co/400x400/e3f2fd/1565c0?text=Miku+1%2F7"
                     class="img-fluid rounded mb-3" style="aspect-ratio:1; object-fit:cover; width:100%" alt="">
                <div class="d-flex gap-2">
                    <img src="https://placehold.co/400x400/e3f2fd/1565c0?text=Miku+1%2F7" class="thumb-img"
                         onclick="document.getElementById('mainImg').src=this.src" alt="">
                    <img src="https://placehold.co/400x400/e3f2fd/1565c0?text=Side" class="thumb-img"
                         onclick="document.getElementById('mainImg').src=this.src" alt="">
                    <img src="https://placehold.co/400x400/e3f2fd/1565c0?text=Back" class="thumb-img"
                         onclick="document.getElementById('mainImg').src=this.src" alt="">
                </div>
            </div>
        </div>

        <div class="col-md-7">
            <div class="card p-4 h-100 d-flex flex-column gap-3">
                <div>
                    <span class="badge bg-success mb-2">진행중</span>
                    <h5 class="fw-bold mb-1">하츠네 미쿠 1/7 스케일 피규어 경매</h5>
                    <p class="text-muted small mb-0">판매자: miku_seller · 등록일: 2026-04-15</p>
                </div>

                <div class="timer-box">
                    <div class="text-muted small mb-1">경매 종료까지</div>
                    <div class="timer-text">23:14:05</div>
                    <div class="text-muted small mt-1">2026-04-19 15:00 종료</div>
                </div>

                <div class="price-box">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <div>
                            <div class="opacity-75 small">현재 입찰가 (차순위)</div>
                            <div class="fs-4 fw-bold">35,000원</div>
                        </div>
                        <div class="text-end">
                            <div class="opacity-75 small">시작가</div>
                            <div class="fw-bold">20,000원</div>
                        </div>
                    </div>
                    <div class="opacity-75 small">총 입찰: 3회 · 최고 입찰자: m***u</div>
                </div>

                <div>
                    <label class="form-label fw-bold small">입찰가 입력</label>
                    <div class="input-group">
                        <input type="number" class="form-control" placeholder="36,000원 이상 입력" min="36000" step="1000">
                        <span class="input-group-text">원</span>
                    </div>
                    <div class="form-text">최소 입찰 단위: 1,000원</div>
                </div>

                <div class="d-flex gap-2 mt-auto">
                    <button type="button" class="btn btn-primary flex-fill fw-bold">입찰하기</button>
                    <a href="auctionReport.jsp?auctionId=A001" class="btn btn-outline-danger">신고</a>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4 mt-1">
        <div class="col-md-8">
            <div class="card p-4">
                <p class="section-title">상품 정보</p>
                <table class="table table-borderless table-sm mb-3">
                    <tr><td class="info-label">제조사</td><td class="fw-bold">굿스마일컴퍼니</td></tr>
                    <tr><td class="info-label">장르</td><td class="fw-bold">VOCALOID</td></tr>
                    <tr><td class="info-label">사이즈</td><td class="fw-bold">1/7 (전고 약 23cm)</td></tr>
                    <tr><td class="info-label">상태 등급</td><td><span class="badge" style="background-color:#e3f2fd;color:#1565c0">S급</span></td></tr>
                    <tr><td class="info-label">개봉 여부</td><td><span class="badge bg-success">미개봉</span></td></tr>
                    <tr><td class="info-label">파츠 누락</td><td class="fw-bold">없음</td></tr>
                </table>
                <p class="section-title">경매 설명</p>
                <p class="text-secondary small" style="white-space:pre-wrap; line-height:1.8">정품 굿스마일컴퍼니 제품으로 미개봉 상태입니다.
박스 상태 양호하며 파츠 누락 없습니다.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card p-4">
                <p class="section-title">입찰 내역</p>
                <ul class="list-unstyled" style="font-size:13px">
                    <li class="d-flex justify-content-between py-2 border-bottom">
                        <span class="text-muted">m***u</span>
                        <span class="fw-bold text-primary">50,000원</span>
                    </li>
                    <li class="d-flex justify-content-between py-2 border-bottom">
                        <span class="text-muted">fig***2</span>
                        <span class="fw-bold">35,000원</span>
                    </li>
                    <li class="d-flex justify-content-between py-2">
                        <span class="text-muted">voca***d</span>
                        <span class="fw-bold">25,000원</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
