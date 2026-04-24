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


	/* 페이지네이션 디자인 통일 */
	.pagination .page-link {
	    color: #212529;             /* 기본 글자색: 검정 */
	    border-color: #dee2e6;
	    padding: 8px 16px;
	}
	
	.pagination .page-item.active .page-link {
	    background-color: #212529 !important; /* 활성 페이지: 검정 배경 */
	    border-color: #212529 !important;
	    color: #ffffff !important;            /* 활성 페이지: 흰색 글자 */
	}
	
	.pagination .page-link:hover {
	    background-color: #f1f3f5;  /* 마우스 호버 시 연한 회색 */
	    color: #212529;
	}
	
	/* 처음으로/마지막으로 버튼 너비 조정 */
	.page-item .page-link span {
	    font-size: 0.9rem;
	}
	
	
	/* 필터 버튼 스타일 커스텀 */
	.filter-container {
	    background-color: #ffffff;
	    padding: 15px 20px;
	    border: 1px solid #ced4da;
	    border-radius: 4px;
	    margin-bottom: 20px;
	}
	
	.btn-check:checked + .btn-outline-dark {
	    background-color: #212529;
	    color: #ffffff;
	}
	
	.btn-outline-dark {
	    border-color: #ced4da;
	    color: #495057;
	    font-size: 0.95rem;
	    padding: 6px 20px;
	}
	
	.btn-outline-dark:hover {
	    background-color: #f8f9fa;
	    color: #212529;
	    border-color: #212529;
	}
</style>
</head>
<body class="bg-light">
    <div class="container-fluid py-4">
        <h4 class="fw-bold mb-4">전체 상품 목록 관리</h4>
        
        <!-- 필터 검색 영역 -->
        <div class="filter-container d-flex align-items-center justify-content-between">
		    <div class="d-flex align-items-center">
		        <span class="fw-bold me-3"><i class="bi bi-funnel-fill"></i> 상태 필터</span>
		        <div class="btn-group" role="group" aria-label="Product Status Filter">
		            <input type="radio" class="btn-check" name="statusFilter" id="filterAll" checked>
		            <label class="btn btn-outline-dark" for="filterAll">전체</label>
		            
		            <input type="radio" class="btn-check" name="statusFilter" id="filterPublic">
		            <label class="btn btn-outline-dark" for="filterPublic">공개</label>
		            
		            <input type="radio" class="btn-check" name="statusFilter" id="filterPrivate">
		            <label class="btn btn-outline-dark" for="filterPrivate">비공개</label>
		        </div>
		    </div>
		    
		    <div class="text-muted">
		        총 <span class="fw-bold text-dark">156</span>개의 상품
		    </div>
		</div>
        
        <!-- 실제 데이터 출력 영역 -->
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

		<!-- 페이지 버튼 영역 -->
		<div class="row mt-4 mb-3">
            <div class="col-12 d-flex justify-content-center">
                <nav aria-label="Page navigation">
                    <ul class="pagination mb-0">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="First">
                                <span aria-hidden="true">처음으로</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">11</a></li>

                        <li class="page-item active" aria-current="page">
		                    <span class="page-link">12</span>
		                </li>

                        <li class="page-item"><a class="page-link" href="#">13</a></li>
                        <li class="page-item"><a class="page-link" href="#">14</a></li>
		                <li class="page-item"><a class="page-link" href="#">15</a></li>
		                <li class="page-item"><a class="page-link" href="#">16</a></li>
		                <li class="page-item"><a class="page-link" href="#">17</a></li>
		                <li class="page-item"><a class="page-link" href="#">18</a></li>
		                <li class="page-item"><a class="page-link" href="#">19</a></li>
		                <li class="page-item"><a class="page-link" href="#">20</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Last">
                                <span aria-hidden="true">마지막으로</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

		<!-- 돌아가기 버튼 영역 -->
        <div class="d-flex justify-content-center mt-0 py-5">
            <button type="button" class="btn btn-secondary px-5 fw-bold" onclick="location.href='mainDashBoard.jsp'">
                대시보드로 돌아가기
            </button>
        </div>      

    </div>
</body>
</html>