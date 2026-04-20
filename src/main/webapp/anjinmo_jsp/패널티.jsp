<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/money.css">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>
</head>
</head>
<body>
	<div class="body">
		 <div class="btn-group" role="group" aria-label="Basic example">
			<button type="button" class="btn btn-secondary">판매자패널티</button>
			<button type="button" class="btn btn-secondary">구매자패널티</button>
		
		</div> 
			<!-- <div class="btn-group" role="group"
				aria-label="Basic radio toggle button group">
				<input type="radio" class="btn-check" name="btnradio" id="btnradio1"
					autocomplete="off" checked> <label
					class="btn btn-outline-secondary" for="btnradio1">판매자 패널티</label> <input
					type="radio" class="btn-check" name="btnradio" id="btnradio2"
					autocomplete="off"> <label
					class="btn btn-outline-secondary" for="btnradio2">구매자 패널티</label>
		 --><div class="sel">

			<select class="form-select" aria-label="Default select example">
				<option selected>종류</option>
				<option value="1">패널티추가</option>
				<option value="2">패널티취소</option>
			</select>
			<div class="row">
				<div class="col">
					<input type="text" class="form-control" placeholder="First day"
						aria-label="First name">
				</div>
				~
				<div class="col">
					<input type="text" class="form-control" placeholder="Last day"
						aria-label="Last name">
				</div>
			</div>
			<button type="button" class="btn btn-dark">검색</button>
		</div>

		<div class="list">
			<ol class="list-group list-group-numbered">
				<li
					class="list-group-item d-flex justify-content-between align-items-start">
					<div class="ms-2 me-auto">
						<div class="fw-bold">판매등록취소</div>
						2025-01-15
					</div> <span class="badge text-bg-danger rounded-pill">1차경고</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-start">
					<div class="ms-2 me-auto">
						<div class="fw-bold">판매등록취소</div>
						2025-03-14 ~ 2025-03-21
					</div> <span class="badge text-bg-danger rounded-pill">7일 이용 정지</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-start">
					<div class="ms-2 me-auto">
						<div class="fw-bold">판매등록취소</div>
						2025-03-15
					</div> <span class="badge text-bg-secondary rounded-pill " >취소</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-start">
					<div class="ms-2 me-auto">
						<div class="fw-bold">낙찰미결제</div>
						2026-03-10
					</div> <span class="badge text-bg-danger rounded-pill">1차경고</span>
				</li>
				
			</ol>
		</div>
		<div class="pagecontrol">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>