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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/money.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="body">
		<div class="tot">
			<div class="bid">
				<span>보증금</span>
				<hr />
				<a href=""><span class="view">40000</span></a>
			</div>
			<div class="bid">
				<span>머니</span>
				<hr />
				<a href=""><span class="view">15000</span></a>
			</div>

		</div>
		<div class="sel">

			<select class="form-select" aria-label="Default select example">
				<option selected>머니 구분</option>
				<option value="1">보증금</option>
				<option value="2">머니</option>
			</select>
			
			<select class="form-select" aria-label="Default select example">
				<option selected>머니 구분</option>
				<option value="1">보증금</option>
				<option value="2">머니</option>
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
		
		<table>
			<tr>
				<th>일자</th>
				<th>머니종류</th>
				<th>참여종류</th>
				<th>입출금</th>
				<th>금액</th>
			</tr>
			<tr>
				<td>2025-11-11</td>
				<td>보증금</td>
				<td>판매자</td>
				<td>출금</td>
				<td>40000</td>
			</tr>
			<tr>
				<td>2025-11-11</td>
				<td>보증금</td>
				<td>구매자</td>
				<td>입금</td>
				<td>40000</td>
			</tr>
			<tr>
				<td>2025-11-11</td>
				<td>머니</td>
				<td>낙찰결제</td>
				<td>출금</td>
				<td>158000</td>
			</tr>
			<tr>
				<td>2025-11-11</td>
				<td>머니</td>
				<td>충전</td>
				<td>입금</td>
				<td>40000</td>
			</tr>
		</table>
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