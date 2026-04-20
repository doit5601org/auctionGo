<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 상세 조회</title>
<style type="text/css">

	.flexItem
	{
		display: flex;
		gap: 20px;
	}
	
	.flexItem img
	{
		max-width: 200px;
		max-height: 250px;
	}

</style>
</head>
<body>

<div>
	<button>경매 중지 및 비공개 처리</button>
	<button>경매 삭제 및 회원 패널티 부여</button>
</div>


<div id="contentsContainer">
	<div>
		<h1>상품 정보</h1>
	</div>
	<div class="flexItem" id="infoMain">
		<div>
			<img src="${ pageContext.request.contextPath }/images/tempFigureImage.png" alt="등록된 상품 이미지" />
		</div>
		<div>
			<div>
				상품명: 하츠네 미쿠 한정판 피규어
			</div>
			<div>
				별칭: 비싼 피규어
			</div>
			<div>
				제조국: 일본
			</div>
			<div>
				제조사: 모름
			</div>
			<div>
				상품 상태 등급: 최상
			</div>
		</div>
		<div>
			<div>현재가: 165,000원</div>
			<div>경매 종료 일시: 2026-04-25 18:55:16 (남은 시간: 4일 12시간 16분 25초)</div>
			<div>입찰 단위: 1,000원</div>
		</div>
	</div>
	
	<div>
		<h1>상세설명</h1>
	</div>
	<div id="infoDetail">
		<p>
			예약 구매로 구매해서 6개월 만에 받은 피규어.
		</p>
		<p>
			장식장 안에 넣어서 전시중.
		</p>
		<p>
			박스 보관중.
		</p>
	</div>
	
	<div>
		<h1>입찰 이력</h1>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th>순번</th>
					<th>입찰자</th>
					<th>입찰 금액</th>
					<th>입찰 일시</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>4</td>
					<td>라라라</td>
					<td>167,000</td>
					<td>2026-04-20 11:08:10</td>
				</tr>
				<tr>
					<td>3</td>
					<td>다다다</td>
					<td>165,000</td>
					<td>2026-04-20 07:01:50</td>
				</tr>
				<tr>
					<td>2</td>
					<td>나나나</td>
					<td>162,000</td>
					<td>2026-04-19 23:26:10</td>
				</tr>
				<tr>
					<td>1</td>
					<td>가가가</td>
					<td>161,000</td>
					<td>2026-04-19 22:16:30</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

</body>
</html>