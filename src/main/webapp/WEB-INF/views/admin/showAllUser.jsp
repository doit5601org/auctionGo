<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 - 회원 관리 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .wf-header {
        font-weight: bold;
        background-color: #f8f9fa;
        border-bottom: 2px solid #ced4da;
        position: sticky;
        top: 0;
        z-index: 10;
    }
    
    .user-row {
        cursor: pointer;
        transition: background-color 0.2s;
    }
    
    .user-row:hover {
        background-color: #f1f3f5;
    }
    
    .table-container {
        border: 1px solid #ced4da;
        background-color: #ffffff;
        min-height: 600px; /* 20명 출력 시 적당한 높이 */
    }

    th, td {
        padding: 12px !important;
        vertical-align: middle;
    }

    /* 제재 유무 상태 스타일 */
    .status-normal { color: #0d6efd; font-weight: bold; }
    .status-penalty { color: #dc3545; font-weight: bold; }

    /* 페이징 스타일 커스텀 */
    .pagination {
        margin-bottom: 0;
    }
    .page-link {
        color: #333;
        border-color: #ced4da;
    }
    .page-item.active .page-link {
        background-color: #6c757d;
        border-color: #6c757d;
        color: white;
    }
    .btn-wf {
        background-color: #e9ecef;
        border: 1px solid #ced4da;
        padding: 8px 30px;
        font-weight: bold;
        color: #212529; /* 글자색 명시 */
        text-decoration: none;
        display: inline-block;
        transition: all 0.2s;
    }

    .btn-wf:hover {
        background-color: #dee2e6;
        border-color: #adb5bd;
        color: #000;
    }
</style>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row mb-4 align-items-end">
        <div class="col-md-6">
            <h1 class="fw-bold">전체 회원 목록</h1>
            <p class="text-muted">총 회원 수: <span class="text-primary fw-bold">128</span>명 (20명씩 보기)</p>
        </div>
        <div class="col-md-6">
            <div class="input-group">
                <select class="form-select" style="max-width: 120px;">
                    <option value="id">아이디</option>
                    <option value="name">이름</option>
                </select>
                <input type="text" class="form-control" placeholder="회원 검색...">
                <button class="btn btn-dark" type="button">검색</button>
            </div>
        </div>
    </div>

    <div class="table-container shadow-sm">
        <table class="table text-center table-hover">
            <thead class="wf-header">
                <tr>
                    <th>고유키</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>가입일</th>
                    <th>상태</th>
                </tr>
            </thead>
            <tbody>
                <%-- 실제 구현 시에는 c:forEach를 사용하세요 --%>
                <%-- 예시 데이터: 제재 유저 --%>
                <tr class="user-row" onclick="location.href='userDetail.do?key=128'">
                    <td>128</td>
                    <td>user01</td>
                    <td>홍길동</td>
                    <td>010-1234-5678</td>
                    <td>2026-04-20</td>
                    <td><span class="badge rounded-pill bg-danger">제재중</span></td>
                </tr>
                <%-- 예시 데이터: 정상 유저 --%>
                <c:forEach var="i" begin="2" end="20">
                <tr class="user-row" onclick="location.href='userDetail.do?key=${128-i}'">
                    <td>${128-i}</td>
                    <td>auction_user${i}</td>
                    <td>사용자${i}</td>
                    <td>010-0000-00${i}</td>
                    <td>2026-04-19</td>
                    <td><span class="badge rounded-pill bg-primary">정상</span></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="row mt-4">
        <div class="col-12 d-flex justify-content-center">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    
<div class="d-flex justify-content-end mb-5">
        <button type="button" class="btn btn-wf" onclick="history.back();">돌아가기</button>
    </div>
</div>

</body>
</html>