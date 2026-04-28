<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 - 경매 상세 조회</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .info-card { background: #fff; border: 1px solid #ced4da; border-radius: 4px; overflow: hidden; }
    .info-header { font-weight: bold; background: #f8f9fa; border-bottom: 1px solid #ced4da; padding: 15px 20px; }
    .info-row { display: flex; border-bottom: 1px solid #dee2e6; }
    .info-label { width: 180px; background-color: #f8f9fa; padding: 15px; font-weight: bold; border-right: 1px solid #dee2e6; }
    .info-value { flex: 1; padding: 15px; }
    .detail-img { max-width: 250px; border: 1px solid #dee2e6; border-radius: 4px; }
    
    /* 입찰 이력 전용 스타일 추가 */
	.bid-history-table th { background-color: #f8f9fa; border-top: 1px solid #ced4da; }
	.rank-1 { color: #d9480f; font-weight: bold; } /* 1등(낙찰유력) 강조 */
	.status-badge { font-size: 0.8rem; padding: 4px 8px; }
	
	
	/* 5개씩 정렬을 위한 갤러리 컨테이너 */
	.gallery-container {
	    display: flex;
	    flex-wrap: wrap;
	    gap: 10px; /* 이미지 사이 간격 */
	}
	
	/* 이미지 너비를 5등분 (간격 제외 약 20%) */
	.thumb-gallery {
	    width: calc(20% - 8px); /* 5개 출력: (100% / 5) - 간격 보정 */
	    aspect-ratio: 1 / 1;    /* 정사각형 유지 */
	    object-fit: cover;
	    border-radius: 4px;
	    border: 1px solid #dee2e6;
	}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">

	/*
	document.addEventListener("DOMContentLoaded", function() {
		bid_history_update(1);
	});
	*/
	
	$(function() {
		// bid_history_update(1);
		bid_history_update();
	});
	
	
	// function bid_history_update(page)
	function bid_history_update(page)
	{
		//-- 입찰 총 횟수 업데이트 --//
		$.ajax({
			"type" : "GET"
			, "url" : "${ pageContext.request.contextPath }/admin/auction/ajax/bidCount"
			, "data" : {
						"auctionId" : "${ auctionDto.auctionId }"
				}
			, "success" : function(args)
			  {
				let textBidTotalCount = "총 " + args + "건";
				$("#bidTotalCount").text(textBidTotalCount);
			  }
			, "error" : function(e)
			  {
				alert(e.responseText);
				console.log(e.responseText);
			  }
		});
		
		
		//-- 입찰 이력 업데이트 --//
		$.ajax({
			"type" : "GET"
			, "url" : "${ pageContext.request.contextPath }/admin/auction/ajax/bidHistory"
			, "data" : {
						"auctionId" : "${ auctionDto.auctionId }"
						// , "page" : page
				}
			, "success" : function(args)
			  {
				let bidHistoryEl = "";

				// 입찰 이력이 없을 경우
				if (args.length == 0)
				{
					bidHistoryEl += "<tr>";
					bidHistoryEl +=     "<td colspan='5' class='py-5 text-muted'>입찰 이력이 존재하지 않습니다.</td>";
					bidHistoryEl += "</tr>";
				}
				else
				{
					for (let i = 0; i < args.length; i++)
					{
						let bidData = args[i];

						bidHistoryEl += "<tr>";
						bidHistoryEl += "    <td class='fw-semibold'>" + bidData.userId + "</td>";
						bidHistoryEl += "    <td class='text-center'>";
						bidHistoryEl += "        <span class='fw-bold'>" + bidData.bidPrice.toLocaleString() + "</span>원";
						bidHistoryEl += "    </td>";
						bidHistoryEl += "    <td><small class='text-muted'>" + formatTimestamp(bidData.bidTime) + "</small></td>";
						bidHistoryEl += "    <td>";
						
						// 최고입찰자일경우
						if (bidData.bidRank == 1)
						{
							bidHistoryEl += "            <span class='badge bg-success-subtle text-success border border-success-subtle status-badge'>";
							bidHistoryEl += "                <i class='bi bi-check-circle-fill'></i> 낙찰 유력";
							bidHistoryEl += "            </span>";
						}
						// 그 외 경우
						else
						{
							bidHistoryEl += "            <span class='badge bg-light text-secondary border status-badge'>입찰 중</span>";	
						}
						bidHistoryEl += "    </td>";
						bidHistoryEl += "</tr>";
					}
				}

				// 페이지 업데이트
				$("#bidHistory").html(bidHistoryEl);
			  }
			, "error" : function(e)
			  {
				alert(e.responseText);
				console.log(e.responseText);
			  }
		});
		
	}

	
	function formatTimestamp(strTimestamp) {
	    var date = new Date(strTimestamp);

	    var yyyy = date.getFullYear();
	    var mm = ("0" + (date.getMonth() + 1)).slice(-2);
	    var dd = ("0" + date.getDate()).slice(-2);
	    var hh = ("0" + date.getHours()).slice(-2);
	    var mi = ("0" + date.getMinutes()).slice(-2);
	    var ss = ("0" + date.getSeconds()).slice(-2);
	    var fff = ("00" + date.getMilliseconds()).slice(-3); // 밀리초 FF3

	    return yyyy + "-" + mm + "-" + dd + " " + hh + ":" + mi + ":" + ss + "." + fff;
	}

</script>
</head>
<body class="bg-light">
<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 class="fw-bold">경매 상세 정보</h4>
        <div>
            <button class="btn btn-outline-dark me-2">경매 중지 및 비공개</button>
            <button class="btn btn-danger">삭제 및 패널티 부여</button>
        </div>
    </div>
    
    <div class="info-card shadow-sm mb-4">
        <div class="info-header">상품 및 경매 정보</div>
        <%--
        <div class="info-row">
            <div class="info-label">상품 이미지</div>
            <div class="info-value text-center">
            	<img src="${ pageContext.request.contextPath }/images/tempFigureImage.png" class="detail-img">
            </div>
        </div>
        --%>
        <div class="info-row">
		    <div class="info-label">상품 이미지</div>
		    <div class="info-value">
		        <div class="gallery-container">
		            <%-- 메인 이미지 1~3 --%>
	                <img src="${pageContext.request.contextPath}/${auctionDto.imagePath1}" class="detail-img thumb-gallery">
	                <img src="${pageContext.request.contextPath}/${auctionDto.imagePath2}" class="detail-img thumb-gallery">
	                <img src="${pageContext.request.contextPath}/${auctionDto.imagePath3}" class="detail-img thumb-gallery">
		
		            <%-- 추가 이미지 4~10 (동적 생성) --%>
		            <c:forEach var="i" begin="4" end="10" step="1">
		                <c:set var="pathKey" value="imagePath${i}" />
		                
		                <c:if test="${not empty auctionDto[pathKey]}">
		                    <img src="${pageContext.request.contextPath}/${auctionDto[pathKey]}" class="thumb-gallery">
		                </c:if>
		            </c:forEach>
		        </div>
		    </div>
		</div>
        
        <div class="info-row">
            <div class="info-label">상품명</div>
            <div class="info-value">
            	${ auctionDto.auctionTitle }
            </div>
        </div>
        <div class="info-row">
            <div class="info-label">현재가</div>
            <div class="info-value text-primary fw-bold">
            	<fmt:formatNumber value="${ auctionDto.bidCurrentPrice }" type="number" />원
            </div>
        </div>
        <div class="info-row">
            <div class="info-label">경매 종료 예정</div>
            <div class="info-value">
            	${ auctionDto.auctionEndDate }
            </div>
        </div>
    </div>

    <div class="info-card shadow-sm">
        <div class="info-header">상세 설명</div>
        <div class="p-4" style="min-height: 150px;">
        	${ auctionDto.auctionContent }
        </div>
    </div>
    
    <div class="info-card shadow-sm mt-4">
	    <div class="info-header d-flex justify-content-between align-items-center">
	        <span>입찰 이력 모니터링</span>
	        <span class="badge bg-dark" id="bidTotalCount">총 0건</span>
	    </div>
	    <div class="table-responsive">
	        <table class="table table-hover mb-0 bid-history-table">
	            <thead class="text-center">
	                <tr>
	                    <th>입찰자 ID</th>
	                    <th>입찰가</th>
	                    <th>입찰 시간</th>
	                    <th style="width: 150px;">상태</th>
	                </tr>
	            </thead>
	            <tbody class="text-center" id="bidHistory">
	                <%-- 입찰 이력 출력 영역 --%>
	            </tbody>
	        </table>
	    </div>
	</div>
	
	<div class="d-flex justify-content-center py-5">
	    <button type="button" class="btn btn-secondary px-5 fw-bold" onclick="history.back();">
	        <%-- 목록으로 돌아가기 --%>
			이전 페이지로 돌아가기
	    </button>
	</div>
</div>
</body>
</html>