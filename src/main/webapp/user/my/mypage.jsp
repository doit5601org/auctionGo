<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지 - Auction PKG</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>
<body class="bg-light">

    <jsp:include page="/common/header.jsp" />

    <div class="container" style="margin-top: 50px; margin-bottom: 50px;">
        <div class="row">
            <aside class="col-md-3">
                <jsp:include page="/common/mypage_layout.jsp" /> 
            </aside>
            <section class="col-md-9">
                <div class="card shadow-sm p-4 bg-white">
                    <h3 class="mb-4">나의 활동 요약</h3>
                    
                    <div class="row g-3">
                        <div class="col-md-4">
                            <div class="p-3 border rounded text-center">
                                <small class="text-muted">진행중인 경매</small>
                                <h4 class="mt-2 fw-bold"><span>5</span>건</h4>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="p-3 border rounded text-center">
                                <small class="text-muted">진행중인 입찰</small>
                                <h4 class="mt-2 fw-bold"><span>3</span>건</h4>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="p-3 border rounded text-center">
                                <small class="text-muted">내 관심 상품</small>
                                <h4 class="mt-2 fw-bold"><span>12</span>건</h4>
                            </div>
                        </div>
                    </div>

                    <div class="mt-5">
                        <h5>최근 입찰내역</h5>
                        <hr>
                        <table class="table table-hover mt-3">
                            <thead class="table-light">
                                <tr>
                                    <th>상품명</th>
                                    <th>금액</th>
                                    <th>상태</th>
                                    <th>마감기한</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                    	아이언맨 피규어</td>
                                    <td>120,000원</td>
                                    <td><span class="badge bg-success">최고입찰</span></td>
                                   	<td class="text-danger">00:24:57</td>
                                </tr>
                                <tr>
                                    <td>도라에몽 피규어</td>
                                    <td>18,000원</td>
                                    <td><span class="badge bg-danger">2순위</span></td>
                                   	<td class="text-danger">76:12:08</td>
                                </tr>
                                <tr>
                                    <td>해리포터 피규어</td>
                                    <td>480,000원</td>
                                    <td><span class="badge bg-primary">낙찰</span></td>
                                   	<td class="text-danger">07:26:35</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
            
        </div>
    </div>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>