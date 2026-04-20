<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="${pageContext.request.contextPath }/css/buyauction.css">
</head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>
<body>
	<div class="body">
		<div class="box">
			<div class="item">
				<h1>낙찰 구매 상품</h1>
				<hr />
				<div class="itemimg">
					<img src="" alt="" />
				</div>
				<div class="itemtext">
					<span class="title"> 가면라이더 </span> <br /> <span class="condition">
						상태:상 제조사:코믹게임즈 </span><br /><br /> <span class="date"> <span class="tt">낙찰일</span> 2026-03-14
						<br /> <span class="tt">결제마감일</span> 2026-03-15 <br /><span class="tt">남은시간</span> 16:15:11<br />
					</span> <span class="countmoney"> <span class="tt">입찰가</span>  210000 원<br /> <span class="tt">낙찰가</span>
						180000 원<br />
					</span>
				</div>
			</div>

			<div class="cash">
				<h2>최종 결제 금액</h2>
				<hr class="nh"/>
				<span class="tt">낙찰 가격</span><span>180000 원</span> <span class="tt">배송 비용</span><span>3000
					원</span>
				<hr class="nh"/>
				<span><span class="tts">현재 보유 머니</span> 200000 원</span> <span><span class="tt">결제 후 잔액</span> 17000 원</span>
				
				<hr class="nh"/>
				<span class="tts">최종 결제 금액</span><span>183000 원</span>
				<div class="bt">
				<button type="button" class="btn btn-outline-secondary">결제 하기</button>
				<button type="button" class="btn btn-outline-secondary">돌아 가기</button>
				</div>
			</div>
		</div>
		<div class="box2">
			<div class="adress">
				<h2>배송지</h2>
				<hr />
				<div class="mb-5">
					<label>주소 <span class="text-danger">*</span></label>
					<div class="d-flex justify-content-start mb-2">
						<input type="text" placeholder="우편번호" disabled="disabled" class="form-control w-50 me-2" id="zipcode">
						<button type="button" class="btn btn-outline-dark ms-2">주소검색</button>
					</div>	
					<div class="mb-2">
						<input type="text" class="form-control" placeholder="기본주소" disabled="disabled" id="addr1" />
					</div>
					<div class="mb-2">
						<input type="text" class="form-control" placeholder="상세주소" id="addr2" />
					</div>
				<span class="text-danger ms-1 errMsg">주소를 입력해주세요.</span>
				</div></div>

			<div class="adressconfirm">
				<h2>배송 요청사항</h2>
				<hr />
				<select class="form-select" aria-label="Default select example">
					<option selected>배송 상세</option>
					<option value="1">문앞</option>
					<option value="2">직접수령</option>
					<option value="3">경비실</option>
					<option value="3">경비실</option>
					<option value="3">택배함</option>
					<option value="3">기타</option>
				</select>
				<div class="mb-2">
						<input type="text" class="form-control" placeholder="직접 입력하기" id="other" disabled="disabled"/>
					</div>
			</div>
			<!-- <div class="cashtot">
				<h2>결제</h2>
				<span>최종 결제 금액 183000 원</span>
				<hr />
				<span>보유금액 200000 원</span> <span>결제 후 잔액 17000 원</span>
				<button>결제하기</button>
			</div> -->
		</div>
	</div>
</body>
</html>