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

<%-- [Controller 연결 후] request.setAttribute("errorMsg", msg) 전달 시 표시
<c:if test="${not empty errorMsg}">
    <div class="container mt-3">
        <div class="alert alert-danger">${errorMsg}</div>
    </div>
</c:if>
--%>

<div class="container mt-4 mb-5" style="max-width:720px">
    <div class="page-header text-center">
        <h4 class="mb-1 fw-bold">나의 컬렉션 자랑하기</h4>
        <p class="mb-0 small opacity-90">당신의 소중한 피규어를 뽐내세요!!</p>
    </div>

    <div class="card p-4">
        <%-- [Controller 연결 후] action을 ${ctx}/product/register 로 변경 --%>
        <form action="productMyList.jsp" method="post" enctype="multipart/form-data">

            <%-- ======================== 사진 섹션 (최대 3장) ======================== --%>
            <p class="section-title">컬렉션 사진 (최고의 각도로 찍어주세요!)</p>
            <div class="mb-4">
                <div class="row g-3">
                    <div class="col-4">
                        <p class="form-label fw-bold text-center mb-1">사진 1 <span class="text-danger">*</span></p>
                        <div class="upload-box" onclick="document.getElementById('img1').click()">
                            <i class="bi bi-camera-fill fs-3" style="color:#1976d2;"></i>
                            <p class="mb-0 small mt-1">메인 사진</p>
                        </div>
                        <input type="file" id="img1" name="productImage1" accept="image/*" class="d-none" onchange="showSinglePreview(this, 'preview1')">
                        <div id="preview1" class="img-preview justify-content-center"></div>
                    </div>
                    <div class="col-4">
                        <p class="form-label fw-bold text-center mb-1">사진 2</p>
                        <div class="upload-box" onclick="document.getElementById('img2').click()">
                            <i class="bi bi-camera-fill fs-3" style="color:#90caf9;"></i>
                            <p class="mb-0 small mt-1">추가 사진</p>
                        </div>
                        <input type="file" id="img2" name="productImage2" accept="image/*" class="d-none" onchange="showSinglePreview(this, 'preview2')">
                        <div id="preview2" class="img-preview justify-content-center"></div>
                    </div>
                    <div class="col-4">
                        <p class="form-label fw-bold text-center mb-1">사진 3</p>
                        <div class="upload-box" onclick="document.getElementById('img3').click()">
                            <i class="bi bi-camera-fill fs-3" style="color:#90caf9;"></i>
                            <p class="mb-0 small mt-1">추가 사진</p>
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
                    <input type="text" name="productName" class="form-control"
                           placeholder="예: 하츠네 미쿠 15th Anniversary 1/7 Scale" required>
                </div>

                <%-- 상품 별칭 --%>
                <div class="col-12">
                    <label class="form-label fw-bold">상품 별칭 <span class="text-muted fw-normal">(나만의 이름)</span></label>
                    <input type="text" name="productAlias" class="form-control"
                           placeholder="예: 미쿠 15주년 버전">
                </div>

                <%-- 제조사 --%>
                <div class="col-md-6">
                    <label class="form-label fw-bold">제조사 <span class="text-danger">*</span></label>
                    <select name="makerId" class="form-select" required>
                        <option value="">선택하세요</option>
                        <%-- [Controller 연결 후 활성화]
                        <c:forEach var="m" items="${makerList}">
                            <option value="${m.makerId}">${m.makerName}</option>
                        </c:forEach>
                        --%>
                        <option value="1">굿스마일컴퍼니</option>
                        <option value="2">알터</option>
                        <option value="3">맥스팩토리</option>
                        <option value="4">코토부키야</option>
                    </select>
                </div>

                <%-- 등급 --%>
                <div class="col-md-6">
                    <label class="form-label fw-bold">상품 등급 <span class="text-danger">*</span></label>
                    <select name="gradeCode" class="form-select" required>
                        <option value="">선택하세요</option>
                        <%-- [Controller 연결 후 활성화]
                        <c:forEach var="g" items="${gradeList}">
                            <option value="${g.gradeCode}">${g.gradeName}</option>
                        </c:forEach>
                        --%>
                        <option value="S">S (최상)</option>
                        <option value="A">A (상)</option>
                        <option value="B">B (중)</option>
                        <option value="C">C (하)</option>
                    </select>
                </div>

                <%-- 장르 --%>
                <div class="col-md-6">
                    <label class="form-label fw-bold">장르 <span class="text-danger">*</span></label>
                    <select name="genreCode" class="form-select" required>
                        <option value="">선택하세요</option>
                        <%-- [Controller 연결 후 활성화]
                        <c:forEach var="g" items="${genreList}">
                            <option value="${g.genreCode}">${g.genreName}</option>
                        </c:forEach>
                        --%>
                        <option value="1">애니메이션</option>
                        <option value="2">게임</option>
                        <option value="3">SF/로봇</option>
                        <option value="4">판타지</option>
                    </select>
                </div>

                <%-- 사이즈 --%>
                <div class="col-md-6">
                    <label class="form-label fw-bold">사이즈/스케일 <span class="text-danger">*</span></label>
                    <select name="sizeCode" class="form-select" required>
                        <option value="">선택하세요</option>
                        <%-- [Controller 연결 후 활성화]
                        <c:forEach var="s" items="${sizeList}">
                            <option value="${s.sizeCode}">${s.sizeName}</option>
                        </c:forEach>
                        --%>
                        <option value="1">1/4 Scale</option>
                        <option value="2">1/7 Scale</option>
                        <option value="3">1/8 Scale</option>
                        <option value="4">Nendoroid</option>
                        <option value="5">Pop Up Parade</option>
                    </select>
                </div>

                <%-- 작품명 --%>
                <div class="col-md-6">
                    <label class="form-label fw-bold">작품명</label>
                    <input type="text" name="workName" class="form-control" placeholder="애니메이션/게임 제목">
                </div>

                <%-- 캐릭터명 --%>
                <div class="col-md-6">
                    <label class="form-label fw-bold">캐릭터명</label>
                    <input type="text" name="characterName" class="form-control" placeholder="캐릭터 이름">
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
                        <option value="">선택</option>
                        <%-- [Controller 연결 후 활성화]
                        <c:forEach var="o" items="${openedList}">
                            <option value="${o.code}">${o.name}</option>
                        </c:forEach>
                        --%>
                        <option value="N">미개봉</option>
                        <option value="Y">개봉</option>
                    </select>
                </div>

                <%-- 파츠 누락 여부 --%>
                <div class="col-md-3">
                    <label class="form-label fw-bold">파츠 누락 <span class="text-danger">*</span></label>
                    <select name="missingCode" class="form-select" required>
                        <option value="">선택</option>
                        <%-- [Controller 연결 후 활성화]
                        <c:forEach var="m" items="${missingList}">
                            <option value="${m.code}">${m.name}</option>
                        </c:forEach>
                        --%>
                        <option value="N">없음</option>
                        <option value="Y">있음</option>
                    </select>
                </div>

                <%-- 공개 여부 --%>
                <div class="col-md-6">
                    <label class="form-label fw-bold">공개 여부 <span class="text-danger">*</span></label>
                    <select name="publicCode" class="form-select" required>
                        <%-- [Controller 연결 후 활성화]
                        <c:forEach var="p" items="${publicList}">
                            <option value="${p.code}">${p.name}</option>
                        </c:forEach>
                        --%>
                        <option value="Y">공개</option>
                        <option value="N">비공개</option>
                    </select>
                </div>

                <%-- 상세 설명 --%>
                <div class="col-12">
                    <label class="form-label fw-bold">상세 설명</label>
                    <textarea name="description" class="form-control" rows="4"
                              placeholder="자신의 피규어를 마음껏 자랑하세요!!"></textarea>
                </div>
            </div>

            <div class="d-flex gap-3 mt-5">
                <button type="button" class="btn btn-light w-50 py-3 fw-bold" onclick="history.back()">돌아가기</button>
                <button type="submit" class="btn btn-primary w-50 py-3 fw-bold shadow">등록하기</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
// 이미지 1장씩 미리보기
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
