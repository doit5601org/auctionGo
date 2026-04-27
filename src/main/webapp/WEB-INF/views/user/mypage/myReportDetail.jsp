<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>신고 상세 내역</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
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
    .bg-approve { background-color: #f0fdf4; border-color: #bbf7d0; }
    .bg-reject { background-color: #fef2f2; border-color: #fecaca; }
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
                    <div class="wf-input">${empty dto.reportTypeName ? '미분류' : dto.reportTypeName}</div>
                </div>
                <div class="col-md-3">
                    <label class="wf-label">유형</label>
                    <div class="wf-input">${empty dto.categoryName ? '기타' : dto.categoryName}</div>
                </div>
                <div class="col-md-6">
                    <label class="wf-label">신고 대상 이름</label>
                    <div class="wf-input">${dto.targetName}</div>
                </div>
            </div>

            <div class="mb-4">
                <label class="wf-label">신고일자</label>
                <div class="wf-input">${dto.createdAt}</div>
            </div>

            <div class="mb-4">
                <label class="wf-label">신고 상세 내용</label>
                <div class="wf-input" style="min-height: 150px; white-space: pre-wrap;">${dto.reportContent}</div>
            </div>

            <c:choose>
                <c:when test="${not empty dto.processDate}">
                    <div class="process-box ${dto.isApproved == 1 ? 'bg-approve' : 'bg-reject'}">
                        <h5 class="fw-bold ${dto.isApproved == 1 ? 'text-success' : 'text-danger'} mb-3">
                            ${dto.isApproved == 1 ? '✅ 처리 결과: 승인' : '❌ 처리 결과: 반려'}
                        </h5>
                        <div class="mb-3">
                            <label class="wf-label">처리 사유</label>
                            <p class="mb-0">${dto.processReason}</p>
                        </div>
                        <div class="text-muted small">처리 일시: ${dto.processDate}</div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="process-box bg-light">
                        <h5 class="fw-bold text-muted mb-0 text-center">⏳ 현재 처리 대기 중인 신고입니다.</h5>
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="d-flex justify-content-center mt-5">
                <button type="button" class="btn btn-wf" onclick="history.back();">목록으로 돌아가기</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>