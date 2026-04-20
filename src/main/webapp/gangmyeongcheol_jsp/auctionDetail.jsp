<%@ page contentType="text/html; charset=UTF-8"%>
<%
    String auctionId = request.getParameter("auctionId");
    if (auctionId == null) auctionId = "A001";

    String auctionTitle = "", seller = "", regDate = "", endDate = "",
           currentPrice = "", startPrice = "", bidCount = "", topBidder = "",
           minBid = "", maker = "", genre = "", size = "", grade = "", opened = "", parts = "",
           desc = "", img1 = "", img2 = "", img3 = "";

    if (auctionId.equals("A001")) {
        auctionTitle = "하츠네 미쿠 1/7 스케일 피규어 경매";
        seller = "miku_seller"; regDate = "2026-04-15"; endDate = "2026-04-19 15:00";
        currentPrice = "35,000원"; startPrice = "20,000원"; bidCount = "3"; topBidder = "m***u"; minBid = "36,000원";
        maker = "굿스마일컴퍼니"; genre = "VOCALOID"; size = "1/7 (약 23cm)"; grade = "S급"; opened = "미개봉"; parts = "없음";
        desc = "정품 굿스마일컴퍼니 제품으로 미개봉 상태입니다.\n박스 상태 양호하며 파츠 누락 없습니다.";
        img1 = "https://goodsmileshop.com/medias/sys_master/images/images/h43/h21/8830676697118.jpg";
        img2 = "https://goodsmileshop.com/medias/sys_master/images/images/h0f/h98/8830676795422.jpg";
        img3 = "https://goodsmileshop.com/medias/sys_master/images/images/h37/h05/8830676926494.jpg";
    } else if (auctionId.equals("A002")) {
        auctionTitle = "하츠네 미쿠 Racing Miku 2023 경매";
        seller = "racing_col"; regDate = "2026-04-16"; endDate = "2026-04-21 18:00";
        currentPrice = "28,000원"; startPrice = "15,000원"; bidCount = "1"; topBidder = "fig***2"; minBid = "29,000원";
        maker = "굿스마일컴퍼니"; genre = "VOCALOID"; size = "1/7 (약 24cm)"; grade = "A급"; opened = "개봉"; parts = "없음";
        desc = "2023 Racing Miku 1/7 피규어입니다.\n개봉 후 진열만 하였으며 상태 양호합니다.";
        img1 = "https://goodsmileshop.com/medias/sys_master/images/images/hb5/h90/9570322350110.jpg";
        img2 = "https://goodsmileshop.com/medias/sys_master/images/images/h5a/h75/9570323005470.jpg";
        img3 = "https://goodsmileshop.com/medias/sys_master/images/images/hbf/h66/9570323660830.jpg";
    } else if (auctionId.equals("A003")) {
        auctionTitle = "피카츄 1/7 스케일 피규어 경매";
        seller = "poke_fan"; regDate = "2026-04-17"; endDate = "2026-04-18 20:00";
        currentPrice = "62,000원"; startPrice = "30,000원"; bidCount = "7"; topBidder = "pika***3"; minBid = "63,000원";
        maker = "반다이"; genre = "게임"; size = "1/7 (약 15cm)"; grade = "S급"; opened = "미개봉"; parts = "없음";
        desc = "반다이 정품 피카츄 1/7 피규어입니다.\n미개봉 상태이며 상태 매우 양호합니다.";
        img1 = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png";
        img2 = img1; img3 = img1;
    } else if (auctionId.equals("A004")) {
        auctionTitle = "파이리 넨도로이드 피규어 경매";
        seller = "nendo_shop"; regDate = "2026-04-18"; endDate = "2026-04-22 12:00";
        currentPrice = "18,000원"; startPrice = "10,000원"; bidCount = "2"; topBidder = "char***d"; minBid = "19,000원";
        maker = "반다이"; genre = "게임"; size = "Nendoroid (약 10cm)"; grade = "A급"; opened = "개봉"; parts = "없음";
        desc = "반다이 정품 파이리 넨도로이드 피규어입니다.\n개봉 후 진열만 하였으며 파츠 누락 없습니다.";
        img1 = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png";
        img2 = img1; img3 = img1;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= auctionTitle %></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%-- 네비바 --%>
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">🎌 FigureAuction</a>
        <div class="d-flex gap-3 ms-4">
            <a href="auctionList.jsp" class="nav-link active">경매</a>
            <a href="productList.jsp" class="nav-link">컬렉션</a>
            <a href="productMyList.jsp" class="nav-link">내 상품</a>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5">

    <a href="auctionList.jsp" class="btn btn-outline-primary btn-sm mb-3">← 경매 목록</a>

    <%-- 상단: 이미지 + 입찰 정보 --%>
    <div class="row g-4">

        <%-- 왼쪽: 이미지 (화살표로 전환) --%>
        <div class="col-md-5">
            <div class="card p-3">
                <div class="position-relative mb-3">
                    <img id="mainImg" src="<%= img1 %>"
                         class="img-fluid rounded w-100" alt="<%= auctionTitle %>"
                         onerror="this.src='https://placehold.co/400x400/e3f2fd/1565c0?text=No+Image'">
                    <button class="btn btn-light btn-sm position-absolute top-50 start-0 translate-middle-y ms-1"
                            onclick="moveImg(-1)">&#8249;</button>
                    <button class="btn btn-light btn-sm position-absolute top-50 end-0 translate-middle-y me-1"
                            onclick="moveImg(1)">&#8250;</button>
                </div>
            </div>
        </div>

        <%-- 오른쪽: 입찰 정보 --%>
        <div class="col-md-7">
            <div class="card p-4 h-100 d-flex flex-column gap-3">

                <%-- 제목 --%>
                <div>
                    <span class="badge bg-success mb-2">진행중</span>
                    <h5 class="fw-bold mb-1"><%= auctionTitle %></h5>
                    <p class="text-muted small mb-0">판매자: <%= seller %> · 등록일: <%= regDate %></p>
                </div>

                <%-- 타이머 --%>
                <div class="border rounded p-3 text-center">
                    <div class="text-muted small mb-1">경매 종료까지</div>
                    <div class="fs-3 fw-bold text-danger" id="timer">23:14:05</div>
                    <div class="text-muted small mt-1"><%= endDate %> 종료</div>
                </div>

                <%-- 현재 가격 --%>
                <div class="border rounded p-3">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <div>
                            <div class="text-muted small">현재 입찰가 (차순위)</div>
                            <div class="fs-4 fw-bold text-primary"><%= currentPrice %></div>
                        </div>
                        <div class="text-end">
                            <div class="text-muted small">시작가</div>
                            <div class="fw-bold"><%= startPrice %></div>
                        </div>
                    </div>
                    <div class="text-muted small">총 입찰: <%= bidCount %>회 · 최고 입찰자: <%= topBidder %></div>
                </div>

                <%-- 입찰가 입력 --%>
                <div>
                    <label class="form-label fw-bold small">입찰가 입력</label>
                    <div class="input-group">
                        <input type="number" class="form-control" placeholder="<%= minBid %> 이상 입력" step="1000">
                        <span class="input-group-text">원</span>
                    </div>
                    <div class="form-text">최소 입찰 단위: 1,000원</div>
                </div>

                <%-- 입찰 전 필독 고지사항 --%>
                <div class="alert alert-warning small mb-0">
                    <strong>⚠ 입찰 전 필독 고지사항</strong>
                    <ul class="mb-0 mt-1 ps-3">
                        <li>입찰 시 <strong>낙찰가의 10%</strong>가 보증금으로 즉시 차감됩니다.</li>
                        <li>입찰 후 <strong>취소는 불가능</strong>합니다.</li>
                        <li>낙찰 후 미결제 시 보증금은 <strong>환불되지 않습니다.</strong></li>
                        <li>허위 입찰 시 서비스 이용이 <strong>제한될 수 있습니다.</strong></li>
                    </ul>
                </div>

                <%-- 버튼 --%>
                <div class="d-flex gap-2 mt-auto">
                    <button type="button" class="btn btn-primary flex-fill fw-bold" onclick="confirmBid()">입찰하기</button>
                    <a href="auctionReport.jsp?auctionId=<%= auctionId %>" class="btn btn-outline-danger">신고</a>
                </div>

            </div>
        </div>
    </div>

    <%-- 하단: 상품 정보 + 입찰 내역 --%>
    <div class="row g-4 mt-1">
        <div class="col-md-8">
            <div class="card p-4">
                <p class="fw-bold border-bottom pb-2 mb-3">상품 정보</p>
                <table class="table table-borderless table-sm mb-3">
                    <tr><td class="text-muted" style="width:110px">제조사</td><td class="fw-bold"><%= maker %></td></tr>
                    <tr><td class="text-muted">장르</td><td class="fw-bold"><%= genre %></td></tr>
                    <tr><td class="text-muted">사이즈</td><td class="fw-bold"><%= size %></td></tr>
                    <tr><td class="text-muted">상태 등급</td><td><span class="badge bg-secondary"><%= grade %></span></td></tr>
                    <tr><td class="text-muted">개봉 여부</td><td><span class="badge bg-success"><%= opened %></span></td></tr>
                    <tr><td class="text-muted">파츠 누락</td><td class="fw-bold"><%= parts %></td></tr>
                </table>
                <p class="fw-bold border-bottom pb-2 mb-3">경매 설명</p>
                <p class="text-secondary small" style="white-space:pre-wrap"><%= desc %></p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card p-4">
                <p class="fw-bold border-bottom pb-2 mb-3">입찰 내역</p>
                <ul class="list-unstyled">
                    <li class="d-flex justify-content-between py-2 border-bottom">
                        <span class="text-muted small"><%= topBidder %></span>
                        <span class="fw-bold text-primary small"><%= currentPrice %></span>
                    </li>
                    <li class="d-flex justify-content-between py-2 border-bottom">
                        <span class="text-muted small">fig***2</span>
                        <span class="fw-bold small"><%= startPrice %></span>
                    </li>
                    <li class="d-flex justify-content-between py-2">
                        <span class="text-muted small">user***3</span>
                        <span class="fw-bold small">-</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script>
// 이미지 화살표 전환
const images = ["<%= img1 %>", "<%= img2 %>", "<%= img3 %>"];
let current = 0;
function moveImg(direction) {
    current = (current + direction + images.length) % images.length;
    document.getElementById('mainImg').src = images[current];
}

// 입찰 확인 팝업 (고지사항 재확인)
function confirmBid() {
    if (confirm("입찰 후 취소는 불가능하며, 보증금이 즉시 차감됩니다.\n정말 입찰하시겠습니까?")) {
        alert("입찰이 완료되었습니다.");
    }
}
</script>
</body>
</html>
