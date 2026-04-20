<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 - 제재 유저 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    /* 헤더 고정 스타일 */
    .wf-header {
        font-weight: bold;
        background-color: #f8f9fa;
        border-bottom: 2px solid #ced4da;
        position: sticky;
        top: 0;
        z-index: 10;
    }
    
    /* 행 호버 효과 */
    .user-row {
        cursor: pointer;
        transition: background-color 0.2s;
    }
    
    .user-row:hover {
        background-color: #fff5f5; /* 제재 목록 강조색 */
    }
    
    /* 테이블 컨테이너 (스크롤바 영역) */
    .table-container {
        border: 1px solid #ced4da;
        background-color: #ffffff;
        height: 650px;       /* 20명 출력 시 적당한 고정 높이 */
        overflow-y: auto;    /* 내용 많으면 스크롤 */
    }

    th, td {
        padding: 12px !important;
        vertical-align: middle;
    }

    /* 페이징 스타일 커스텀 */
    .pagination { margin-bottom: 0; }
    .page-link { color: #333; border-color: #ced4da; }
    .page-item.active .page-link {
        background-color: #dc3545; /* 제재 페이지 테마색 */
        border-color: #dc3545;
        color: white;
    }

    /* 신고 페이지와 동일한 버튼 스타일 */
    .btn-wf {
        background-color: #e9ecef;
        border: 1px solid #ced4da;
        padding: 8px 30px;
        font-weight: bold;
        color: #212529;
        text-decoration: none;
        display: inline-block;
        transition: all 0.2s;
    }
    .btn-wf:hover {
        background-color: #dee2e6;
        color: #000;
    }

    /* 해제 버튼 스타일 */
    .btn-release {
        padding: 4px 12px;
        font-size: 0.85rem;
        font-weight: bold;
    }
</style>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row mb-4 align-items-end">
        <div class="col-md-6">
            <h1 class="fw-bold text-danger">제재 유저 관리</h1>
            <p class="text-muted">현재 이용 제한 중인 회원: <span class="text-danger fw-bold">20</span>명 (20명씩 보기)</p>
        </div>
        <div class="col-md-6">
            <div class="input-group">
                <select class="form-select" style="max-width: 130px;">
                    <option value="id">아이디</option>
                    <option value="reason">제재 사유</option>
                </select>
                <input type="text" class="form-control" placeholder="제재 유저 검색...">
                <button class="btn btn-danger" type="button">검색</button>
            </div>
        </div>
    </div>

    <div class="table-container shadow-sm">
        <table class="table text-center table-hover">
            <thead class="wf-header">
                <tr>
                    <th>고유키</th>
                    <th>아이디</th>
                    <th>제재 사유</th>
                    <th>제재 시작일</th>
                    <th>제재 종료일</th>
                    <th>상태</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <tr class="user-row" onclick="location.href='userDetail.jsp?key=200'">
                    <td>200</td>
                    <td>bad_auction_01</td>
                    <td>허위 매물 등록</td>
                    <td>2026-04-01</td>
                    <td>-</td>
                    <td><span class="badge rounded-pill bg-dark">영구정지</span></td>
                    <td>
                        <button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation(); alert('제재 해제 처리');">해제</button>
                    </td>
                </tr>
                
                <tr class="user-row" onclick="location.href='userDetail.jsp?key=199'">
                    <td>199</td>
                    <td>spammer_king</td>
                    <td>도배 및 욕설</td>
                    <td>2026-04-18</td>
                    <td>2026-04-25</td>
                    <td><span class="badge rounded-pill bg-danger">7일 정지</span></td>
                    <td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td>
                </tr>
                <tr class="user-row" onclick="location.href='#'"><td>198</td><td>user_abc</td><td>운영 정책 위반</td><td>2026-04-15</td><td>2026-05-15</td><td><span class="badge rounded-pill bg-danger">30일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>197</td><td>test_id_05</td><td>경매 부정 참여</td><td>2026-04-20</td><td>2026-04-23</td><td><span class="badge rounded-pill bg-danger">3일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>196</td><td>id_sample_01</td><td>도배 및 욕설</td><td>2026-04-19</td><td>2026-04-26</td><td><span class="badge rounded-pill bg-danger">7일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>195</td><td>id_sample_02</td><td>허위 매물 등록</td><td>2026-04-19</td><td>2026-04-26</td><td><span class="badge rounded-pill bg-danger">7일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>194</td><td>id_sample_03</td><td>비매너 채팅</td><td>2026-04-19</td><td>2026-04-26</td><td><span class="badge rounded-pill bg-danger">7일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>193</td><td>id_sample_04</td><td>도배 및 욕설</td><td>2026-04-19</td><td>2026-04-26</td><td><span class="badge rounded-pill bg-danger">7일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>192</td><td>id_sample_05</td><td>도배 및 욕설</td><td>2026-04-19</td><td>2026-04-26</td><td><span class="badge rounded-pill bg-danger">7일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>191</td><td>id_sample_06</td><td>도배 및 욕설</td><td>2026-04-19</td><td>2026-04-26</td><td><span class="badge rounded-pill bg-danger">7일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>190</td><td>id_sample_07</td><td>도배 및 욕설</td><td>2026-04-19</td><td>2026-04-26</td><td><span class="badge rounded-pill bg-danger">7일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>189</td><td>id_sample_08</td><td>도배 및 욕설</td><td>2026-04-19</td><td>2026-04-26</td><td><span class="badge rounded-pill bg-danger">7일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>188</td><td>id_sample_09</td><td>도배 및 욕설</td><td>2026-04-19</td><td>2026-04-26</td><td><span class="badge rounded-pill bg-danger">7일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>187</td><td>id_sample_10</td><td>도배 및 욕설</td><td>2026-04-19</td><td>2026-04-26</td><td><span class="badge rounded-pill bg-danger">7일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>186</td><td>id_sample_11</td><td>도배 및 욕설</td><td>2026-04-19</td><td>2026-04-26</td><td><span class="badge rounded-pill bg-danger">7일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>185</td><td>id_sample_12</td><td>도배 및 욕설</td><td>2026-04-19</td><td>2026-04-26</td><td><span class="badge rounded-pill bg-danger">7일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>184</td><td>id_sample_13</td><td>도배 및 욕설</td><td>2026-04-19</td><td>2026-04-26</td><td><span class="badge rounded-pill bg-danger">7일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>183</td><td>id_sample_14</td><td>도배 및 욕설</td><td>2026-04-19</td><td>2026-04-26</td><td><span class="badge rounded-pill bg-danger">7일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>182</td><td>id_sample_15</td><td>도배 및 욕설</td><td>2026-04-19</td><td>2026-04-26</td><td><span class="badge rounded-pill bg-danger">7일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
                <tr class="user-row" onclick="location.href='#'"><td>181</td><td>id_sample_16</td><td>도배 및 욕설</td><td>2026-04-19</td><td>2026-04-26</td><td><span class="badge rounded-pill bg-danger">7일 정지</span></td><td><button class="btn btn-outline-secondary btn-release" onclick="event.stopPropagation();">해제</button></td></tr>
            </tbody>
        </table>
    </div>

    <div class="row mt-4">
        <div class="col-12 d-flex justify-content-center">
            <nav>
                <ul class="pagination">
                    <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                </ul>
            </nav>
        </div>
    </div>
    
    <div class="d-flex justify-content-end mb-5">
        <button type="button" class="btn btn-wf" onclick="history.back();">돌아가기</button>
    </div>
</div>

</body>
</html>