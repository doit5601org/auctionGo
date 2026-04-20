<%@ page contentType="text/html; charset=UTF-8"%>
<%
    String productId = request.getParameter("productId");
    if (productId == null) productId = "P001";

    String name = "", nameEn = "", maker = "", genre = "", size = "",
           grade = "", opened = "", parts = "", purchaseDate = "", regDate = "",
           imgSrc = "", img2 = "", img3 = "", description = "";

    if (productId.equals("P001")) {
        name = "하츠네 미쿠 1/7 스케일 피규어";
        nameEn = "Hatsune Miku 1/7 Scale Figure (mebae Ver.)";
        maker = "굿스마일컴퍼니"; genre = "VOCALOID"; size = "1/7 (전고 약 23cm)";
        grade = "S급"; opened = "미개봉"; parts = "없음";
        purchaseDate = "2025-12-01"; regDate = "2026-04-10";
        imgSrc = "https://goodsmileshop.com/medias/sys_master/images/images/h43/h21/8830676697118.jpg";
        img2   = "https://goodsmileshop.com/medias/sys_master/images/images/h0f/h98/8830676795422.jpg";
        img3   = "https://goodsmileshop.com/medias/sys_master/images/images/h37/h05/8830676926494.jpg";
        description = "정품 굿스마일컴퍼니 하츠네 미쿠 mebae Ver. 1/7 스케일 피규어입니다.\n미개봉 상태로 구입 후 보관만 하였습니다.\n박스 상태 양호하며 파츠 누락 없습니다.";
    } else if (productId.equals("P002")) {
        name = "하츠네 미쿠 Racing Miku 2023";
        nameEn = "Racing Miku 2023 Ver. 1/7 Scale Figure";
        maker = "굿스마일컴퍼니"; genre = "VOCALOID"; size = "1/7 (전고 약 24cm)";
        grade = "A급"; opened = "개봉"; parts = "없음";
        purchaseDate = "2025-10-15"; regDate = "2026-04-11";
        imgSrc = "https://goodsmileshop.com/medias/sys_master/images/images/hb5/h90/9570322350110.jpg";
        img2   = "https://goodsmileshop.com/medias/sys_master/images/images/h5a/h75/9570323005470.jpg";
        img3   = "https://goodsmileshop.com/medias/sys_master/images/images/hbf/h66/9570323660830.jpg";
        description = "2023 Racing Miku 1/7 스케일 피규어입니다.\n개봉 후 장식용으로만 사용하였습니다.\n파츠 누락 없으며 상태 양호합니다.";
    } else if (productId.equals("P003")) {
        name = "피카츄 1/7 스케일 피규어";
        nameEn = "Pikachu 1/7 Scale Figure";
        maker = "반다이"; genre = "게임"; size = "1/7 (전고 약 15cm)";
        grade = "S급"; opened = "미개봉"; parts = "없음";
        purchaseDate = "2026-01-20"; regDate = "2026-04-12";
        imgSrc = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png";
        img2   = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png";
        img3   = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png";
        description = "반다이 정품 피카츄 1/7 스케일 피규어입니다.\n미개봉 상태이며 박스 상태 양호합니다.\n포켓몬 팬이라면 놓치지 마세요!";
    } else if (productId.equals("P004")) {
        name = "파이리 넨도로이드 피규어";
        nameEn = "Charmander Nendoroid Figure";
        maker = "반다이"; genre = "게임"; size = "Nendoroid (전고 약 10cm)";
        grade = "A급"; opened = "개봉"; parts = "없음";
        purchaseDate = "2026-02-05"; regDate = "2026-04-13";
        imgSrc = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png";
        img2   = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png";
        img3   = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png";
        description = "반다이 정품 파이리 넨도로이드 피규어입니다.\n개봉 후 진열만 하였으며 파츠 누락 없습니다.\n상태 매우 양호합니다.";
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= name %></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script>
// 이미지 화살표 전환 기능
const images = [
    "<%= imgSrc %>",
    "<%= img2 %>",
    "<%= img3 %>"
];
let current = 0;

function moveImg(direction) {
    current = (current + direction + images.length) % images.length;
    document.getElementById('mainImg').src = images[current];
}
</script>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">FigureAuction</a>
        <div class="d-flex gap-3 ms-4">
            <a href="main.jsp" class="nav-link">경매</a>
            <a href="productList.jsp" class="nav-link">컬렉션</a>
            <a href="productMyList.jsp" class="nav-link">내 상품</a>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5">

    <a href="productList.jsp" class="btn btn-outline-primary btn-sm mb-3">← 컬렉션 목록</a>

    <div class="row g-4">
        <%-- 이미지 영역 --%>
        <div class="col-md-5">
            <div class="card p-3">
                <div class="position-relative mb-3">
                    <img id="mainImg" src="<%= imgSrc %>"
                         class="img-fluid rounded w-100" alt="<%= name %>"
                         onerror="this.src='https://placehold.co/400x400/e3f2fd/1565c0?text=No+Image'">
                    <button class="btn btn-light btn-sm position-absolute top-50 start-0 translate-middle-y ms-1"
                            onclick="moveImg(-1)">&#8249;</button>
                    <button class="btn btn-light btn-sm position-absolute top-50 end-0 translate-middle-y me-1"
                            onclick="moveImg(1)">&#8250;</button>
                </div>
            </div>
        </div>

        <%-- 상품 정보 영역 --%>
        <div class="col-md-7">
            <div class="card p-4 h-100 d-flex flex-column">
                <h5 class="fw-bold mb-1"><%= name %></h5>
                <p class="text-muted small mb-3"><%= nameEn %></p>

                <table class="table table-borderless table-sm mb-4">
                    <tr><td class="text-muted" style="width:110px">제조사</td><td class="fw-bold"><%= maker %></td></tr>
                    <tr><td class="text-muted">장르</td><td class="fw-bold"><%= genre %></td></tr>
                    <tr><td class="text-muted">사이즈</td><td class="fw-bold"><%= size %></td></tr>
                    <tr><td class="text-muted">상태 등급</td><td><span class="badge bg-secondary"><%= grade %></span></td></tr>
                    <tr><td class="text-muted">개봉 여부</td><td><span class="badge bg-success"><%= opened %></span></td></tr>
                    <tr><td class="text-muted">파츠 누락</td><td class="fw-bold"><%= parts %></td></tr>
                    <tr><td class="text-muted">구매일</td><td class="fw-bold"><%= purchaseDate %></td></tr>
                    <tr><td class="text-muted">등록일</td><td class="fw-bold"><%= regDate %></td></tr>
                </table>

                <%-- 본인 상품일 때 --%>
                <div class="d-flex gap-2 mt-auto">
                    <a href="productUpdate.jsp?productId=<%= productId %>" class="btn btn-outline-secondary flex-fill">수정</a>
                    <a href="/user/mypage/auction?productId=<%= productId %>" class="btn btn-primary flex-fill">경매 등록</a>
                </div>
                <%-- 타인 상품일 때 (주석 해제)
                <div class="d-flex gap-2 mt-auto">
                    <button class="btn btn-outline-primary flex-fill">경매 요청</button>
                    <a href="productReport.jsp?productId=<%= productId %>" class="btn btn-outline-danger flex-fill">신고</a>
                </div>
                --%>
            </div>
        </div>
    </div>

    <%-- 상품 설명 --%>
    <div class="card p-4 mt-4">
        <p class="fw-bold border-bottom pb-2 mb-3">상품 설명</p>
        <p class="text-secondary" style="white-space:pre-wrap"><%= description %></p>
    </div>

</div>

</body>
</html>
