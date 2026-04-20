<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 처리</title>
</head>
<body>
<div id="contentsContainer">
	<form action="">
		<div>
			<h1>신고 내용</h1>
		</div>
		<div>
			<div>신고자: 홍길동</div>
			<div>신고 제목: 광고글 신고합니다.</div>
			<div>
				신고 내용
				<div>
					<p>광고글 신고합니다.</p>
					<p>삭제 처리 해주세요.</p>
				</div>
			</div>
		</div>
		
		
		<div>
			<h1>처리 내용</h1>
		</div>
		<div>
			<button type="button">신고 대상 확인(상품/경매)</button>
		</div>
		<div>
			<div>답변 입력</div>
			<textarea rows="" cols="" name="reportResponse"></textarea>
		</div>
		
		<div>
			<button type="submit">완료</button>
			<button type="reset">답변 초기화</button>
		</div>
	</form>	
</div>
</body>
</html>