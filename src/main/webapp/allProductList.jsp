<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 상품 목록</title>
<style type="text/css">

	.productItem
	{
		display: flex;
		gap: 20px;
	}
	
	.productItem img
	{
		max-width: 200px;
		max-height: 250px;
	}

</style>
</head>
<body>

<div>
	<h1>전체 상품 목록</h1>
</div>


<!-- 상품 목록 영역 -->
<div id="productList">
	
	<div class="productItem">
		<div>
			<img alt="상품 이미지 1" src="images/tempFigureImage.png">
		</div>
		<div>
			<div>등록 회원: 회원1</div>
			<div>공개 여부: 공개</div>
		</div>
		<div>
			<div>상품명: 하츠네 미쿠 피규어</div>
			<div>별칭: 한정판</div>
		</div>
		<div>
			<button>상품 비공개 처리</button>
			<button>게시 유저 패널티 부여</button>
		</div>
	</div>
	
	<div class="productItem">
		<div>
			<img alt="상품 이미지 1" src="images/tempFigureImage.png">
		</div>
		<div>
			<div>등록 회원: 회원1</div>
			<div>공개 여부: 공개</div>
		</div>
		<div>
			<div>상품명: 하츠네 미쿠 피규어</div>
			<div>별칭: 한정판</div>
		</div>
		<div>
			<button>상품 비공개 처리</button>
			<button>게시 유저 패널티 부여</button>
		</div>
	</div>
	
	<div class="productItem">
		<div>
			<img alt="상품 이미지 1" src="images/tempFigureImage.png">
		</div>
		<div>
			<div>등록 회원: 회원1</div>
			<div>공개 여부: 공개</div>
		</div>
		<div>
			<div>상품명: 하츠네 미쿠 피규어</div>
			<div>별칭: 한정판</div>
		</div>
		<div>
			<button>상품 비공개 처리</button>
			<button>게시 유저 패널티 부여</button>
		</div>
	</div>
	
</div>


<!-- 페이지 영역 -->
<div>
	<span><a href="~~?page=21">&lt;&lt;</a></span>
	<span><a href="~~?page=11">11</a></span>
	<span><a href="~~?page=12">12</a></span>
	<span><a href="~~?page=13">13</a></span>
	<span><a href="~~?page=14">14</a></span>
	<span><a href="~~?page=15">15</a></span>
	<span><a href="~~?page=16">16</a></span>
	<span><a href="~~?page=17">17</a></span>
	<span><a href="~~?page=18">18</a></span>
	<span><a href="~~?page=19">19</a></span>
	<span><a href="~~?page=20">20</a></span>
	<span><a href="~~?page=1">&gt;&gt;</a></span>
</div>


</body>
</html>