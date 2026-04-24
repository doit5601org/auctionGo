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
        min-height: 600px;
    }

    th, td {
        padding: 12px !important;
        vertical-align: middle;
    }

    .btn-wf {
        background-color: #e9ecef;
        border: 1px solid #ced4da;
        padding: 8px 30px;
        font-weight: bold;
        color: #212529;
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
            <%-- 컨트롤러에서 보낸 리스트 크기를 동적으로 출력 --%>
            <p class="text-muted">총 회원 수: <span class="text-primary fw-bold">${userList.size()}</span>명 (현재 페이지 기준)</p>
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
                <%-- 1. 데이터가 있는 경우 반복문 실행 --%>
                <c:forEach var="user" items="${userList}">
                    <tr class="user-row" onclick="location.href='userDetail.do?key=${user.userKey}'">
                        <td>${user.userKey}</td>
                        <td>${user.userId}</td>
                        <td>${user.userName}</td>
                        <td>${user.userTel}</td>
                        <td>${user.userCreated}</td>
                        <td>
                            <%-- 2. 상태값에 따른 배지 색상 분기 처리 --%>
                            <c:choose>
                                <c:when test="${user.userStatus == '제재중'}">
                                    <span class="badge rounded-pill bg-danger">제재중</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge rounded-pill bg-primary">정상</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>

                <%-- 3. 데이터가 하나도 없을 경우의 예외 처리 --%>
                <c:if test="${empty userList}">
                    <tr>
                        <td colspan="6" class="text-center py-5 text-muted">
                            조회된 회원 정보가 없습니다.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

    <%-- 페이징 영역 (나중에 로직 연결 필요) --%>
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
                    <%-- 
                        추후 페이징 처리가 완료되면 이 부분을 
                        c:forEach를 이용해 동적으로 생성하게 됩니다.
                    --%>
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