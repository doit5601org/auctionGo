<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script>
// 이미지 선택 시 미리보기 표시
function showPreview(input) {
    const preview = document.getElementById('imgPreview');
    preview.innerHTML = '';
    const files = Array.from(input.files).slice(0, 5);
    files.forEach(file => {
        const reader = new FileReader();
        reader.onload = e => {
            const img = document.createElement('img');
            img.src = e.target.result;
            img.style = 'width:80px;height:80px;object-fit:cover;border-radius:6px;border:1px solid #ddd';
            preview.appendChild(img);
        };
        reader.readAsDataURL(file);
    });
}
</script>
</head>
<body>

<%-- 네비바 --%>
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">FigureAuction</a>
        <div class="d-flex gap-3 ms-4">
            <a href="auctionList.jsp" class="nav-link">경매</a>
            <a href="productList.jsp" class="nav-link">컬렉션</a>
            <a href="productMyList.jsp" class="nav-link active">내 상품</a>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5" style="max-width:680px">
    <div class="page-header">
        <h5 class="mb-0 fw-bold">상품 등록</h5>
        <p class="mb-0 small opacity-75 mt-1">판매할 피규어 상품 정보를 입력해주세요.</p>
    </div>

    <div class="card p-4">
        <form action="product_register_act.do" method="post" enctype="multipart/form-data">

            <%-- 상품 이미지 업로드: 이미지 최대 5장 업로드 (JPG, PNG, 각 10MB 이하) --%>
            <p class="fw-bold border-bottom pb-2 mb-3">상품 이미지</p>
            <div class="mb-4">
                <div class="border border-2 border-dashed rounded p-4 text-center"
                     onclick="document.getElementById('imgInput').click()" style="cursor:pointer">
                    <div class="text-muted mb-1" style="font-size:32px">📷</div>
                    <p class="fw-bold small mb-1">이미지를 클릭하여 업로드</p>
                    <p class="text-muted small mb-0">최대 5장 · JPG, PNG · 각 10MB 이하</p>
                </div>
                <input type="file" id="imgInput" name="productImages" multiple accept="image/*" class="d-none"
                       onchange="showPreview(this)">
                <div id="imgPreview" class="d-flex gap-2 mt-2 flex-wrap"></div>
            </div>

            <p class="fw-bold border-bottom pb-2 mb-3">기본 정보</p>
            <div class="row g-3 mb-4">
                <div class="col-12">
                    <label class="form-label fw-bold small">상품명 <span class="text-danger">*</span></label>
                    <input type="text" name="productName" class="form-control form-control-sm"
                           placeholder="상품명을 입력하세요" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold small">제조사 <span class="text-danger">*</span></label>
                    <select name="manufacturerId" class="form-select form-select-sm" required>
                        <option value="">선택하세요</option>
                        <option value="1">굿스마일컴퍼니</option>
                        <option value="2">반다이</option>
                        <option value="3">코토부키야</option>
                        <option value="4">맥스팩토리</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold small">장르 <span class="text-danger">*</span></label>
                    <select name="genreId" class="form-select form-select-sm" required>
                        <option value="">선택하세요</option>
                        <option value="1">VOCALOID</option>
                        <option value="2">애니메이션</option>
                        <option value="3">게임</option>
                        <option value="4">오리지널</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold small">작품명</label>
                    <input type="text" name="workName" class="form-control form-control-sm" placeholder="작품명을 입력하세요">
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold small">캐릭터명</label>
                    <input type="text" name="characterName" class="form-control form-control-sm" placeholder="캐릭터명을 입력하세요">
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold small">사이즈 <span class="text-danger">*</span></label>
                    <select name="sizeId" class="form-select form-select-sm" required>
                        <option value="">선택하세요</option>
                        <option value="1">1/4</option>
                        <option value="2">1/7</option>
                        <option value="3">1/8</option>
                        <option value="4">Nendoroid</option>
                        <option value="5">기타</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold small">발매일</label>
                    <input type="date" name="releaseDate" class="form-control form-control-sm">
                </div>
            </div>

            <p class="fw-bold border-bottom pb-2 mb-3">상품 상태</p>
            <div class="row g-3 mb-4">
                <div class="col-md-4">
                    <label class="form-label fw-bold small">상태 등급 <span class="text-danger">*</span></label>
                    <select name="gradeId" class="form-select form-select-sm" required>
                        <option value="">선택하세요</option>
                        <option value="1">S급 (최상)</option>
                        <option value="2">A급 (상)</option>
                        <option value="3">B급 (중)</option>
                        <option value="4">C급 (하)</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label fw-bold small">개봉 여부 <span class="text-danger">*</span></label>
                    <select name="openedYn" class="form-select form-select-sm" required>
                        <option value="">선택하세요</option>
                        <option value="N">미개봉</option>
                        <option value="Y">개봉</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label fw-bold small">파츠 누락 <span class="text-danger">*</span></label>
                    <select name="missingParts" class="form-select form-select-sm" required>
                        <option value="">선택하세요</option>
                        <option value="N">없음</option>
                        <option value="Y">있음</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold small">구매일</label>
                    <input type="date" name="purchaseDate" class="form-control form-control-sm">
                </div>
                <div class="col-12">
                    <label class="form-label fw-bold small">상품 설명</label>
                    <textarea name="productDescription" class="form-control form-control-sm" rows="5"
                              placeholder="상품 상태, 하자 여부 등 상세 설명을 입력하세요."></textarea>
                </div>
            </div>

            <div class="d-flex gap-2">
                <button type="button" class="btn btn-outline-secondary w-50"
                        onclick="location.href='productMyList.jsp'">취소</button>
                <button type="submit" class="btn btn-primary w-50">등록하기</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
