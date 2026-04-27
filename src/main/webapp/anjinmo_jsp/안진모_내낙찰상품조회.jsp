<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resource/css/biditem.css">

<style type="text/css">

body
{
	margin-top: 50px;
}
.up
{
	margin-top: 50px;
	border-radius: 7px;
	border: 1px solid silver;
	margin: auto;
	font-size: 16px;
	width: 1130px;
	padding: 30px;
}

a
{
	text-decoration: none;
}
a:visited
{
	color: black;
	text-decoration: none;
}
h1
{
	font-size:24px;
	font-weight: bold;
}
.box
{
	border: 1px solid silver;
	height: 100px;
	width: 90%;
	border-radius: 7px;
	position: relative;
	margin:30px auto;
	text-align: center;
	
}
.tot
{
	display: flex;
}
.bid
{
	padding: 10px;
	/* border-right: 2px solid silver; */
	height: 100%;
	width: 100%;
}
.bid>span
{
	display:block;
}
.view
{
	height: 70%;
	margin-top: 25px;
}
.box2
{
	/* border: 2px solid silver; */
	margin-top: 20px;
	margin-bottom: 20px;
	width: 90%;
}
.categori
{
	display: inline-block;
	border: 2px solid silver;
	border-radius: 5px;
	width: 49%;
	
}
.box3
{
	border: 1px solid silver;
	border-radius: 7px;
	width: 90%;
	text-align: left;
	padding: 50px;
	margin:0 auto;
}
.item
{
	vertical-align: top;
	border-radius: 7px;
	border: 1px solid silver;
	margin: 10px;
	display: inline-block;
	width: 200px;
	height: 255px;
}
hr
{
	margin: 10px;
}
.item span
{
	display: block;
	
}
.item div
{
	display:inline-block;
	
}
.item img
{
	border-radius: 5px;
	object-fit: cover;
	width: 100%;        
    height: 100%;       
    object-position: center;
}

.imgwrap
{
	width: 100%;
	height: 170px;
	overflow: hidden;  
    background-color: #f9f9f9;
}
.sel
{
	margin-bottom: 20px;
	width: 700px;
	display: flex;
	margin-left: 50px;
	
}
.card
{
	display: inline-block;
	width: 200px;
}
.itemtext
{
	align-content:center;
	/* text-align:center; */
	margin-top:9px;
}
.form-select
{
	width: 150px;
	/* display: inline-block; */
	margin-left: 20px;
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
}
.pagecontrol
{
	margin-top: 30px;
	margin-bottom: 30px;
}
.nav-tabs
{
	width: 60%;
	margin-left: 80px;
}
.itemtext
{
	display: block;
	font-weight: bold;
	text-align: center;
	width: 100%;
	padding: 3px;
 	margin-top:3px; 
}
.bidcount, .position { 
    display: inline-block !important;
    margin: 0 5px; 
}
.bidcount
{
	text-align:left;
 	width: 100px; 
}
.position
{
	text-align:right;
	font-family: small;
}
.title
{
	font-family: small;
	font-weight:bold;
	height: 45px; 
	font-size: 16px;
}
.btn
{
	width: 60px;
	height: 25px;
	font-size:15px;
	font-weight: bold;
	font-family: small; 
	margin-bottom:7px;
	padding: 1px;
}
.position>span
{
	font-size:15px;
}
.title
{
	background-color: white;
	border-radius: 10px;
}
</style>
<script type="text/javascript">
function con(userId, bidId) {
    if (!confirm("구매를 확정하시겠습니까?")) return;

    // AJAX 요청
    fetch("${pageContext.request.contextPath}/user/purchaseConfirmAction?bidId=" + bidId + "&userId=" + userId)
    .then(response => response.text())
    .then(data => {
        if(data.trim() === "success") {
            alert("구매가 확정되었습니다.");
            // 버튼이 있던 자리의 부모 컨테이너를 찾아서 내용을 변경
            let container = document.getElementById("confirmContainer_" + bidId);
            container.innerHTML = "<span>구매확정완료</span>";
        } else {
            alert("처리에 실패했습니다.");
        }
    })
    .catch(error => {
        console.error("Error:", error);
        alert("서버 오류 발생");
    });
}
</script>
</head>
<body>
<div class="up shadow-sm border-0 bg-white p-4">
	<div class="body">
		<h1>낙찰 상품</h1>
		<hr />
		<div class="box shadow-sm">

			<div class="tot">
				<div class="bid">
					<span>낙찰 상품</span>
					<hr />
					<a href=""><span class="view">${winnerCount.total }</span></a>
				</div>
				<div class="bid">
					<span>낙찰포기 상품</span>
					<hr />
					<a href=""><span class="view">${winnerCount.fail }</span></a>
				</div>
				<div class="bid">
					<span>미결제 상품</span>
					<hr />
					<a href=""><span class="view">${winnerCount.unpayment }</span></a>
				</div>
				<div class="bid">
					<span>배송대기 상품</span>
					<hr />
					<a href=""><span class="view">${winnerCount.unshipping }</span></a>
				</div>
				<div class="bid">
					<span>배송완료 상품</span>
					<hr />
					<a href=""><span class="view">${winnerCount.shipping }</span></a>
				</div>
				<div class="bid">
					<span>구매확정완료</span>
					<hr />
					<a href=""><span class="view">${winnerCount.confirm }</span></a>
				</div>
			</div>
		</div>
		<div class="sel">
			<form action="${pageContext.request.contextPath }/user/products">
			<select class="form-select" aria-label="Default select example" name="type" onchange="this.form.submit()">
				<option value="" ${param.type == ''|| param.type == 0 ? 'selected' : '' }>낙찰 상품</option>
				<option value="1" ${param.type == 1 ? 'selected' : '' }>낙찰 취소</option>
				<option value="2" ${param.type == 2 ? 'selected' : '' }>미 결제 </option>
				<option value="3" ${param.type == 3 ? 'selected' : '' }>배송 대기</option>
				<option value="4" ${param.type == 4 ? 'selected' : '' }>배송 완료</option>
				<option value="5" ${param.type == 5 ? 'selected' : '' }>구매 확정</option>
			</select>
			</form>
			<div class="row">
				<div class="col">
					<input type="text" class="form-control" placeholder="First day"
						aria-label="First name">
				</div>
				~
				<div class="col">
					<input type="text" class="form-control" placeholder="Last day"
						aria-label="Last name">
				</div>
			</div>
			<button type="button" class="btn btn-dark">검색</button>
		</div>


		<div class="box3 shadow-sm"> 

			<c:forEach var="bid" items="${winnerList }">
				<!-- 상페url -->
				<a href="">
					<div class="item shadow-sm">
						<div class="imgwrap">
						<img src="${bid.img }" alt="상품이미지" />
						</div>
						<div class="itemtext">
							<span class="title">${bid.auctionTitle }</span> <span
								class="bidcount">${bid.finalPrice } 원</span>
							<div class="position">
								<c:choose>
									<c:when test="${bid.fail == 'Y' }">
										<c:choose>
											<c:when test="${bid.failType == 1 }">
												<span>기한만료</span>
											</c:when>
											<c:when test="${bid.failType == 2 }">
												<span>낙찰취소</span>
											</c:when>
										</c:choose>
									</c:when>
									<c:when test="${bid.confirm == 'Y' }">
										<span>확정완료</span>
										<a href="${pageContext.request.contextPath }/payment.detail?userId=${bid.winnerUserId}&resultId=${bid.winnerBidId}"><button type="button" class="btn btn-light">결제하기</button></a>
									</c:when>
									<c:when test="${bid.shipping == 'Y' }">
										<span id="confirmContainer_${bid.winnerBidId}">
										<button type="button" class="btn btn-light" onclick="con(${bid.winnerUserId},${bid.winnerBidId})">구매확정</button>
										</span>
									</c:when>
									<c:when
										test="${bid.paymentStat == 'Completed' && bid.shipping == 'N' }">
										<span>배송대기</span>
									</c:when>
									
									<c:when test="${bid.paymentStat == 'Pending' }">
										<a href="${pageContext.request.contextPath }/payment.detail?userId=${bid.winnerUserId}&resultId=${bid.winnerBidId}"><button type="button" class="btn btn-light">결제하기</button></a>
									</c:when>

								</c:choose>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>

			<div class="pagecontrol">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href=""
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="page" begin="${startPage }" end ="${endPage }" varStatus= "var">
							<li class="page-item"><a class="page-link" href="">${var.count }</a></li>
						</c:forEach>
						
						<li class="page-item"><a class="page-link" href=""
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>
</body>
</html>