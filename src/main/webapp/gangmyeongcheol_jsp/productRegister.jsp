<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>나의 컬렉션 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<style>
    /* 배경색을 좀 더 진하고 선명한 블루 톤으로 변경 */
    body { background-color: #e3f2fd; }
    
    .navbar { background: white; border-bottom: 1px solid #bbdefb; }
    .navbar-brand { color: #1976d2 !important; font-weight: 800; }
    
    /* 헤더: 좀 더 진한 블루 그라데이션 */
    .page-header { 
        background: linear-gradient(135deg, #2196f3 0%, #1565c0 100%); 
        color: white; padding: 30px 24px; border-radius: 15px; margin-bottom: 30px;
        box-shadow: 0 4px 15px rgba(21, 101, 192, 0.3);
    }
    
    .card { border: none; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.08); }
    
    /* 섹션 타이틀: 진한 파란색 포인트 */
    .section-title { 
        font-size: 14px; font-weight: 700; color: #1976d2; 
        margin-bottom: 15px; padding-left: 10px; border-left: 4px solid #2196f3; 
    }
    
    /* 업로드 박스 */
    .upload-box { 
        border: 2px dashed #90caf9; border-radius: 12px; padding: 40px; 
        text-align: center; background-color: #f8fbff; cursor: pointer; transition: 0.3s;
    }
    .upload-box:hover { border-color: #1976d2; background-color: #e3f2fd; }
    
    .form-label { font-size: 13px; color: #37474f; }
    
    /* 버튼: 진한 파란색 커스텀 */
    .btn-primary { 
        background-color: #1976d2; border: none; 
    }
    .btn-primary:hover { 
        background-color: #0d47a1; 
    }
    .btn-light {
        background-color: #cfd8dc;
        color: #37474f;
        border: none;
    }
    .btn-light:hover {
        background-color: #b0bec5;
    }
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">경매나라</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-4">
                <li class="nav-item">
                    <a href="auctionList.jsp" class="nav-link">경매</a>
                </li>
                <li class="nav-item">
                    <a href="productList.jsp" class="nav-link">컬렉션</a>
                </li>
                <li class="nav-item">
                    <a href="productMyList.jsp" class="nav-link fw-bold" style="color: #1976d2;">내 상품</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5" style="max-width:720px">
    <div class="page-header text-center">
        <h4 class="mb-1 fw-bold">나의 컬렉션 자랑하기</h4>
        <p class="mb-0 small opacity-90">당신의 소중한 피규어를 컬렉터들에게 소개해 보세요.</p>
    </div>

    <div class="card p-4">
        <form action="productMyList.jsp" method="post" enctype="multipart/form-data">

            <p class="section-title">컬렉션 사진 (최고의 각도로 찍어주세요!)</p>
            <div class="mb-4">
                <div class="upload-box" onclick="document.getElementById('imgInput').click()">
                    <i class="bi bi-camera-fill fs-1" style="color: #1976d2;"></i>
                    <p class="fw-bold mb-1 mt-2">사진 업로드</p>
                    <p class="text-muted mb-0 small">전신, 근접샷 등 다양한 각도의 사진을 환영합니다 (최대 10장)</p>
                </div>
                <input type="file" id="imgInput" name="productImages" multiple accept="image/*" class="d-none">
            </div>

            <p class="section-title">피규어 정보</p>
            <div class="row g-3 mb-4">
                <div class="col-12">
                    <label class="form-label fw-bold">컬렉션 이름 <span class="text-danger">*</span></label>
                    <input type="text" name="productName" class="form-control" placeholder="예: 하츠네 미쿠 15주년 기념 버전" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">제조사 <span class="text-danger">*</span></label>
                    <select name="makerId" class="form-select" required>
                        <option value="">선택하세요</option>
                        <option>굿스마일컴퍼니</option>
                        <option>알터</option>
                        <option>맥스팩토리</option>
                        <option>코토부키야</option>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">사이즈/스케일 <span class="text-danger">*</span></label>
                    <select name="sizeId" class="form-select" required>
                        <option value="">선택하세요</option>
                        <option>1/4 Scale</option>
                        <option>1/7 Scale</option>
                        <option>1/8 Scale</option>
                        <option>Nendoroid</option>
                        <option>Pop Up Parade</option>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">작품명</label>
                    <input type="text" name="workName" class="form-control" placeholder="애니메이션/게임 제목">
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold">캐릭터명</label>
                    <input type="text" name="characterName" class="form-control" placeholder="캐릭터 이름">
                </div>
            </div>

            <p class="section-title">컬렉션 노트</p>
            <div class="row g-3 mb-4">
                <div class="col-md-6">
                    <label class="form-label fw-bold">소장 기간</label>
                    <select name="collectPeriod" class="form-select">
                        <option value="">선택하세요</option>
                        <option>1년 미만</option>
                        <option>1년~3년</option>
                        <option>3년 이상</option>
                        <option>출시 당시 예약구매</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold">전시 상태</label>
                    <select name="displayStatus" class="form-select">
                        <option>장식장 내 상시 전시</option>
                        <option>미개봉 소장</option>
                        <option>단기 전시 후 보관</option>
                    </select>
                </div>
                <div class="col-12">
                    <label class="form-label fw-bold">소개글</label>
                    <textarea name="description" class="form-control" rows="4"
                              placeholder="자신의 피규어를 마음껏 자랑하세요!!"></textarea>
                </div>
            </div>

            <div class="d-flex gap-3 mt-5">
                <button type="button" class="btn btn-light w-50 py-3 fw-bold" onclick="history.back()">돌아가기</button>
                <button type="submit" class="btn btn-primary w-50 py-3 fw-bold shadow">나의 컬렉션 등록하기</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>