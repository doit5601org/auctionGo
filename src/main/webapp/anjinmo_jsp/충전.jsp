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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/charge.css">
</head>
</head>
<body>
	<div class="body">
		<h1>충전하기</h1>
		<hr />
		<div class="choice">
			<div class="btn-group" role="group"
				aria-label="Basic radio toggle button group">
				<input type="radio" class="btn-check" name="btnradio" id="btnradio1"
					autocomplete="off" checked> <label
					class="btn btn-outline-secondary" for="btnradio1">보증금</label> <input
					type="radio" class="btn-check" name="btnradio" id="btnradio2"
					autocomplete="off"> <label
					class="btn btn-outline-secondary" for="btnradio2">머니</label>

			</div>
		</div>
		<div class="form-floating">
			<input class="form-control" placeholder="Leave a comment here"
				id="floatingTextarea"></input> <label for="floatingTextarea">
				충전할 금액을 입력해주세요</label>
		</div>
		<div class="addmoney">
			<div class="btn-group" role="group"
				aria-label="Basic outlined example">
				<button type="button" class="btn btn-outline-secondary">+
					1,000원</button>
				<button type="button" class="btn btn-outline-secondary">+
					5,000원</button>
				<button type="button" class="btn btn-outline-secondary">+
					10,000원</button>
			</div>
			<div class="btn-group" role="group"
				aria-label="Basic outlined example">

				<button type="button" class="btn btn-outline-secondary">+
					50,000원</button>
				<button type="button" class="btn btn-outline-secondary">+
					100,000원</button>
				<button type="button" class="btn btn-outline-secondary">+
					1,000,000원</button>
			</div>
		</div>
		<button type="button" class="btn btn-outline-dark">충전 하기</button>
	</div>
</body>
</html>