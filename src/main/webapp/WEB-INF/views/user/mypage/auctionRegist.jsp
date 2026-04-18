<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 경매 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <style>
        .wf-input {
            background-color: #e9ecef;
            border: none;
            padding: 10px;
        }
        .wf-label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }
        .btn-wf {
            background-color: #e9ecef;
            border: 1px solid #ced4da;
            padding: 10px 30px;
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">
    	function checkUserInput() {
			// alert("호출")
			let title = document.getElementById("AUCTION_TITLE");
			let auctionPrice = document.getElementById("AUCTION_PRICE");
			
			if(title.value == "")
			{
				alert("제목을 입력히세요.");
				return false;
			}
			
			if(auctionPrice.value == "")
			{
				alert("시작가를 입력해주세요.");
				return false;
			}
			else if(auctionPrice.value % 1000 != 0)
			{
				alert("1000원 단위로 입력해주세요.");
				return false;
			}
		}
    	
    
    </script>
</head>
<body>

<div class="container mt-5">
    <div class="row mb-5">
        <div class="col-12">
            <h1 class="fw-bold">상품 경매 등록</h1>
        </div>
    </div>

    <div class="d-flex align-items-start" style="gap: 50px;">
        
        <div style="flex: 0 0 450px;"> <div class="ratio ratio-1x1 bg-light border d-flex align-items-center justify-content-center">
                <span class="text-muted fw-bold">상품 대표 이미지</span>
            </div>
        </div>

        <div class="flex-grow-1">
            <form action= "${pageContext.request.contextPath}/user/mypage/auction" method="post">
                
                <div class="mb-4">
                    <label class="wf-label">경매 제목</label>
                    <input type="text" name="AUCTION_TITLE" id="AUCTION_TITLE" class="form-control wf-input" placeholder="">
                </div>

                <div class="mb-4 d-flex align-items-end" style="gap: 15px;">
                    <div style="flex-grow: 1;">
                        <label class="wf-label">경매 시작가</label>
                        <input type="number" name="START_PRICE" id="AUCTION_PRICE" class="form-control wf-input" placeholder=""
                        min="0" step="1000">
                    </div>
                    <span class="fw-bold pb-2" style="font-size: 1.2rem;">원</span>
                </div>

                <div class="mb-5">
                    <label class="wf-label">경매 소개 글</label>
                    <textarea name="AUCTION_INFO" class="form-control wf-input" rows="8" placeholder="내용을 입력하세요."></textarea>
                </div>

                <div class="d-flex justify-content-center" style="gap: 100px;">
                    <button type="submit" class="btn btn-wf px-5" onclick="return checkUserInput()">등록</button>
                    <button type="button" class="btn btn-wf px-5" onclick="">취소</button>
                </div>

            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>