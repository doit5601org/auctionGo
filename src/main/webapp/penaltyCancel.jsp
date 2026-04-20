<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패널티 취소</title>
</head>
<body>

<div>
	<h1>패널티 취소</h1>
</div>

<div>
	<form action="">
		<input type="hidden" value="회원 고유키">
	
		<div>
			패널티 취소 대상 유저 <input type="text" disabled="disabled" value="회원1" />
		</div>
		<div>
			패널티 점수
			<input type="text" value="2" disabled="disabled"/>
		</div>
		<div>
			패널티 사유
			<input type="text" value="광고 행위" disabled="disabled"/>
		</div>
		<div>
			패널티 취소 사유
			<input type="text" />
		</div>
		<div>
			<button type="submit">등록</button>
			<button type="reset">초기화</button>
		</div>
	</form>
</div>

</body>
</html>