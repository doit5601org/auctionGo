<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/buyauction.css">
</head>
<body>
	<div class="body">
		<div class="box">

			<div class="item">
				<h1>낙찰 구매 상품</h1>
				<div class="itemimg">
					<img src="" alt="" />
				</div>
				<div class="itemtext">
					<span class="title"> 가면라이더 </span> <span class="title"> 상태:상
						제조사:코믹게임즈 </span> <span class="title"> 낙찰일자 2026-03-14 <br />
						결재마감일자 2026-03-15 <br /> 남은 시간 실시간 남은시간 16:15:11<br />
					</span> <span class="title"> 입찰가 : 210000 원<br /> 낙찰가 : 180000 원<br />
					</span>
				</div>
			</div>

			<div class="cash">
				<h2>최종 결제 금액</h2>
				<span>낙찰 가격</span><span>180000 원</span> <span>배송 비용</span><span>3000
					원</span>
				<hr />
				<span>183000 원</span>

			</div>
		</div>
		<div class="box2">
			<div class="adress">
				<h2>배송지</h2>
				<span>서울특별시 홍익로 211</span> <span>어딘가에있는 2층 빌딩 311호</span>
			</div>

			<div class="adressconfirm">
				<h2>배송 요청사항</h2>
				<select>
					<option value="">문앞</option>
					<option value="">직접수령</option>
					<option value="">경비실</option>
					<option value="">택배함</option>
					<option value="">기타</option>
				</select>
			</div>
			<div class="cashtot">
				<h2>결제</h2>
				<span>최종 결제 금액 183000 원</span>
				<hr />
				<span>보유금액 200000 원</span> <span>결제 후 잔액 17000 원</span>
				<button>결제하기</button>
			</div>
		</div>
	</div>
</body>
</html>