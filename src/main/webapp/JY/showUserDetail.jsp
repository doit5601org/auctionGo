<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 - 회원 상세 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    /* 기본 카드 구조 */
    .info-card {
        background-color: #ffffff;
        border: 1px solid #ced4da;
        border-radius: 4px;
        overflow: hidden;
    }
    
    .info-header {
        font-weight: bold;
        background-color: #f8f9fa;
        border-bottom: 1px solid #ced4da;
        padding: 15px 20px;
    }
    
    /* 레이아웃 핵심: 행(Row) 설정 */
    .info-row {
        display: flex;
        border-bottom: 1px solid #dee2e6;
        align-items: stretch; /* 높이 균일화 */
    }
    
    .info-row:last-child {
        border-bottom: none;
    }

    /* 반 분할 아이템 (50%씩 점유) */
    .info-item {
        display: flex;
        width: 50%;
        align-items: center;
    }

    /* 라벨: 폭을 고정(140px)하여 데이터 시작점 통일 */
    .info-label {
        background-color: #f1f3f5;
        font-weight: bold;
        width: 140px;
        padding: 12px 20px;
        border-right: 1px solid #ced4da;
        flex-shrink: 0;
    }
    
    /* 데이터 영역 */
    .info-value {
        padding: 12px 20px;
        flex-grow: 1;
        background-color: #fff;
    }

    /* 신고 페이지 스타일 계승 */
    .btn-wf {
        background-color: #e9ecef;
        border: 1px solid #ced4da;
        padding: 8px 30px;
        font-weight: bold;
        color: #212529;
        transition: all 0.2s;
        text-decoration: none;
    }
    
    .btn-wf:hover {
        background-color: #dee2e6;
        border-color: #adb5bd;
    }

    .btn-penalty {
        background-color: #dc3545;
        color: white;
        border: none;
        padding: 8px 30px;
        font-weight: bold;
    }
    
    .btn-penalty:hover {
        background-color: #bb2d3b;
        color: white;
    }

    /* 모바일 대응 (화면 작아지면 한 줄로) */
    @media (max-width: 768px) {
        .info-row { flex-direction: column; }
        .info-item { width: 100%; border-bottom: 1px solid #dee2e6; }
        .info-item:last-child { border-bottom: none; }
    }
</style>
</head>
<body class="bg-light">

<div class="container mt-5 mb-5">
    <div class="row mb-4">
        <div class="col-12 text-center text-md-start">
            <h1 class="fw-bold">회원 상세 정보</h1>
        </div>
    </div>

    <div class="info-card shadow-sm mb-4">
        <div class="info-header">기본 계정 정보</div>
        <div class="info-body p-0">
            <div class="info-row">
                <div class="info-item">
                    <div class="info-label">회원고유키</div>
                    <div class="info-value">128</div>
                </div>
                <div class="info-item border-start">
                    <div class="info-label">아이디</div>
                    <div class="info-value">user01</div>
                </div>
            </div>
            
            <div class="info-row">
                <div class="info-item">
                    <div class="info-label">이름</div>
                    <div class="info-value">홍길동</div>
                </div>
                <div class="info-item border-start">
                    <div class="info-label">주민번호</div>
                    <div class="info-value">950101-1******</div>
                </div>
            </div>
            
            <div class="info-row">
                <div class="info-item">
                    <div class="info-label">이메일</div>
                    <div class="info-value">hong@example.com</div>
                </div>
                <div class="info-item border-start">
                    <div class="info-label">전화번호</div>
                    <div class="info-value">010-1234-5678</div>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label">주소</div>
                <div class="info-value">
                    서울특별시 강남구 삼성동 123-45, 101호
                </div>
            </div>

            <div class="info-row">
                <div class="info-item">
                    <div class="info-label">가입일시</div>
                    <div class="info-value">2026-04-10 14:22:05</div>
                </div>
                <div class="info-item border-start">
                    <div class="info-label">계정 상태</div>
                    <div class="info-value">
                        <span class="badge bg-primary">정상 활동 중</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-end mt-4">
        <button type="button" class="btn btn-wf" onclick="history.back();">돌아가기</button>
    </div>
</div>

</body>
</html>