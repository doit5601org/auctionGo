<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
	href="${pageContext.request.contextPath}/css/money.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>
	
<style type="text/css">

body
{
	margin-top: 50px;
}
.body
{
	margin: auto;
	width: 80%;
	background-color: white;
}
.main
{
	min-height: 1050px;
}

a:visited, a
{
	text-decoration: none;
	color: black;
	font-weight: bold;
}

.pagecontrol
{
	margin-top:auto;
	margin-bottom:10px;
	align-items: center;
	vertical-align: bottom;
}
table
{
	margin-bottom: 40px;
}
.sel
{
	margin-top: 20px;
	margin-bottom: 20px;
	width: 700px;
	display: flex;
	
}
h1
{
	font-size: 30px;
}
.form-select
{
	width: 150px;
	/* display: inline-block; */
	margin-left: 20px;
	height: 38px;
}
.row
{
	/* display: inline-block; */
	width: 350px;
	margin-left: 20px;
}
.btn-dark
{
	margin-left: 20px;
	width: 80px;
}
.tot
{
	width: 80%;
	margin: 0 auto;
	display: flex;
	vertical-align: middle;
}
.tot span
{
	margin: auto 0;
}
.bid
{
	padding: 10px;
	/* border-right: 1px solid black; */
	height: 100px;
	width: 40%;
	border:2px solid silver;
	margin: 30px 30px 10px 30px;
	text-align: center;
	border-radius: 8px;
}
.bid>span
{
	display:block;
}
table
{
	width: 100%;
	font-size: 16px;
	text-align: center;
}
th
{
	border:1px solid silver;
	border-radius: 10px;
	height: 40px;
}
hr
{
	margin-top: 10px;
	margin-bottom: 15px;
}
tr
{
	height: 40px;
	border-bottom: 1px solid silver;
}

</style>
<script type="text/javascript">
	function change()
	{
		document.moneyForm.submit();
	}
</script>
</head>
<body>
	<div class="body">
		
		<div class="main card shadow-sm border-0 bg-white p-4">
			<h1>머니 이력</h1>
			<hr />
			<div class="tot">
 				<div class="bid">
					<span>보유 머니</span>
					<hr />
					<span class="view">40000</span>
				</div>
				<span>▶</span>
				<div class="bid">
					<span>환급 예정 보증금</span>
					<hr />
					<span class="view">15000</span>
				</div>
				<span>▶</span>
				<div class="bid">
					<span>전체 머니</span>
					<hr />
					<span class="view">55000</span>
				</div>
			</div>
			<form action="${pageContext.request.contextPath }/payment.history" name="moneyForm">
			<div class="sel">
			
				<select class="form-select" aria-label="Default select example" onchange="change()" name="inout">
					<option selected value="">입출금 구분</option>
					<option value="1" ${inout == 1 ? 'selected' : ''}>입금</option>
					<option value="2" ${inout == 2 ? 'selected' : ''}>출금</option>
				</select>

				<select class="form-select" aria-label="Default select example" onchange="change()" name="part">
					<option selected value="">상세 구분</option>
					<option value="1" ${part == 1 ? 'selected' : ''}>결제</option>
					<option value="2" ${part == 2 ? 'selected' : ''}>결제 대금</option>
					<option value="3" ${part == 3 ? 'selected' : ''}>판매 보증금 납부</option>
					<option value="4" ${part == 4 ? 'selected' : ''}>판매 보증금 환수</option>
					<option value="5" ${part == 5 ? 'selected' : ''}>구매 보증금 납부</option>
					<option value="6" ${part == 6 ? 'selected' : ''}>구매 보증금 환수</option>
					<option value="7" ${part == 7 ? 'selected' : ''}>보증금 몰수</option>
					<option value="8" ${part == 8 ? 'selected' : ''}>충전</option>
				</select>	
				
				<div class="row">
					<div class="col">
						<input type="text" class="form-control" placeholder="First day"
							aria-label="First name">
					</div>~
					<div class="col">
						<input type="text" class="form-control" placeholder="Last day"
							aria-label="Last name">
					</div>
					<button type="button" class="btn bt btn-dark">검색</button>
				</div>
				
			</div>
			</form>
			<table>
				<tr>
					<th style="width: 230px;">참여 구분</th>
					<th style="width: 180px;">사용 구분</th>
					<th style="width: 100px;">입출금</th>
					<th style="width: 150px;">금액</th>
					<th style="width: 300px;">이력 일자</th>
				</tr>
				
				<c:forEach var="money" items="${moneyList }">
					<tr>
						<td>${money.transactionType }</td>
						<td>${money.part }</td>
						<td>${money.inout }</td>
						<td><strong><fmt:formatNumber value="${money.amount }"/></strong> 원</td>
						<td><fmt:formatDate value="${money.transactionDate }" pattern="yyyy년 MM월 dd일 - HH시 mm분"/></td>
					</tr>
				</c:forEach>
				
			</table>
			<div class="pagecontrol">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/payment.history?page=${var.count+10 }&part=${part}&inout=${inout}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="page" begin="1" end ="${totalPage }" varStatus= "var">
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/payment.history?page=${var.count }&part=${part}&inout=${inout}">${var.count }</a></li>
						</c:forEach>
						
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/payment.history?page=${var.count+10 }&part=${part}&inout=${inout}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	
	
</body>
</html>