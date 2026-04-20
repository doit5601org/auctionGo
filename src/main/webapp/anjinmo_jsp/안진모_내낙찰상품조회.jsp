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
<link rel="stylesheet type="
	text/css" href="${pageContext.request.contextPath }/css/biditem.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="body">
		<div class="box">
			<div class="tot">
				<div class="bid">
					<span>낙찰 상품</span>
					<hr />
					<a href=""><span class="view">7</span></a>
				</div>
				<div class="bid">
					<span>미결제 상품</span>
					<hr />
					<a href=""><span class="view">3</span></a>
				</div>
				<div class="bid">
					<span>배송완료 상품</span>
					<hr />
					<a href=""><span class="view">3</span></a>
				</div>
			</div>
		</div>
		<div class="box2">
			<a href="">
				<div class="categori">
					<span>낙찰 상품</span>
				</div>
			</a> <a href="">
				<div class="categori">
					<span>판매 상품</span>
				</div>
			</a>
		</div>
		<div class="sel">

			<select class="form-select" aria-label="Default select example">
				<option selected>낙찰 상품</option>
				<option value="1">결제완료</option>
				<option value="2">미결제</option>
				<option value="3">배송중</option>
				<option value="4">배송완료</option>
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
		<div class="box3">

			<a href="">
				<div class="item">
					<img src="" alt="" />
					<div class="itemtext">
						<span class="title">노란피규어</span> <span class="bidcount">25000
							원</span> <a href="123"><div class="position">결제대기</div></a>
					</div>
				</div>
			</a> <a href="">
				<div class="item">
					<img src="" alt="" />
					<div class="itemtext">
						<span class="title">빨간피규어</span> <span class="bidcount">25000
							원</span> <a href=""><div class="position">배송완료</div></a>
					</div>
				</div>
			</a> <a href="">
				<div class="item">
					<img src="" alt="" />
					<div class="itemtext">
						<span class="title">빨간피규어</span> <span class="bidcount">25000
							원</span> <a href=""><div class="position">결제완료</div></a>
					</div>
				</div>


				<div class="card">
					<img src="..." class="card-img-top" alt="...">

					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
		</div>
	</div>


</body>
</html>