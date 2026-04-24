<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 - 신고 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .wf-header { font-weight: bold; background-color: #f8f9fa; border-bottom: 2px solid #ced4da; }
    .table-container { border: 1px solid #ced4da; background-color: #ffffff; min-height: 600px; }
    th, td { padding: 12px !important; vertical-align: middle; text-align: center; }
    .filter-btn-group .btn { padding: 8px 25px; font-weight: bold; }
    .report-row { cursor: pointer; transition: background-color 0.2s; }
    .report-row:hover { background-color: #f8f9fa; }
</style>
</head>
<body class="bg-light">
    <div class="container-fluid py-4">
        <h4 class="fw-bold mb-4">신고 접수 목록</h4>
        
        <div class="filter-btn-group mb-3 d-flex gap-2">
            <button type="button" class="btn btn-dark">전체</button>
            <button type="button" class="btn btn-outline-dark">미확인</button>
            <button type="button" class="btn btn-outline-dark">처리중</button>
        </div>

        <div class="table-container shadow-sm">
            <table class="table table-hover mb-0">
                <thead class="wf-header">
                    <tr>
                        <th>순번</th>
                        <th>신고 카테고리</th>
                        <th>신고 제목</th>
                        <th>신고자</th>
                        <th>신고일</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="report-row" onclick="location.href='reportsProcess.jsp'">
                        <td>4</td>
                        <td><span class="badge bg-secondary">부적절 상품</span></td>
                        <td class="text-start">피규어가 아닌 상품이 올라와 있음.</td>
                        <td>라라라</td>
                        <td>2026-02-25 17:55</td>
                        <td><span class="badge rounded-pill bg-warning text-dark">미확인</span></td>
                    </tr>
                    <tr class="report-row" onclick="location.href='reportsProcess.jsp'">
                        <td>3</td>
                        <td><span class="badge bg-secondary">광고 신고</span></td>
                        <td class="text-start">도박 광고 게시되어 있음</td>
                        <td>다다다</td>
                        <td>2026-01-25 16:55</td>
                        <td><span class="badge rounded-pill bg-info text-dark">처리중</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>