<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 - 패널티 처리 이력</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .wf-header { font-weight: bold; background-color: #f8f9fa; border-bottom: 2px solid #ced4da; position: sticky; top: 0; z-index: 10; }
    .table-container { border: 1px solid #ced4da; background-color: #ffffff; min-height: 500px; overflow-y: auto; }
    th, td { padding: 12px !important; vertical-align: middle; text-align: center; }
</style>
</head>
<body class="bg-light">
    <div class="container-fluid py-4">
        <h4 class="fw-bold mb-4">패널티 처리 이력</h4>
        <div class="table-container shadow-sm">
            <table class="table table-hover mb-0">
                <thead class="wf-header">
                    <tr>
                        <th>순번</th>
                        <th>처리자</th>
                        <th>대상 유저</th>
                        <th>점수</th>
                        <th>사유</th>
                        <th>처리 일시</th>
                        <th>취소자</th>
                        <th>취소 사유</th>
                        <th>취소 일시</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>System</td>
                        <td>user_01</td>
                        <td><span class="badge bg-danger">2</span></td>
                        <td>허위 매물 등록</td>
                        <td>2026-04-19 14:20</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>