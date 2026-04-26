package com.doit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.doit.jydto.AdminDTO;
import com.doit.util.DBCPConn;

public class AdminDAO {
	
	
    // 관리자 계정, 프로필, 이름, 권한명을 한 번에 가져오는 메소드
	public AdminDTO getAdmin(String adminId, String adminPwd) {
	    AdminDTO dto = null;

	    String sql = """
	                SELECT A.ADMIN_LOGIN_ID, P.EMPLOYEE_NAME, P.DEPARTMENT, R.ADMIN_ROLE_NAME
	                FROM ADMIN_ACCOUNT A
	                JOIN ADMIN_ACCOUNT_HISTORY H ON A.ADMIN_ACCOUNT_ID = H.ADMIN_ACCOUNT_ID
	                JOIN ADMIN_PROFILE P ON H.EMPLOYEE_ID = P.EMPLOYEE_ID
	                JOIN ADMIN_ROLE R ON A.ADMIN_ROLE_ID = R.ADMIN_ROLE_ID
	                WHERE A.ADMIN_LOGIN_ID = ? AND A.ADMIN_PASSWORD = ?
	                AND H.ACCOUNT_END_DATE IS NULL
	                """;

	    try (Connection conn = DBCPConn.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        pstmt.setString(1, adminId);
	        pstmt.setString(2, adminPwd);
	        
	        
	        
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                dto = new AdminDTO();
	                dto.setAdminLoginId(rs.getString("ADMIN_LOGIN_ID"));
	                dto.setEmployeeName(rs.getString("EMPLOYEE_NAME"));
	                dto.setDepartment(rs.getString("DEPARTMENT"));
	                dto.setAdminRoleName(rs.getString("ADMIN_ROLE_NAME"));
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return dto;
	}
}
