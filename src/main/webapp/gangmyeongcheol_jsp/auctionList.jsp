<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String ctx = request.getContextPath();

    String DB_URL  = "jdbc:mysql://localhost:3306/figureauction?characterEncoding=UTF-8";
    String DB_USER = "root";
    String DB_PASS = "1234";

    // 필터 파라미터
    String genreId  = request.getParameter("genreId");
    String sizeId   = request.getParameter("sizeId");
    String statusId = request.getParameter("statusId");
    String keyword  = request.getParameter("keyword");
    if (genreId  == null) genreId  = "";
    if (sizeId   == null) sizeId   = "";
    if (statusId == null) statusId = "";
    if (keyword  == null) keyword  = "";

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    java.util.List<java.util.Map<String,String>> list = new java.util.ArrayList<>();
    int totalCount = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

        StringBuilder sql = new StringBuilder(
            "SELECT a.auction_id, a.auction_title, a.current_price, a.bid_count, " +
            "       a.end_date, a.reg_date, a.status, " +
            "       p.grade, p.img1, m.manufacturer_name " +
            "FROM auction a " +
            "JOIN product p ON a.product_id = p.product_id " +
            "JOIN manufacturer m ON p.manufacturer_id = m.manufacturer_id " +
            "WHERE 1=1 "
        );
        java.util.List<String> params = new java.util.ArrayList<>();

        if (!genreId.isEmpty()) {
            sql.append("AND p.genre_id = ? ");
            params.add(genreId);
        }
        if (!sizeId.isEmpty()) {
            sql.append("AND p.size_id = ? ");
            params.add(sizeId);
        }
        if (statusId.equals("1")) {
            sql.append("AND a.status = 'ACTIVE' ");
        } else if (statusId.equals("2")) {
            sql.append("AND a.status = 'CLOSED' ");
        }
        if (!keyword.isEmpty()) {
            sql.append("AND a.auction_title LIKE ? ");
            params.add("%" + keyword + "%");
        }
        sql.append("ORDER BY a.reg_date DESC");

        ps = conn.prepareStatement(sql.toString());
        for (int i = 0; i < params.size(); i++) {
            ps.setString(i + 1, params.get(i));
        }
        rs = ps.executeQuery();

        while (rs.next()) {
            java.util.Map<String,String> row = new java.util.HashMap<>();
            row.put("auctionId",    rs.getString("auction_id"));
            row.put("title",        rs.getString("auction_title"));
            row.put("currentPrice", rs.getString("current_price"));
            row.put("bidCount",     rs.getString("bid_count"));
            row.put("endDate",      rs.getString("end_date"));
            row.put("regDate",      rs.getString("reg_date").replaceAll("-",""));
            row.put("status",       rs.getString("status"));
            row.put("grade",        rs.getString("grade"));
            row.put("img1",         rs.getString("img1"));
            row.put("makerName",    rs.getString("manufacturer_name"));
            list.add(row);
            totalCount++;
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs   != null) try { rs.close();   } catch(Exception e){}
        if (ps   != null) try { ps.close();   } catch(Exception e){}
        if (conn != null) try { conn.close(); } catch(Exception e){}
    }

    request.setAttribute("auctionList", list);
    request.setAttribute("totalCount", totalCount);
    request.setAttribute("ctx", ctx);
    request.setAttribute("pGenreId",  genreId);
    request.setAttribute("pSizeId",   sizeId);
    request.setAttribute("pStatusId", statusId);
    request.setAttribute("pKeyword",  keyword);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .auction-card img { width: 100%; aspect-ratio: 1/1; object-fit: cover; }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script>
function sortAuctions() {
    const sort = document.getElementById('sortSelect').value;
    const grid = document.getElementById('auctionGrid');
    const items = Array.from(grid.querySelectorAll('.col'));
    items.sort((a, b) => {
        if (sort === 'latest')   return b.dataset.date     - a.dataset.date;
        if (sort === 'deadline') return a.dataset.deadline - b.dataset.deadline;
        if (sort === 'price')    return b.dataset.price    - a.dataset.price;
    });
    items.forEach(item => grid.appendChild(item));
}
</script>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">쌍용피규어마켓</a>
        <div class="d-flex gap-3 ms-4">
            <a href="auctionList.jsp" class="nav-link active">경매</a>
            <a href="productList.jsp" class="nav-link">컬렉션</a>
            <a href="productMyList.jsp" class="nav-link">내 상품</a>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5">
    <div class="page-header">
        <h5 class="mb-0 fw-bold">경매 목록</h5>
        <p class="mb-0 small opacity-75 mt-1">현재 진행 중인 경매에 참여해보세요.</p>
    </div>

    <%-- 필터 --%>
    <div class="filter-card">
        <form action="auctionList.jsp" method="get" class="row g-2 align-items-end">
            <div class="col-md-2">
                <label class="form-label small fw-bold text-secondary mb-1">장르</label>
                <select name="genreId" class="form-select form-select-sm">
                    <option value="">전체</option>
                    <option value="1" <c:if test="${pGenreId == '1'}">selected</c:if>>VOCALOID</option>
                    <option value="2" <c:if test="${pGenreId == '2'}">selected</c:if>>애니메이션</option>
                    <option value="3" <c:if test="${pGenreId == '3'}">selected</c:if>>게임</option>
                </select>
            </div>
            <div class="col-md-2">
                <label class="form-label small fw-bold text-secondary mb-1">사이즈</label>
                <select name="sizeId" class="form-select form-select-sm">
                    <option value="">전체</option>
                    <option value="1" <c:if test="${pSizeId == '1'}">selected</c:if>>1/7</option>
                    <option value="2" <c:if test="${pSizeId == '2'}">selected</c:if>>1/8</option>
                    <option value="3" <c:if test="${pSizeId == '3'}">selected</c:if>>Nendoroid</option>
                </select>
            </div>
            <div class="col-md-2">
                <label class="form-label small fw-bold text-secondary mb-1">경매 상태</label>
                <select name="statusId" class="form-select form-select-sm">
                    <option value="">전체</option>
                    <option value="1" <c:if test="${pStatusId == '1'}">selected</c:if>>진행중</option>
                    <option value="2" <c:if test="${pStatusId == '2'}">selected</c:if>>종료</option>
                </select>
            </div>
            <div class="col-md-4">
                <label class="form-label small fw-bold text-secondary mb-1">경매명 검색</label>
                <input type="text" name="keyword" class="form-control form-control-sm"
                       placeholder="경매명을 입력하세요" value="${pKeyword}">
            </div>
            <div class="col-md-2 d-flex gap-1">
                <button type="submit" class="btn btn-primary btn-sm w-100">검색</button>
                <a href="auctionList.jsp" class="btn btn-outline-secondary btn-sm w-100">초기화</a>
            </div>
        </form>
    </div>

    <div class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-muted small">총 <strong class="text-dark">${totalCount}</strong>개</span>
        <select class="form-select form-select-sm" style="width:90px" id="sortSelect" onchange="sortAuctions()">
            <option value="latest">등록순</option>
            <option value="deadline">마감순</option>
            <option value="price">높은가격</option>
        </select>
    </div>

    <div class="row row-cols-2 row-cols-md-4 g-3" id="auctionGrid">
        <c:forEach var="a" items="${auctionList}">
        <div class="col" data-date="${a.regDate}" data-deadline="${a.endDate}" data-price="${a.currentPrice}">
            <a href="auctionDetail.jsp?auctionId=${a.auctionId}" class="text-decoration-none text-dark">
                <div class="auction-card card h-100">
                    <img src="${ctx}${a.img1}" alt="${a.title}"
                         onerror="this.src='https://placehold.co/300x300/eee/999?text=No+Image'">
                    <div class="card-body p-3">
                        <div class="d-flex justify-content-between align-items-center mb-1">
                            <span class="badge bg-warning text-dark" style="font-size:11px"
                                  data-end="${a.endDate}">--:--:--</span>
                            <c:choose>
                                <c:when test="${a.status == 'ACTIVE'}">
                                    <span class="badge bg-success" style="font-size:11px">진행중</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-secondary" style="font-size:11px">종료</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <p class="fw-bold small mb-1">${a.title}</p>
                        <p class="text-muted small mb-1">${a.makerName} · ${a.grade}</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="fw-bold text-primary small">${a.currentPrice}원</span>
                            <span class="text-muted" style="font-size:11px">입찰 ${a.bidCount}회</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        </c:forEach>
        <c:if test="${empty auctionList}">
        <div class="col-12 text-center text-muted py-5">검색 결과가 없습니다.</div>
        </c:if>
    </div>
</div>

</body>
</html>
