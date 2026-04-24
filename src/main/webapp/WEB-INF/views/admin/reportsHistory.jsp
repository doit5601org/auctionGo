<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 - 신고 처리 이력</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .wf-header { font-weight: bold; background-color: #f8f9fa; border-bottom: 2px solid #ced4da; }
    .table-container { border: 1px solid #ced4da; background-color: #ffffff; min-height: 500px; }
    th, td { padding: 12px !important; vertical-align: middle; text-align: center; }
    .search-bar { background-color: #fff; border: 1px solid #ced4da; border-radius: 4px; padding: 20px; margin-bottom: 25px; }
    .btn-search { background-color: #212529; color: white; min-width: 100px; }
</style>
</head>
<body class="bg-light">
    <div class="container-fluid py-4">
        <h4 class="fw-bold mb-4">신고 처리 완료 이력</h4>

        <div class="search-bar shadow-sm">
            <form class="row g-3 align-items-end">
                <div class="col-md-4">
                    <label class="form-label fw-bold small">처리 일자</label>
                    <div class="d-flex align-items-center gap-2">
                        <input type="date" class="form-control">
                        <span>~</span>
                        <input type="date" class="form-control">
                    </div>
                </div>
                <div class="col-md-5">
                    <label class="form-label fw-bold small">검색어 (신고자, 처리자, 제목)</label>
                    <input type="text" class="form-control" placeholder="검색어를 입력하세요">
                </div>
                <div class="col-md-3">
                    <button type="button" class="btn btn-search w-100">검색</button>
                </div>
            </form>
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
                        <th>처리자</th>
                        <th>처리일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>4</td>
                        <td><span class="badge bg-light text-dark border">부적절 상품</span></td>
                        <td class="text-start">피규어가 아닌 상품이 올라와 있음.</td>
                        <td>라라라</td>
                        <td>2026-02-25</td>
                        <td>관리자1</td>
                        <td>2026-02-26</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td><span class="badge bg-light text-dark border">광고 신고</span></td>
                        <td class="text-start">도박 광고 게시되어 있음</td>
                        <td>다다다</td>
                        <td>2026-01-25</td>
                        <td>관리자1</td>
                        <td>2026-01-26</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>