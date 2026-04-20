<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 경매 목록</title>
<style type="text/css">

	.auctionItem
	{
		display: flex;
		gap: 20px;
	}

	.auctionItem img
	{
		max-width: 200px;
		max-height: 250px;
	}
	
</style>
</head>
<body>

<div>
	<h1>전체 경매 목록</h1>
</div>

<div id="auctionList">

	<div class="auctionItem">
		<div>
			<img alt="경매 상품 이미지" src="${ pageContext.request.contextPath }/images/tempFigureImage.png">
		</div>
		<div>
			<div>경매 등록자: 회원2</div>
			<div>경매 개시일시: 2026-04-19 22:06</div>
			<div>경매 시작가: 150,000원</div>
		</div>
		<div>
			<div>현재가: 165,000원</div>
		</div>
		<div>
			<div>최근 입찰 이력</div>
			<div>(회원고유키3) | 2026-04-19 23:45:01 | 170,000</div>
			<div>(회원고유키2) | 2026-04-19 23:11:55 | 165,000</div>
			<div>(회원고유키1) | 2026-04-19 23:11:08 | 160,000</div>
		</div>
		
		<div>
			<button type="button">경매 모니터링</button>
		</div>
	</div>
	
	<div class="auctionItem">
		<div>
			<img alt="경매 상품 이미지" src="${ pageContext.request.contextPath }/images/tempFigureImage.png">
		</div>
		<div>
			<div>경매 등록자: 회원2</div>
			<div>경매 개시일시: 2026-04-19 22:06</div>
			<div>경매 시작가: 150,000원</div>
		</div>
		<div>
			<div>현재가: 165,000원</div>
		</div>
		<div>
			<div>최근 입찰 이력</div>
			<div>(회원고유키3) | 2026-04-19 23:45:01 | 170,000</div>
			<div>(회원고유키2) | 2026-04-19 23:11:55 | 165,000</div>
			<div>(회원고유키1) | 2026-04-19 23:11:08 | 160,000</div>
		</div>
		
		<div>
			<button type="button">경매 모니터링</button>
		</div>
	</div>
	
	<div class="auctionItem">
		<div>
			<img alt="경매 상품 이미지" src="${ pageContext.request.contextPath }/images/tempFigureImage.png">
		</div>
		<div>
			<div>경매 등록자: 회원2</div>
			<div>경매 개시일시: 2026-04-19 22:06</div>
			<div>경매 시작가: 150,000원</div>
		</div>
		<div>
			<div>현재가: 165,000원</div>
		</div>
		<div>
			<div>최근 입찰 이력</div>
			<div>(회원고유키3) | 2026-04-19 23:45:01 | 170,000</div>
			<div>(회원고유키2) | 2026-04-19 23:11:55 | 165,000</div>
			<div>(회원고유키1) | 2026-04-19 23:11:08 | 160,000</div>
		</div>
		
		<div>
			<button type="button">경매 모니터링</button>
		</div>
	</div>
	
	<div class="auctionItem">
		<div>
			<img alt="경매 상품 이미지" src="${ pageContext.request.contextPath }/images/tempFigureImage.png">
		</div>
		<div>
			<div>경매 등록자: 회원2</div>
			<div>경매 개시일시: 2026-04-19 22:06</div>
			<div>경매 시작가: 150,000원</div>
		</div>
		<div>
			<div>현재가: 165,000원</div>
		</div>
		<div>
			<div>최근 입찰 이력</div>
			<div>(회원고유키3) | 2026-04-19 23:45:01 | 170,000</div>
			<div>(회원고유키2) | 2026-04-19 23:11:55 | 165,000</div>
			<div>(회원고유키1) | 2026-04-19 23:11:08 | 160,000</div>
		</div>
		
		<div>
			<button type="button">경매 모니터링</button>
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