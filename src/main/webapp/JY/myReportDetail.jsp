<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>신고 상세 내역</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    /* 기존 스타일 가이드 반영 */
    .wf-input {
        background-color: #e9ecef;
        border: none;
        padding: 12px;
        border-radius: 5px;
    }

    .wf-label {
        font-weight: bold;
        margin-bottom: 8px;
        display: block;
        color: #333;
    }

    .btn-wf {
        background-color: #e9ecef;
        border: 1px solid #ced4da;
        padding: 10px 40px;
        font-weight: bold;
    }

    /* 상세 페이지 전용 스타일 */
    .section-title {
        border-left: 5px solid #ced4da;
        padding-left: 15px;
        margin-bottom: 25px;
        font-weight: bold;
    }

    .process-box {
        border: 2px solid #ced4da;
        border-radius: 10px;
        padding: 25px;
        margin-top: 40px;
    }

    .bg-approve { background-color: #f0fdf4; border-color: #bbf7d0; } /* 승인 시 배경 */
    .bg-reject { background-color: #fef2f2; border-color: #fecaca; }  /* 반려 시 배경 */
</style>
</head>
<body class="bg-light">

<div class="container mt-5 mb-5">
    <div class="row mb-5">
        <div class="col-12 text-center">
            <h1 class="fw-bold">신고 상세 내역</h1>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-lg-10 bg-white p-5 border shadow-sm">
            
            <h4 class="section-title">신고 정보</h4>
            <div class="row mb-4">
                <div class="col-md-3">
                    <label class="wf-label">종류</label>
                    <div class="wf-input">상품</div>
                </div>
                <div class="col-md-3">
                    <label class="wf-label">유형</label>
                    <div class="wf-input">광고</div>
                </div>
                <div class="col-md-6">
                    <label class="wf-label">신고 대상 이름</label>
                    <div class="wf-input">개쩌는 블루투스 샤워기</div>
                </div>
            </div>

            <div class="mb-4">
                <label class="wf-label">신고일자</label>
                <div class="wf-input">2026-04-19 14:20:11</div>
            </div>

            <div class="mb-4">
                <label class="wf-label">신고 상세 내용</label>
                <div class="wf-input" style="min-height: 150px; white-space: pre-wrap;">실제 상품과 전혀 다른 허위 광고성 글이 도배되고 있습니다. 조치 부탁드립니다.</div>
            </div>

            <div class="process-box bg-approve">
                <h5 class="fw-bold text-success mb-3">✅ 처리 결과: 승인</h5>
                <div class="mb-3">
                    <label class="wf-label">처리 사유</label>
                    <p class="mb-0">해당 사용자의 활동 이력을 확인한 결과, 반복적인 허위 매물 등록이 확인되어 계정 정지 및 게시글 삭제 조치하였습니다.</p>
                </div>
                <div class="text-muted small">처리 일시: 2026-04-21 10:30:00</div>
            </div>

            <div class="d-flex justify-content-center mt-5">
                <button type="button" class="btn btn-wf" onclick="history.back();">목록으로 돌아가기</button>
            </div>

        </div>
    </div>
</div>

</body>
</html>