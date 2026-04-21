<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>쌍용피규어마켓 - 나의 컬렉션 수정</title>
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

        /* 업로드 박스 (register와 동일) */
        .upload-box {
            border: 2px dashed #90caf9; border-radius: 12px; padding: 40px;
            text-align: center; background-color: #f8fbff; cursor: pointer; transition: 0.3s;
        }
        .upload-box:hover { border-color: #1976d2; background-color: #e3f2fd; }

        /* 기존 이미지 썸네일 */
        .img-thumb-wrap { position: relative; display: inline-block; }
        .img-thumb-wrap img { width: 80px; height: 80px; object-fit: cover; border-radius: 8px; border: 2px solid #90caf9; }

        /* 새 이미지 미리보기 */
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
                <li class="nav-item"><a href="productMyList.jsp" class="nav-link fw-bold" style="color: #1976d2;">내 상품</a></li><%-- ${ctx}/product/myList --%>
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

            <%-- 상품 ID 히든 --%>
            <%-- <input type="hidden" name="productId" value="${product.productId}"> --%>
            <input type="hidden" name="productId" value="1">

            <%-- ======================== 사진 섹션 ======================== --%>
            <p class="section-title">컬렉션 사진</p>
            <div class="mb-4">

                <%-- 기존 이미지 표시 --%>
                <p class="form-label fw-bold mb-2">현재 등록된 사진</p>
                <div class="d-flex gap-2 flex-wrap mb-3">
                    <%-- [Controller 연결 후 활성화]
                    <div class="img-thumb-wrap">
                        <img src="${ctx}/images/${product.mainImage}" alt="메인">
                    </div>
                    <c:forEach var="img" items="${product.imageList}">
                        <div class="img-thumb-wrap">
                            <img src="${ctx}/images/${img}" alt="">
                        </div>
                    </c:forEach>
                    --%>
                    <%-- JSP 단독 실행용 샘플 기존 이미지 --%>
                    <div class="img-thumb-wrap">
                        <img src="https://placehold.co/80x80/e9ecef/6c757d?text=1" alt="">
                    </div>
                    <div class="img-thumb-wrap">
                        <img src="https://placehold.co/80x80/e9ecef/6c757d?text=2" alt="">
                    </div>
                </div>

                <%-- 새 이미지 업로드 (선택, 기존 이미지 교체) --%>
                <p class="form-label fw-bold mb-2">사진 교체 <span class="text-muted fw-normal">(선택, 최대 10장)</span></p>
                <div class="upload-box" onclick="document.getElementById('imgInput').click()">
                    <i class="bi bi-camera-fill fs-1" style="color: #1976d2;"></i>
                    <p class="fw-bold mb-1 mt-2">새 사진 업로드</p>
                    <p class="text-muted mb-0 small">업로드하면 기존 사진이 교체됩니다</p>
                </div>
                <input type="file" id="imgInput" name="productImages" multiple accept="image/*" class="d-none" onchange="showPreview(this)">
                <div class="img-preview" id="imgPreview"></div>
            </div>

            <%-- ======================== 피규어 정보 섹션 ======================== --%>
            <p class="section-title">피규어 정보</p>
            <div class="row g-3 mb-4">
                <div class="col-12">
                    <label class="form-label fw-bold">컬렉션 이름 <span class="text-danger">*</span></label>
                    <%-- <input type="text" name="productName" class="form-control" value="${product.productName}" required> --%>
                    <input type="text" name="productName" class="form-control" value="하츠네 미쿠 1/7 스케일 피규어" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">제조사 <span class="text-danger">*</span></label>
                    <select name="makerId" class="form-select" required>
                        <%-- [Controller 연결 후] c:forEach + selected 조건 활성화
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

                <div class="col-md-6">
                    <label class="form-label fw-bold">사이즈/스케일 <span class="text-danger">*</span></label>
                    <select name="sizeId" class="form-select" required>
                        <%-- [Controller 연결 후] c:forEach + selected 조건 활성화
                        <c:forEach var="s" items="${sizeList}">
                            <option value="${s.sizeId}" <c:if test="${product.sizeId eq s.sizeId}">selected</c:if>>${s.sizeName}</option>
                        </c:forEach>
                        --%>
                        <option value="1">1/4 Scale</option>
                        <option value="2" selected>1/7 Scale</option>
                        <option value="3">1/8 Scale</option>
                        <option value="4">Nendoroid</option>
                        <option value="5">Pop Up Parade</option>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">작품명</label>
                    <%-- <input type="text" name="workName" class="form-control" value="${product.workName}" placeholder="애니메이션/게임 제목"> --%>
                    <input type="text" name="workName" class="form-control" value="VOCALOID" placeholder="애니메이션/게임 제목">
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold">캐릭터명</label>
                    <%-- <input type="text" name="characterName" class="form-control" value="${product.characterName}" placeholder="캐릭터 이름"> --%>
                    <input type="text" name="characterName" class="form-control" value="하츠네 미쿠" placeholder="캐릭터 이름">
                </div>
            </div>

            <%-- ======================== 컬렉션 노트 섹션 ======================== --%>
            <p class="section-title">컬렉션 노트</p>
            <div class="row g-3 mb-4">
                <div class="col-md-6">
                    <label class="form-label fw-bold">소장 기간</label>
                    <select name="collectPeriod" class="form-select">
                        <%-- [Controller 연결 후] selected 조건 활성화 --%>
                        <option value="1">1년 미만</option>
                        <option value="2" selected>1년~3년</option>
                        <option value="3">3년 이상</option>
                        <option value="4">출시 당시 예약구매</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold">전시 상태</label>
                    <select name="displayStatus" class="form-select">
                        <%-- [Controller 연결 후] selected 조건 활성화 --%>
                        <option value="always" selected>장식장 내 상시 전시</option>
                        <option value="sealed">미개봉 소장</option>
                        <option value="stored">단기 전시 후 보관</option>
                    </select>
                </div>
                <div class="col-12">
                    <label class="form-label fw-bold">소개글</label>
                    <%-- <textarea name="description" class="form-control" rows="4">${product.description}</textarea> --%>
                    <textarea name="description" class="form-control" rows="4">수정내용입력</textarea>
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
// 새 이미지 선택 시 미리보기
function showPreview(input) {
    var preview = document.getElementById('imgPreview');
    preview.innerHTML = '';
    Array.from(input.files).slice(0, 10).forEach(function(file) {
        var reader = new FileReader();
        reader.onload = function(e) {
            var img = document.createElement('img');
            img.src = e.target.result;
            preview.appendChild(img);
        };
        reader.readAsDataURL(file);
    });
}
</script>
</body>
</html>
