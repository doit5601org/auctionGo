<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> <%-- JSTL 태그 추가 --%>
<!DOCTYPE html>
<html lang="ko">
<body class="bg-light">
<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-lg-10 bg-white p-5 border shadow-sm">
            <h4 class="section-title">신고 정보</h4>
            <div class="row mb-4">
                <div class="col-md-3">
                    <label class="wf-label">카테고리</label>
                    <div class="wf-input">${dto.category}</div>
                </div>
                <div class="col-md-3">
                    <label class="wf-label">유형</label>
                    <div class="wf-input">${dto.reportType}</div>
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
                <div class="wf-input" style="min-height: 150px; white-space: pre-wrap;">${dto.reportReason}</div>
            </div>

            <%-- 처리 결과 섹션 분기 --%>
            <c:choose>
                <c:when test="${not empty dto.status}">
                    <div class="process-box ${dto.status == '승인' ? 'bg-approve' : 'bg-reject'}">
                        <h5 class="fw-bold ${dto.status == '승인' ? 'text-success' : 'text-danger'} mb-3">
                            ${dto.status == '승인' ? '✅ 처리 결과: 승인' : '❌ 처리 결과: 반려'}
                        </h5>
                        <div class="mb-3">
                            <label class="wf-label">처리 사유</label>
                            <p class="mb-0">${dto.processReason}</p>
                        </div>
                        <div class="text-muted small">처리 일시: ${dto.processAt}</div>
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