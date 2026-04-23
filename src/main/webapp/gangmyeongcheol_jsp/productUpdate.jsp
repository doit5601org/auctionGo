<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>경매나라 - 컬렉션 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8fafd; font-family: 'Pretendard', sans-serif; }
        .navbar-brand { font-weight: 700; color: #4F46E5 !important; }
        
        /* 페이지 헤더 스타일 통일 */
        .page-header { background: white; border-bottom: 1px solid #e3f2fd; padding: 30px 0; margin-bottom: 30px; }
        .header-title { font-weight: 800; color: #222; }

        /* 카드 및 섹션 스타일 */
        .card-form { border: none; border-radius: 16px; box-shadow: 0 4px 20px rgba(0,0,0,0.05); background: white; padding: 35px; }    
        }

        /* 사진 업로드 스타일 */
        .current-img-wrapper { position: relative; display: inline-block; }
        .current-img { width: 100px; height: 100px; object-fit: cover; border-radius: 12px; border: 1px solid #eee; }
        .upload-box {
            border: 2px solid #dee2e6; border-radius: 12px; padding: 20px;
            text-align: center; background-color: #fafafa; cursor: pointer; transition: 0.2s;
            height: 100px; display: flex; flex-direction: column; justify-content: center; align-items: center;
        }
        .upload-box:hover { border-color: #4F46E5; background-color: #f5f6ff; color: #4F46E5; }
        .img-preview img { width: 100px; height: 100px; object-fit: cover; border-radius: 12px; margin-top: 10px; border: 2px solid #4F46E5; }

        /* 폼 요소 스타일 */
        .form-label { font-size: 14px; font-weight: 600; color: #444; margin-bottom: 8px; }
        .form-control, .form-select { border-radius: 8px; border: 1px solid #ddd; padding: 10px 15px; font-size: 14px; }
        .form-control:focus, .form-select:focus { border-color: #4F46E5; box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1); }

        /* 버튼 스타일 */
        
        .btn-update:hover { background-color: #3f38c5; color: white; }
        .btn-cancel:hover { background-color: #e9ecef; }
        
    </style>
</head>
<body>

<jsp:include page="/common/header.jsp"></jsp:include>

<div class="page-header">
    <div class="container text-center">
        <h2 class="header-title mb-1">컬렉션 정보 수정</h2>
    </div>
</div>

<div class="container pb-5" style="max-width: 800px;">
    <div class="card-form">
        <form action="productMyList.jsp" method="post" enctype="multipart/form-data">
            <input type="hidden" name="productId" value="1">

            <%-- 사진 섹션 --%>
            <p class="section-title">컬렉션 사진 관리</p>
            <div class="mb-5">
                <label class="form-label d-block mb-3">현재 등록된 사진 및 교체</label>
                <div class="row g-3">
                    <%-- 사진 1 --%>
                    <div class="col-4">
                        <div class="text-center mb-2">
                            <img src="https://placehold.co/100x100/e9ecef/6c757d?text=Photo+1" class="current-img" alt="">
                        </div>
                        <div class="upload-box" onclick="document.getElementById('img1').click()">
                            <i class="bi bi-camera fs-4 mb-1"></i>
                            <span class="small">교체하기</span>
                        </div>
                        <input type="file" id="img1" name="productImage1" accept="image/*" class="d-none" onchange="showSinglePreview(this, 'preview1')">
                        <div id="preview1" class="img-preview text-center"></div>
                    </div>
                    <%-- 사진 2 --%>
                    <div class="col-4">
                        <div class="text-center mb-2">
                            <img src="https://placehold.co/100x100/e9ecef/6c757d?text=Photo+2" class="current-img" alt="">
                        </div>
                        <div class="upload-box" onclick="document.getElementById('img2').click()">
                            <i class="bi bi-camera fs-4 mb-1"></i>
                            <span class="small">교체하기</span>
                        </div>
                        <input type="file" id="img2" name="productImage2" accept="image/*" class="d-none" onchange="showSinglePreview(this, 'preview2')">
                        <div id="preview2" class="img-preview text-center"></div>
                    </div>
                    <%-- 사진 3 --%>
                    <div class="col-4">
                        <div class="text-center mb-2">
                            <div class="current-img d-flex align-items-center justify-content-center bg-light text-muted small">없음</div>
                        </div>
                        <div class="upload-box" onclick="document.getElementById('img3').click()">
                            <i class="bi bi-camera fs-4 mb-1"></i>
                            <span class="small">추가하기</span>
                        </div>
                        <input type="file" id="img3" name="productImage3" accept="image/*" class="d-none" onchange="showSinglePreview(this, 'preview3')">
                        <div id="preview3" class="img-preview text-center"></div>
                    </div>
                </div>
            </div>

            <%-- 피규어 상세 정보 --%>
            <p class="section-title">피규어 상세 정보</p>
            <div class="row g-3 mb-4">
                <div class="col-12">
                    <label class="form-label">상품 발매명 <span class="text-danger">*</span></label>
                    <input type="text" name="productName" class="form-control" value="하츠네 미쿠 15th Anniversary 1/7 Scale" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">제조사 <span class="text-danger">*</span></label>
                    <select name="makerId" class="form-select" required>
                        <option value="1" selected>굿스마일컴퍼니</option>
                        <option value="2">알터</option>
                        <option value="3">코토부키야</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label">상품 등급 <span class="text-danger">*</span></label>
                    <select name="gradeCode" class="form-select" required>
                        <option value="S" selected>S (최상 - 미개봉/신품급)</option>
                        <option value="A">A (상 - 단순개봉/관리최상)</option>
                        <option value="B">B (중 - 전시감있음)</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label">장르 <span class="text-danger">*</span></label>
                    <select name="genreCode" class="form-select" required>
                        <option value="1" selected>애니메이션</option>
                        <option value="2">게임</option>
                        <option value="3">SF/로봇</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label">사이즈/스케일 <span class="text-danger">*</span></label>
                    <select name="sizeCode" class="form-select" required>
                        <option value="2" selected>1/7 Scale</option>
                        <option value="4">Nendoroid</option>
                    </select>
                </div>
            </div>

            <%-- 컬렉션 상태 노트 --%>
            <p class="section-title">컬렉션 상태 노트</p>
            <div class="row g-3 mb-4">
                <div class="col-md-4">
                    <label class="form-label">개봉 여부</label>
                    <select name="openedCode" class="form-select">
                        <option value="N" selected>미개봉</option>
                        <option value="Y">개봉</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label">파츠 누락</label>
                    <select name="missingCode" class="form-select">
                        <option value="N" selected>없음</option>
                        <option value="Y">있음</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label">공개 설정</label>
                    <select name="publicCode" class="form-select">
                        <option value="Y" selected>전체 공개</option>
                        <option value="N">비공개</option>
                    </select>
                </div>
                <div class="col-12">
                    <label class="form-label">상세 설명</label>
                    <textarea name="description" class="form-control" rows="5" placeholder="상품에 대한 구체적인 상태를 입력해 주세요.">2023년 굿스마일컴퍼니에서 출시한 하츠네 미쿠 15주년 기념 1/7 스케일 피규어입니다. 박스 채로 암소 보관하여 상태가 매우 좋습니다.</textarea>
                </div>
            </div>

            <%-- 하단 버튼 --%>
            <div class="row g-3 mt-4">
    <div class="col-6">
        <button type="submit" class="btn btn-primary w-100 py-3 fw-bold shadow-sm">
            수정 완료
        </button>
    </div>
    
    <div class="col-6">
        <button type="button" class="btn btn-outline-danger w-100 py-3 fw-bold" onclick="history.back()">
            취소
        </button>
    </div>
</div>

            </div>
        </form>
    </div>
</div>

<jsp:include page="/common/footer.jsp"></jsp:include>

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