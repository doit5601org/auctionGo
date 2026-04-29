package com.doit.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.doit.jydto.ReportDTO;
import com.doit.util.DBCPConn;

public class ReportDAO
{
	// 유저 식별자(userIdx)를 인자로 받아 해당 유저의 신고만 조회
	public static List<ReportDTO> getUserReportList(int userIdx) {
		
	    List<ReportDTO> list = new ArrayList<>();
	    
	    String sql = """
	                SELECT "신고번호"       AS reportId
	                     , "카테고리"       AS reportType  -- '상품' 또는 '경매'
	                     , "신고유형"       AS category    -- '도배', '광고' 등
	                     , "신고대상명"     AS targetName
	                     , TO_CHAR("신고일시", 'YY/MM/DD') AS createdAt
	                     , "처리결과"       AS status
	                     , TO_CHAR("처리일시", 'YY/MM/DD') AS processAt
	                FROM VW_REPORT_LIST
	                WHERE "신고자_ID" = ?
	                ORDER BY "신고일시" DESC
	                """;

	    try (Connection conn = DBCPConn.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        pstmt.setInt(1, userIdx);
	        
	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	                ReportDTO dto = new ReportDTO();
	                dto.setReportId(rs.getInt("reportId"));
	                dto.setReportType(rs.getString("reportType"));
	                dto.setCategory(rs.getString("category")); // 여기가 '도배/광고' 등
	                dto.setTargetName(rs.getString("targetName"));
	                dto.setCreatedAt(rs.getString("createdAt"));
	                dto.setStatus(rs.getString("status") == null ? "대기" : rs.getString("status"));
	                dto.setProcessAt(rs.getString("processAt"));
	                
	                list.add(dto);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	
	
	public ReportDTO getReportDetail(String reportId) {
	    ReportDTO dto = null;
	    String sql = "SELECT * FROM VW_REPORT_LIST WHERE \"신고번호\" = ?";

	    try (Connection conn = DBCPConn.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        pstmt.setString(1, reportId);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                dto = new ReportDTO();
	                dto.setReportId(rs.getInt("신고번호"));
	                dto.setCreatedAt(rs.getString("신고일시"));
	                dto.setReportTarget(rs.getString("신고대상구분")); // DTO에 추가한 필드
	                dto.setReportType(rs.getString("신고유형"));
	                dto.setReportReason(rs.getString("신고사유"));   // DTO에 추가한 필드
	                dto.setCategory(rs.getString("카테고리"));
	                dto.setTargetName(rs.getString("신고대상명"));
	                
	                dto.setStatus(rs.getString("처리결과"));
	                dto.setProcessReason(rs.getString("처리내용")); // DTO에 추가한 필드
	                dto.setProcessAt(rs.getString("처리일시"));    // DTO 필드명 확인 (processAt)
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return dto;
	}
	
	
	public boolean insertAuctionReport(long auctionId, long userNo, int reportTypeId, String content) {
	    Connection conn = null;
	    CallableStatement cstmt = null;
	    boolean isSuccess = false;

	    try {
	        conn = DBCPConn.getConnection();
	        // 프로시저 호출 (상품 신고와 동일한 프로시저 사용)
	        String sql = "{CALL PRC_REPORT_CREATE(?, ?, ?, ?, ?)}";
	        cstmt = conn.prepareCall(sql);

	        cstmt.setLong(1, userNo);         // P_USER_ID (신고자)
	        cstmt.setInt(2, reportTypeId);   // P_REPORT_TYPE (신고 유형 ID)
	        cstmt.setLong(3, auctionId);      // P_TARGET_ID (경매 ID)
	        cstmt.setInt(4, 2);              // P_TARGET_TYPE (경매는 '2'로 고정하여 구분)
	        cstmt.setString(5, content);      // P_REPORT_REASON (신고 사유)

	        int rows = cstmt.executeUpdate();
	        isSuccess = true; 

	    } catch (SQLException e) {
	        System.err.println("[ReportDAO] 경매 신고 등록 중 에러 발생");
	        e.printStackTrace();
	        isSuccess = false;
	    } finally {
	        if (cstmt != null) try { cstmt.close(); } catch (Exception e) {}
	        DBCPConn.close(conn);
	    }
	    return isSuccess;
	}
	
	
	
}
