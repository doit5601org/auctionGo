<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FigureMarket - 상품 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; }
        .navbar-brand { font-weight: 700; color: #4F46E5 !important; }
        .form-card { background: #fff; border-radius: 14px; padding: 28px; box-shadow: 0 2px 8px rgba(0,0,0,.08); max-width: 640px; margin: 0 auto; }
        .img-preview { display: flex; gap: 8px; flex-wrap: wrap; margin-top: 8px; }
        .img-preview img { width: 80px; height: 80px; object-fit: cover; border-radius: 8px; border: 1px solid #e5e7eb; }
    </style>
</head>
<body>

<%-- 네비게이션 바 --%>
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="main.jsp"><i class="bi bi-box-seam"></i>쌍용피규어마켓</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto ms-3">
                <li class="nav-item"><a class="nav-link" href="productList.jsp">컬렉션</a></li>
                <li class="nav-item"><a class="nav-link" href="auctionList.jsp">경매</a></li>
                <li class="nav-item"><a class="nav-link fw-semibold text-primary" href="productMyList.jsp">내 상품</a></li>
            </ul>
        </div>
    </div>
</nav>

<%-- 에러 메시지 — Servlet에서 forward 시 request.setAttribute("errorMsg", msg) 전달 --%>
<c:if test="${not empty errorMsg}">
    <div class="container mt-3">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>${errorMsg}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </div>
</c:if>

<div class="container py-4">
    <div class="form-card">
        <h5 class="fw-bold mb-4">상품 등록</h5>

        <%-- Servlet: POST /product/register/act 로 전송 --%>
        <form action="/product/register/act" method="post" enctype="multipart/form-data">

            <%-- 이미지 업로드 (최대 5장) --%>
            <div class="mb-3">
                <label class="form-label fw-semibold">상품 이미지 <span class="text-muted fw-normal">(최대 5장, JPG·PNG, 각 10MB 이하)</span></label>
                <input type="file" name="productImages" id="productImages" class="form-control" accept="image/jpeg,image/png" multiple onchange="showPreview(this)">
                <div class="img-preview" id="imgPreview"></div>
            </div>

            <%-- 상품명 --%>
            <div class="mb-3">
                <label class="form-label fw-semibold">상품명 <span class="text-danger">*</span></label>
                <input type="text" name="productName" class="form-control" placeholder="예) 하츠네 미쿠 1/7 스케일" required maxlength="100">
            </div>

            <%-- 장르 — Servlet GET 시 request.setAttribute("genreList", list) 전달 --%>
            <div class="mb-3">
                <label class="form-label fw-semibold">장르 <span class="text-danger">*</span></label>
                <select name="genreId" class="form-select" required>
                    <option value="">선택하세요</option>
                    <c:forEach var="g" items="${genreList}">
                        <option value="${g.genreId}">${g.genreName}</option>
                    </c:forEach>
                    <c:if test="${empty genreList}">
                        <option value="1">애니메이션</option>
                        <option value="2">게임</option>
                        <option value="3">특촬</option>
                    </c:if>
                </select>
            </div>

            <%-- 사이즈 --%>
            <div class="mb-3">
                <label class="form-label fw-semibold">사이즈 <span class="text-danger">*</span></label>
                <select name="sizeId" class="form-select" required>
                    <option value="">선택하세요</option>
                    <c:forEach var="s" items="${sizeList}">
                        <option value="${s.sizeId}">${s.sizeName}</option>
                    </c:forEach>
                    <c:if test="${empty sizeList}">
                        <option value="1">1/7</option>
                        <option value="2">1/4</option>
                        <option value="3">Nendoroid</option>
                        <option value="4">Figma</option>
                    </c:if>
                </select>
            </div>

            <%-- 제조사 --%>
            <div class="mb-3">
                <label class="form-label fw-semibold">제조사 <span class="text-danger">*</span></label>
                <select name="makerId" class="form-select" required>
                    <option value="">선택하세요</option>
                    <c:forEach var="m" items="${makerList}">
                        <option value="${m.makerId}">${m.makerName}</option>
                    </c:forEach>
                    <c:if test="${empty makerList}">
                        <option value="1">Good Smile Company</option>
                        <option value="2">Max Factory</option>
                        <option value="3">Bandai</option>
                        <option value="4">Kotobukiya</option>
                    </c:if>
                </select>
            </div>

            <%-- 등급 --%>
            <div class="mb-3">
                <label class="form-label fw-semibold">상품 등급 <span class="text-danger">*</span></label>
                <div class="d-flex gap-2">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="grade" id="gradeS" value="S" required>
                        <label class="form-check-label" for="gradeS">S (최상)</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="grade" id="gradeA" value="A">
                        <label class="form-check-label" for="gradeA">A (상)</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="grade" id="gradeB" value="B">
                        <label class="form-check-label" for="gradeB">B (중)</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="grade" id="gradeC" value="C">
                        <label class="form-check-label" for="gradeC">C (하)</label>
                    </div>
                </div>
            </div>

            <%-- 가격 --%>
            <div class="mb-3">
                <label class="form-label fw-semibold">판매가 (원) <span class="text-danger">*</span></label>
                <input type="number" name="price" class="form-control" placeholder="숫자만 입력" required min="1000">
            </div>

            <%-- 상품 설명 --%>
            <div class="mb-4">
                <label class="form-label fw-semibold">상품 설명</label>
                <textarea name="description" class="form-control" rows="4" placeholder="상품 상태, 구매 시기, 포함 구성품 등을 적어주세요" maxlength="1000"></textarea>
            </div>

            <div class="d-flex gap-2">
                <a href="productMyList.jsp" class="btn btn-outline-secondary w-50">취소</a>
                <button type="submit" class="btn btn-primary w-50">등록하기</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
// 이미지 선택 시 미리보기 (최대 5장)
function showPreview(input) {
    const preview = document.getElementById('imgPreview');
    preview.innerHTML = '';
    const files = Array.from(input.files).slice(0, 5);
    files.forEach(file => {
        const reader = new FileReader();
        reader.onload = e => {
            const img = document.createElement('img');
            img.src = e.target.result;
            preview.appendChild(img);
        };
        reader.readAsDataURL(file);
    });
}
</script>
</body>
</html>
