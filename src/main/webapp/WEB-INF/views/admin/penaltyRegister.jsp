<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패널티 부여</title>
</head>
<body>

<div>
	<h1>패널티 부여</h1>
</div>

<div>
	<form action="">
		<div>
			패널티 대상 유저 <input type="text" disabled="disabled" value="회원1" />
		</div>
		<div>
			패널티 부여 점수
			<select name="penaltyPoint">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
			</select>
		</div>
		<div>
			패널티 부여 사유
			<input type="text" name="penaltyReason" />
		</div>
		
		<div>
			<button type="submit">등록</button>
			<button type="reset">초기화</button>
		</div>
	</form>
</div>

</body>
</html>