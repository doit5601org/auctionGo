<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 상품 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background-color: #f0f7ff; }
    .page-header { background-color: #1565c0; color: white; padding: 18px 24px; border-radius: 10px; margin-bottom: 24px; }
    .filter-card { background: white; border-radius: 10px; padding: 20px; box-shadow: 0 2px 8px rgba(21,101,192,0.08); margin-bottom: 20px; }
    .auction-card { border: none; border-radius: 10px; box-shadow: 0 2px 8px rgba(21,101,192,0.08); transition: transform 0.15s; cursor: pointer; background: white; }
    .auction-card:hover { transform: translateY(-4px); box-shadow: 0 6px 16px rgba(21,101,192,0.15); }
    .auction-card img { aspect-ratio: 1; object-fit: cover; border-radius: 10px 10px 0 0; width: 100%; }
    .timer-badge { background-color: #fff3e0; color: #e65100; font-size: 11px; }
    .price-text { color: #1565c0; font-weight: bold; font-size: 15px; }
</style>
</head>
<body>
<div class="container mt-4 mb-5">

    <div class="page-header">
        <h5 class="mb-0 fw-bold">경매 상품 목록</h5>
        <p class="mb-0 small opacity-75 mt-1">현재 진행 중인 경매에 참여해보세요.</p>
    </div>

    <div class="filter-card">
        <form action="auctionList.jsp" method="get" class="row g-2 align-items-end">
            <div class="col-md-2">
                <label class="form-label small fw-bold text-secondary mb-1">장르</label>
                <select name="genreId" class="form-select form-select-sm">
                    <option value="">전체</option>
                    <option value="1">VOCALOID</option>
                    <option value="2">애니메이션</option>
                </select>
            </div>
            <div class="col-md-2">
                <label class="form-label small fw-bold text-secondary mb-1">사이즈</label>
                <select name="sizeId" class="form-select form-select-sm">
                    <option value="">전체</option>
                    <option value="1">1/7</option>
                    <option value="2">1/8</option>
                </select>
            </div>
            <div class="col-md-2">
                <label class="form-label small fw-bold text-secondary mb-1">경매 상태</label>
                <select name="statusId" class="form-select form-select-sm">
                    <option value="">전체</option>
                    <option value="1">진행중</option>
                    <option value="2">종료</option>
                </select>
            </div>
            <div class="col-md-4">
                <label class="form-label small fw-bold text-secondary mb-1">경매명 검색</label>
                <input type="text" name="keyword" class="form-control form-control-sm" placeholder="경매명을 입력하세요">
            </div>
            <div class="col-md-2 d-flex gap-1">
                <button type="submit" class="btn btn-primary btn-sm w-100">검색</button>
                <a href="auctionList.jsp" class="btn btn-outline-secondary btn-sm w-100">초기화</a>
            </div>
        </form>
    </div>

    <div class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-muted small">총 <strong class="text-dark">2</strong>개의 경매</span>
        <select class="form-select form-select-sm" style="width:120px">
            <option>최신순</option>
            <option>마감임박순</option>
            <option>입찰가높은순</option>
        </select>
    </div>

    <div class="row row-cols-2 row-cols-md-4 g-3">

        <%-- 임시데이터 1 --%>
        <div class="col">
            <div class="auction-card card h-100" onclick="location.href='auctionDetail.jsp?auctionId=A001'">
                <img src="https://placehold.co/300x300/e3f2fd/1565c0?text=Miku+1%2F7" alt="하츠네 미쿠 1/7">
                <div class="card-body p-3">
                    <p class="fw-bold small mb-1">하츠네 미쿠 1/7 스케일 피규어</p>
                    <p class="text-muted mb-2" style="font-size:12px">굿스마일컴퍼니 · S급</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="price-text">35,000원</span>
                        <span class="badge timer-badge">23:14:05</span>
                    </div>
                    <div class="text-muted mt-1" style="font-size:11px">입찰 3회</div>
                </div>
            </div>
        </div>

        <%-- 임시데이터 2 --%>
        <div class="col">
            <div class="auction-card card h-100" onclick="location.href='auctionDetail.jsp?auctionId=A002'">
                <img src="https://placehold.co/300x300/fce4ec/c62828?text=Racing+Miku" alt="Racing Miku 2023">
                <div class="card-body p-3">
                    <p class="fw-bold small mb-1">하츠네 미쿠 Racing Miku 2023</p>
                    <p class="text-muted mb-2" style="font-size:12px">굿스마일컴퍼니 · A급</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="price-text">28,000원</span>
                        <span class="badge timer-badge">47:30:12</span>
                    </div>
                    <div class="text-muted mt-1" style="font-size:11px">입찰 1회</div>
                </div>
            </div>
        </div>

    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
