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
		<h1>낙찰 상품</h1>
		<hr />
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
			<!-- <a href="">
				<div class="categori">
					<span>낙찰 상품</span>
				</div>
			</a> <a href="">
				<div class="categori">
					<span>판매 상품</span>
				</div>
			</a> -->
			<!-- <div class="btn-group" role="group"
				aria-label="Basic radio toggle button group">
				<input type="radio" class="btn-check" name="btnradio" id="btnradio1"
					autocomplete="off" checked> <label
					class="btn btn-outline-secondary" for="btnradio1">낙찰 상품</label> <input
					type="radio" class="btn-check" name="btnradio" id="btnradio2"
					autocomplete="off"> <label class="btn btn-outline-secondary"
					for="btnradio2">등록 상품</label> <input type="radio" class="btn-check"
					name="btnradio" id="btnradio3" autocomplete="off"> <label
					class="btn btn-outline-secondary" for="btnradio3">판매 상품</label>
			</div> -->
		</div>
		<div class="sel">

			<select class="form-select" aria-label="Default select example">
				<option selected>낙찰 상품</option>
				<option value="1">결제 완료</option>
				<option value="2">미 결제</option>
				<option value="3">배송 중</option>
				<option value="4">배송 완료</option>
			</select>
			<select class="form-select" aria-label="Default select example">
				<option selected>등록 상품</option>
			</select>
			<select class="form-select" aria-label="Default select example">
				<option selected>판매 상품</option>
				<option value="1">경매 중</option>
				<option value="2">유찰 완료</option>
				<option value="3">낙찰 완료</option>
				<option value="4">배송 완료</option>
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
		<ul class="nav nav-tabs">

			<li class="nav-item"><a class="nav-link" href="#">낙찰 상품</a></li>
			<li class="nav-item"><a class="nav-link" href="#">등록 상품</a></li>
			<li class="nav-item"><a class="nav-link" href="#">판매 상품</a></li>
		</ul>
		<div class="box3">

			<a href="">
				<div class="item">
					<img src="" alt="" />
					<div class="itemtext">
						<span class="title">노란피규어</span> <span class="bidcount">25000
							원</span> <a href="123"><div class="position">결제대기</div></a>
					</div>
				</div>
			</a> 
			<a href="">
				<div class="item">
					<img src="" alt="" />
					<div class="itemtext">
						<span class="title">빨간피규어빨간피규어빨간피규어빨간피규어</span> <span class="bidcount">25000
							원</span> <a href=""><div class="position">배송완료</div></a>
					</div>
				</div>
			</a> 
			<a href="">
				<div class="item">
					<img src="" alt="" />
					<div class="itemtext">
						<span class="title">빨간피규어</span> <span class="bidcount">25000
							원</span> <a href=""><div class="position">결제완료</div></a>
					</div>
				</div>
			</a>
			<a href="">
				<div class="item">
					<img src="" alt="" />
					<div class="itemtext">
						<span class="title">빨간피규어</span> <span class="bidcount">25000
							원</span> <a href=""><div class="position">결제완료</div></a>
					</div>
				</div>
			</a>
			<a href="">
				<div class="item">
					<img src="" alt="" />
					<div class="itemtext">
						<span class="title">빨간피규어</span> <span class="bidcount">25000
							원</span> <a href=""><div class="position">결제완료</div></a>
					</div>
				</div>
			</a>
			<a href="">
				<div class="item">
					<img src="" alt="" />
					<div class="itemtext">
						<span class="title">빨간피규어</span> <span class="bidcount">25000
							원</span> <a href=""><div class="position">결제완료</div></a>
					</div>
				</div>
			</a>
			<a href="">
				<div class="item">
					<img src="" alt="" />
					<div class="itemtext">
						<span class="title">빨간피규어</span> <span class="bidcount">25000
							원</span> <a href=""><div class="position">결제완료</div></a>
					</div>
				</div>
			</a>
			<a href="">
				<div class="item">
					<img src="" alt="" />
					<div class="itemtext">
						<span class="title">빨간피규어</span> <span class="bidcount">25000
							원</span> <a href=""><div class="position">결제완료</div></a>
					</div>
				</div>
			</a>
		</div>
	</div>


</body>
</html>