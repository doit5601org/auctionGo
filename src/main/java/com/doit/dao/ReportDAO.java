package com.doit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	                SELECT REPORT_ID, REPORT_TYPE, CATEGORY, TARGET_NAME
	                     , TO_CHAR(CREATED_AT, 'YY/MM/DD') AS CREATED_AT
	                     , STATUS
	                     , TO_CHAR(PROCESS_AT, 'YY/MM/DD') AS PROCESS_AT
	                FROM VW_REPORT_LIST
	                WHERE USER_ID = ?
	                ORDER BY CREATED_AT DESC
	                """;

	    try (Connection conn = DBCPConn.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        pstmt.setInt(1, userIdx); // 세션에서 꺼낸 유저 PK 세팅
	        
	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	                ReportDTO dto = new ReportDTO();
	                
	                dto.setReportId(rs.getInt("REPORT_ID"));
	                dto.setReportType(rs.getString("REPORT_TYPE"));
	                dto.setCategory(rs.getString("CATEGORY"));
	                dto.setTargetName(rs.getString("TARGET_NAME"));
	                dto.setCreatedAt(rs.getString("CREATED_AT"));
	                dto.setStatus(rs.getString("STATUS"));
	                dto.setProcessAt(rs.getString("PROCESS_AT"));
	                
	                list.add(dto);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
}
