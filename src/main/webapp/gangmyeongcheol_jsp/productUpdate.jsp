<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body { background-color: #e3f2fd; }
        .navbar { background: white; border-bottom: 1px solid #bbdefb; }
        .navbar-brand { color: #1976d2 !important; font-weight: 800; }
        .page-header {
            background: linear-gradient(135deg, #2196f3 0%, #1565c0 100%);
            color: white; padding: 30px 24px; border-radius: 15px; margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(21, 101, 192, 0.3);
        }
        .card { border: none; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.08); }
        .section-title {
            font-size: 14px; font-weight: 700; color: #1976d2;
            margin-bottom: 15px; padding-left: 10px; border-left: 4px solid #2196f3;
        }
        .upload-box {
            border: 2px dashed #90caf9; border-radius: 12px; padding: 30px;
            text-align: center; background-color: #f8fbff; cursor: pointer; transition: 0.3s;
        }
        .upload-box:hover { border-color: #1976d2; background-color: #e3f2fd; }
        .img-preview { display: flex; gap: 8px; flex-wrap: wrap; margin-top: 10px; }
        .img-preview img { width: 80px; height: 80px; object-fit: cover; border-radius: 8px; border: 1px solid #dee2e6; }
        .current-img { width: 80px; height: 80px; object-fit: cover; border-radius: 8px; border: 2px solid #90caf9; }
        .form-label { font-size: 13px; color: #37474f; }
        .btn-primary { background-color: #1976d2; border: none; }
        .btn-primary:hover { background-color: #0d47a1; }
        .btn-light { background-color: #cfd8dc; color: #37474f; border: none; }
        .btn-light:hover { background-color: #b0bec5; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">경매나라</a><%-- ${ctx}/main --%>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-4">
                <li class="nav-item"><a href="auctionList.jsp" class="nav-link">경매</a></li><%-- ${ctx}/auction/list --%>
                <li class="nav-item"><a href="productList.jsp" class="nav-link">컬렉션</a></li><%-- ${ctx}/product/list --%>
                <li class="nav-item"><a href="productMyList.jsp" class="nav-link fw-bold" style="color:#1976d2;">내 상품</a></li><%-- ${ctx}/product/myList --%>
            </ul>
        </div>
    </div>
</nav>

<%-- [Controller 연결 후] request.setAttribute("product", productVO) 전달 --%>
<div class="container mt-4 mb-5" style="max-width:720px">
    <div class="page-header text-center">
        <h4 class="mb-1 fw-bold">나의 컬렉션 수정</h4>
        <p class="mb-0 small opacity-90">소중한 피규어 정보를 업데이트해 보세요.</p>
    </div>

    <div class="card p-4">
        <%-- [Controller 연결 후] action을 ${ctx}/product/update 로 변경 --%>
        <form action="productMyList.jsp" method="post" enctype="multipart/form-data">

            <%-- 상품코드 히든 --%>
            <%-- <input type="hidden" name="productId" value="${product.productId}"> --%>
            <input type="hidden" name="productId" value="1">

            <%-- ======================== 사진 섹션 ======================== --%>
            <p class="section-title">컬렉션 사진</p>
            <div class="mb-4">
                <p class="form-label fw-bold mb-2">현재 등록된 사진 <span class="text-muted fw-normal">(교체하려면 아래에서 새 사진 선택)</span></p>
                <div class="row g-3 mb-3">
                    <%-- [Controller 연결 후 활성화]
                    <div class="col-4 text-center">
                        <p class="form-label mb-1">사진 1</p>
                        <img src="${ctx}/images/${product.img1}" class="current-img" alt="">
                    </div>
                    <div class="col-4 text-center">
                        <p class="form-label mb-1">사진 2</p>
                        <c:if test="${not empty product.img2}">
                            <img src="${ctx}/images/${product.img2}" class="current-img" alt="">
                        </c:if>
                        <c:if test="${empty product.img2}">
                            <div class="current-img d-flex align-items-center justify-content-center bg-light text-muted" style="font-size:11px;">없음</div>
                        </c:if>
                    </div>
                    <div class="col-4 text-center">
                        <p class="form-label mb-1">사진 3</p>
                        <c:if test="${not empty product.img3}">
                            <img src="${ctx}/images/${product.img3}" class="current-img" alt="">
                        </c:if>
                        <c:if test="${empty product.img3}">
                            <div class="current-img d-flex align-items-center justify-content-center bg-light text-muted" style="font-size:11px;">없음</div>
                        </c:if>
                    </div>
                    --%>
                    <%-- JSP 단독 실행용 샘플 기존 이미지 --%>
                    <div class="col-4 text-center">
                        <p class="form-label mb-1">사진 1</p>
                        <img src="https://placehold.co/80x80/e9ecef/6c757d?text=1" class="current-img" alt="">
                    </div>
                    <div class="col-4 text-center">
                        <p class="form-label mb-1">사진 2</p>
                        <img src="https://placehold.co/80x80/e9ecef/6c757d?text=2" class="current-img" alt="">
                    </div>
                    <div class="col-4 text-center">
                        <p class="form-label mb-1">사진 3</p>
                        <div class="current-img d-flex align-items-center justify-content-center bg-light text-muted" style="font-size:11px;">없음</div>
                    </div>
                </div>

                <%-- 새 이미지 교체 --%>
                <div class="row g-3">
                    <div class="col-4">
                        <div class="upload-box" onclick="document.getElementById('img1').click()">
                            <i class="bi bi-arrow-repeat fs-4" style="color:#1976d2;"></i>
                            <p class="mb-0 small mt-1">사진 1 교체</p>
                        </div>
                        <input type="file" id="img1" name="productImage1" accept="image/*" class="d-none" onchange="showSinglePreview(this, 'preview1')">
                        <div id="preview1" class="img-preview justify-content-center"></div>
                    </div>
                    <div class="col-4">
                        <div class="upload-box" onclick="document.getElementById('img2').click()">
                            <i class="bi bi-arrow-repeat fs-4" style="color:#90caf9;"></i>
                            <p class="mb-0 small mt-1">사진 2 교체</p>
                        </div>
                        <input type="file" id="img2" name="productImage2" accept="image/*" class="d-none" onchange="showSinglePreview(this, 'preview2')">
                        <div id="preview2" class="img-preview justify-content-center"></div>
                    </div>
                    <div class="col-4">
                        <div class="upload-box" onclick="document.getElementById('img3').click()">
                            <i class="bi bi-arrow-repeat fs-4" style="color:#90caf9;"></i>
                            <p class="mb-0 small mt-1">사진 3 교체</p>
                        </div>
                        <input type="file" id="img3" name="productImage3" accept="image/*" class="d-none" onchange="showSinglePreview(this, 'preview3')">
                        <div id="preview3" class="img-preview justify-content-center"></div>
                    </div>
                </div>
            </div>

            <%-- ======================== 피규어 정보 섹션 ======================== --%>
            <p class="section-title">피규어 정보</p>
            <div class="row g-3 mb-4">

                <%-- 상품 발매명 --%>
                <div class="col-12">
                    <label class="form-label fw-bold">상품 발매명 <span class="text-danger">*</span></label>
                    <%-- <input type="text" name="productName" class="form-control" value="${product.productName}" required> --%>
                    <input type="text" name="productName" class="form-control" value="하츠네 미쿠 15th Anniversary 1/7 Scale" required>
                </div>

                <%-- 상품 별칭 --%>
                <div class="col-12">
                    <label class="form-label fw-bold">상품 별칭 <span class="text-muted fw-normal">(나만의 이름)</span></label>
                    <%-- <input type="text" name="productAlias" class="form-control" value="${product.productAlias}"> --%>
                    <input type="text" name="productAlias" class="form-control" value="미쿠 15주년 버전">
                </div>

                <%-- 제조사 --%>
                <div class="col-md-6">
                    <label class="form-label fw-bold">제조사 <span class="text-danger">*</span></label>
                    <select name="makerId" class="form-select" required>
                        <%-- [Controller 연결 후 활성화]
                        <c:forEach var="m" items="${makerList}">
                            <option value="${m.makerId}" <c:if test="${product.makerId eq m.makerId}">selected</c:if>>${m.makerName}</option>
                        </c:forEach>
                        --%>
                        <option value="1" selected>굿스마일컴퍼니</option>
                        <option value="2">알터</option>
                        <option value="3">맥스팩토리</option>
                        <option value="4">코토부키야</option>
                    </select>
                </div>

                <%-- 등급 --%>
                <div class="col-md-6">
                    <label class="form-label fw-bold">상품 등급 <span class="text-danger">*</span></label>
                    <select name="gradeCode" class="form-select" required>
                        <%-- [Controller 연결 후 활성화]
                        <c:forEach var="g" items="${gradeList}">
                            <option value="${g.gradeCode}" <c:if test="${product.gradeCode eq g.gradeCode}">selected</c:if>>${g.gradeName}</option>
                        </c:forEach>
                        --%>
                        <option value="S" selected>S (최상)</option>
                        <option value="A">A (상)</option>
                        <option value="B">B (중)</option>
                        <option value="C">C (하)</option>
                    </select>
                </div>

                <%-- 장르 --%>
                <div class="col-md-6">
                    <label class="form-label fw-bold">장르 <span class="text-danger">*</span></label>
                    <select name="genreCode" class="form-select" required>
                        <%-- [Controller 연결 후 활성화]
                        <c:forEach var="g" items="${genreList}">
                            <option value="${g.genreCode}" <c:if test="${product.genreCode eq g.genreCode}">selected</c:if>>${g.genreName}</option>
                        </c:forEach>
                        --%>
                        <option value="1" selected>애니메이션</option>
                        <option value="2">게임</option>
                        <option value="3">SF/로봇</option>
                        <option value="4">판타지</option>
                    </select>
                </div>

                <%-- 사이즈 --%>
                <div class="col-md-6">
                    <label class="form-label fw-bold">사이즈/스케일 <span class="text-danger">*</span></label>
                    <select name="sizeCode" class="form-select" required>
                        <%-- [Controller 연결 후 활성화]
                        <c:forEach var="s" items="${sizeList}">
                            <option value="${s.sizeCode}" <c:if test="${product.sizeCode eq s.sizeCode}">selected</c:if>>${s.sizeName}</option>
                        </c:forEach>
                        --%>
                        <option value="1">1/4 Scale</option>
                        <option value="2" selected>1/7 Scale</option>
                        <option value="3">1/8 Scale</option>
                        <option value="4">Nendoroid</option>
                        <option value="5">Pop Up Parade</option>
                    </select>
                </div>

                <%-- 작품명 --%>
                <div class="col-md-6">
                    <label class="form-label fw-bold">작품명</label>
                    <%-- <input type="text" name="workName" class="form-control" value="${product.workName}"> --%>
                    <input type="text" name="workName" class="form-control" value="VOCALOID">
                </div>

                <%-- 캐릭터명 --%>
                <div class="col-md-6">
                    <label class="form-label fw-bold">캐릭터명</label>
                    <%-- <input type="text" name="characterName" class="form-control" value="${product.characterName}"> --%>
                    <input type="text" name="characterName" class="form-control" value="하츠네 미쿠">
                </div>
            </div>

            <%-- ======================== 컬렉션 노트 섹션 ======================== --%>
            <p class="section-title">컬렉션 노트</p>
            <div class="row g-3 mb-4">

                <%-- 구매일시 --%>
                <div class="col-md-6">
                    <label class="form-label fw-bold">구매 시기</label>
                    <select name="purchaseDate" class="form-select">
                        <option value="">선택하세요</option>
                        <option value="1">1년 이내</option>
                        <option value="2">1년 ~ 3년</option>
                        <option value="3">3년 이상</option>
                    </select>
                </div>

                <%-- 개봉여부 --%>
                <div class="col-md-3">
                    <label class="form-label fw-bold">개봉 여부 <span class="text-danger">*</span></label>
                    <select name="openedCode" class="form-select" required>
                        <%-- [Controller 연결 후 활성화]
                        <c:forEach var="o" items="${openedList}">
                            <option value="${o.code}" <c:if test="${product.openedCode eq o.code}">selected</c:if>>${o.name}</option>
                        </c:forEach>
                        --%>
                        <option value="N" selected>미개봉</option>
                        <option value="Y">개봉</option>
                    </select>
                </div>

                <%-- 파츠 누락 여부 --%>
                <div class="col-md-3">
                    <label class="form-label fw-bold">파츠 누락 <span class="text-danger">*</span></label>
                    <select name="missingCode" class="form-select" required>
                        <%-- [Controller 연결 후 활성화]
                        <c:forEach var="m" items="${missingList}">
                            <option value="${m.code}" <c:if test="${product.missingCode eq m.code}">selected</c:if>>${m.name}</option>
                        </c:forEach>
                        --%>
                        <option value="N" selected>없음</option>
                        <option value="Y">있음</option>
                    </select>
                </div>

                <%-- 공개 여부 --%>
                <div class="col-md-6">
                    <label class="form-label fw-bold">공개 여부 <span class="text-danger">*</span></label>
                    <select name="publicCode" class="form-select" required>
                        <%-- [Controller 연결 후 활성화]
                        <c:forEach var="p" items="${publicList}">
                            <option value="${p.code}" <c:if test="${product.publicCode eq p.code}">selected</c:if>>${p.name}</option>
                        </c:forEach>
                        --%>
                        <option value="Y" selected>공개</option>
                        <option value="N">비공개</option>
                    </select>
                </div>

                <%-- 상세 설명 --%>
                <div class="col-12">
                    <label class="form-label fw-bold">상세 설명</label>
                    <textarea name="description" class="form-control" rows="4">${not empty product.description ? product.description : '2023년 굿스마일컴퍼니에서 출시한 하츠네 미쿠 1/7 스케일 피규어입니다.'}</textarea>
                </div>
            </div>

            <div class="d-flex gap-3 mt-5">
                <button type="button" class="btn btn-light w-50 py-3 fw-bold" onclick="history.back()">취소</button>
                <button type="submit" class="btn btn-primary w-50 py-3 fw-bold shadow">수정 완료</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
function showSinglePreview(input, previewId) {
    var preview = document.getElementById(previewId);
    preview.innerHTML = '';
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            var img = document.createElement('img');
            img.src = e.target.result;
            preview.appendChild(img);
        };
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
</body>
</html>
