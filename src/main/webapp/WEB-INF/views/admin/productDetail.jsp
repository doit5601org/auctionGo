<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 조회</title>
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
	<button>상품 비공개 처리</button>
	<button>상품 삭제 및 회원 패널티 부여</button>
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
</div>

</body>
</html>