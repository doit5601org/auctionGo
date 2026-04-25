<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 경매 현황</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script>
$(function() {
	
    $('#auction-status-table').on('click', '.detail-btn', function(e) {
        e.preventDefault();
        

        // 2. 타겟 설정: 클릭한 버튼의 조상 tr 바로 다음에 오는 .collapse 행
        const $targetRow = $(this).closest('tr').next('.collapse');
        
        // 3. 다른 상세창들만 찾기 (사이드바 메뉴는 절대 건드리지 않음)
        // #auction-status-table 내부의 .collapse 중 현재 타겟이 아닌 것들만!
        const $otherRows = $('#auction-status-table').find('.collapse').not($targetRow);

        // 4. 다른 상세 행은 즉시 닫기
        $otherRows.stop(true, true).hide().removeClass('show');

        // 5. 내 타겟 행만 토글
        $targetRow.stop(true, true).slideToggle(200, function() {
            if ($(this).is(':visible')) {
                $(this).addClass('show');
            } else {
                $(this).removeClass('show');
            }
        });
        
        	
        });
        

   	function updateCountdown(){
   		let now = new Date().getTime();
   		
   		$(".countdown").each(function(){
   			let endVal = $(this).data("end");
   			console.log("데이터확인:", endVal);
   			let endTime = new Date($(this).data("end")).getTime();
   			let distance = endTime - now;
   			
   			let $display = $(this).find(".time-display");
   			
   			if(distance < 0 ){
   				$display.html("<span class='text-danger fw-bold'>경매종료</span>")
   				return;
   			}	
   			
   			let days = Math.floor(distance / (1000 * 60 * 60 * 24));
            let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            let seconds = Math.floor((distance % (1000 * 60)) / 1000);
   			
            let timeStr = "";
            if(days>0){
            	timeStr += days+"일 ";
            }
            timeStr += String(hours).padStart(2,'0')+":"
            		+ String(minutes).padStart(2, '0')+":"
            		+ String(seconds).padStart(2,'0');
            	$display.text(timeStr);

   		});
   	}
   	
   	
   	setInterval(updateCountdown, 1000);
   	updateCountdown();
   	
});
</script>

</head>
<body class="bg-light">
 <%@ include file="/WEB-INF/views/common/header.jsp" %>

	<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
		<div class="row">
			<aside class="col-md-3">
				<%@ include file="/WEB-INF/views/common/mypage_layout.jsp" %>
			</aside>
			<section class="col-md-9">
				<div class="card shadow-sm border-0 mb-4 p-4">
					<div class="card-header bg-white py-3">
						<h5 class="mb-0 fw-bold">
							<i class="bi bi-play-circle text-primary me-2"></i>내 경매 현황
						</h5>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table align-middle border-top" id="auction-status-table">
								<thead class="table-light">
									<tr class="text-center">
										<th style="width: 5%">번호</th>
										<th style="width: 35%">경매 상품 정보</th>
										<th style="width: 15%">남은 시간</th>
										<th style="width: 10%">참여 인원</th>
										<th style="width: 15%">입찰 현황</th>
										<th style="width: 10%">취소</th>
									</tr>
								</thead>
								<tbody>
									<!-- <tr>
										<td colspan="5" class="text-center">진행 중인 경매가 존재하지 않습니다.</td>
									</tr> -->
									<c:forEach var="dto" items="${list }" varStatus="status">
									<tr>
										<td class="text-center">${status.count}</td>
										<td>
											<div class="d-flex align-items-center ps-3">
												<img
											src="${pageContext.request.contextPath}/${dto.imagePath1 }"
											class="rounded shadow-sm" alt="상품" style="width: 60px; height: 60px; object-fit: cover;">
												<div class="ms-4">
													<div class="fw-bold">
														<a href="/auctions/#" class="text-decoration-none text-dark link-primary">${dto.auctionTitle }</a>
													</div>
													<div class="text-muted small">시작일: ${dto.auctionStartDate }</div>
												</div>
											</div>
										</td>
										<td class="text-center countdown" data-end="${dto.auctionEndDate }"><span class="text-danger fw-bold time-display">계산중...</span>
										</td>
										<td class="text-center"><span
											class="badge rounded-pill bg-primary px-3">${dto.bidCount } 명</span></td>
										<td class="text-center">
											<div class="small px-3">
												<button type="button" class="btn btn-sm btn-dark detail-btn" data-id="${dto.auctionId }">상세</button>
												
											</div>
										</td>
										<td>
											<a type="button" class="btn btn-sm btn-outline-dark detail-btn" href="#">경매취소</a>
										</td>
									</tr>
									<tr class="collapse bg-light">
							            <td colspan="6" class="p-3 text-center">
							            	<c:forEach var="rank" items="${dto.bidRankList }" varStatus="status" end="2">
													<div class="ranking-item">
														<strong class="${rank.currentRank == 1 ? 'text-success' : 'text-muted'}">
															${rank.currentRank}순위 </strong> 
															<span class="ms-1 ${rank.currentRank == 1 ? 'text-success' : 'text-muted'}"> 
																<fmt:formatNumber value="${rank.bidPrice}" type="number" />원
															</span>
															<span>(입찰 시간: ${rank.bidTime })</span>
													</div>


												</c:forEach>
							            	
							            </td>
							        </tr>
									</c:forEach>
								
								</tbody>
							</table>
						</div>
					</div>
					<div class="d-flex justify-content-center mt-4">
							${dataCount == 0? "등록된 게시물이 없습니다.": paging }
						</div>
		
				</div>
			</section>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>