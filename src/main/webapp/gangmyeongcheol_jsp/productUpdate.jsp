<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background-color: #f0f7ff; }
    .navbar { background: white; border-bottom: 1px solid #e3f2fd; }
    .navbar-brand { color: #1565c0 !important; font-weight: 900; font-size: 20px; }
    .nav-link { color: #444 !important; font-size: 14px; font-weight: 500; }
    .nav-link:hover { color: #1565c0 !important; }
    .page-header { background-color: #1565c0; color: white; padding: 18px 24px; border-radius: 10px; margin-bottom: 24px; }
    .card { border: none; border-radius: 10px; box-shadow: 0 2px 8px rgba(21,101,192,0.08); }
    .section-title { font-size: 13px; font-weight: bold; color: #1565c0; margin-bottom: 14px; padding-bottom: 6px; border-bottom: 2px solid #e3f2fd; }
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">🎌 FigureAuction</a>
        <div class="d-flex gap-3 ms-4">
            <a href="main.jsp" class="nav-link">경매</a>
            <a href="productList.jsp" class="nav-link">컬렉션</a>
            <a href="productMyList.jsp" class="nav-link active">내 상품</a>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5" style="max-width:680px">
    <div class="page-header">
        <h5 class="mb-0 fw-bold">상품 수정</h5>
        <p class="mb-0 small opacity-75 mt-1">상품 정보를 수정해주세요.</p>
    </div>

    <div class="card p-4">
        <form action="product_update_act.do" method="post">
            <input type="hidden" name="productId" value="P001">

            <p class="section-title">기본 정보</p>
            <div class="row g-3 mb-4">
                <div class="col-12">
                    <label class="form-label fw-bold small">상품명 <span class="text-danger">*</span></label>
                    <input type="text" name="productName" class="form-control form-control-sm"
                           value="하츠네 미쿠 1/7 스케일 피규어" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold small">제조사 <span class="text-danger">*</span></label>
                    <select name="manufacturerId" class="form-select form-select-sm" required>
                        <option value="1" selected>굿스마일컴퍼니</option>
                        <option value="2">반다이</option>
                        <option value="3">코토부키야</option>
                        <option value="4">맥스팩토리</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold small">장르 <span class="text-danger">*</span></label>
                    <select name="genreId" class="form-select form-select-sm" required>
                        <option value="1" selected>VOCALOID</option>
                        <option value="2">애니메이션</option>
                        <option value="3">게임</option>
                        <option value="4">오리지널</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold small">작품명</label>
                    <input type="text" name="workName" class="form-control form-control-sm" value="VOCALOID">
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold small">캐릭터명</label>
                    <input type="text" name="characterName" class="form-control form-control-sm" value="하츠네 미쿠">
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold small">사이즈 <span class="text-danger">*</span></label>
                    <select name="sizeId" class="form-select form-select-sm" required>
                        <option value="1">1/4</option>
                        <option value="2" selected>1/7</option>
                        <option value="3">1/8</option>
                        <option value="4">Nendoroid</option>
                        <option value="5">기타</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold small">발매일</label>
                    <input type="date" name="releaseDate" class="form-control form-control-sm" value="2024-03-01">
                </div>
            </div>

            <p class="section-title">상품 상태</p>
            <div class="row g-3 mb-4">
                <div class="col-md-4">
                    <label class="form-label fw-bold small">상태 등급 <span class="text-danger">*</span></label>
                    <select name="gradeId" class="form-select form-select-sm" required>
                        <option value="1" selected>S급 (최상)</option>
                        <option value="2">A급 (상)</option>
                        <option value="3">B급 (중)</option>
                        <option value="4">C급 (하)</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label fw-bold small">개봉 여부 <span class="text-danger">*</span></label>
                    <select name="openedYn" class="form-select form-select-sm" required>
                        <option value="N" selected>미개봉</option>
                        <option value="Y">개봉</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label fw-bold small">파츠 누락 <span class="text-danger">*</span></label>
                    <select name="missingParts" class="form-select form-select-sm" required>
                        <option value="N" selected>없음</option>
                        <option value="Y">있음</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold small">구매일</label>
                    <input type="date" name="purchaseDate" class="form-control form-control-sm" value="2025-12-01">
                </div>
                <div class="col-12">
                    <label class="form-label fw-bold small">상품 설명</label>
                    <textarea name="productDescription" class="form-control form-control-sm" rows="5">정품 굿스마일컴퍼니 하츠네 미쿠 1/7 스케일 피규어입니다.
미개봉 상태로 구입 후 보관만 하였습니다.
박스 상태 양호하며 파츠 누락 없습니다.</textarea>
                </div>
            </div>

            <div class="d-flex gap-2">
                <button type="button" class="btn btn-outline-secondary w-50" onclick="location.href='productDetail.jsp?productId=P001'">취소</button>
                <button type="submit" class="btn btn-primary w-50">수정하기</button>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
