<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 - 전체 상품 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .wf-header { font-weight: bold; background-color: #f8f9fa; border-bottom: 2px solid #ced4da; }
    .table-container { border: 1px solid #ced4da; background-color: #ffffff; min-height: 600px; }
    .product-thumb { width: 60px; height: 60px; object-fit: cover; border-radius: 4px; border: 1px solid #dee2e6; }
    th, td { padding: 12px !important; vertical-align: middle; text-align: center; }
</style>
</head>
<body class="bg-light">
    <div class="container-fluid py-4">
        <h4 class="fw-bold mb-4">전체 상품 목록 관리</h4>
        <div class="table-container shadow-sm">
            <table class="table table-hover mb-0">
                <thead class="wf-header">
                    <tr>
                        <th>이미지</th>
                        <th>등록 회원</th>
                        <th>공개 여부</th>
                        <th>상품명 / 별칭</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><img src="${ pageContext.request.contextPath }/images/tempFigureImage.png" class="product-thumb"></td>
                        <td>회원1</td>
                        <td><span class="badge bg-success">공개</span></td>
                        <td class="text-start">하츠네 미쿠 피규어 <br><small class="text-muted">한정판</small></td>
                        <td>
                            <button class="btn btn-sm btn-outline-dark me-1">비공개</button>
                            <button class="btn btn-sm btn-outline-danger">패널티</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>