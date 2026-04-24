package com.doit.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.doit.dto.UserInfoDTO;
import com.doit.util.DBCPConn;

public class LoginService {
	
	// userAccount 테이블에서 아이디, 비밀번호 조회
	// 성공 시 정보반환
	// 실패 시 null
	public static UserInfoDTO authenticateUser(String userId, String userPwd) {
		UserInfoDTO dto = null;
//		Connection conn = null;
//  	PreparedStatement pstmt = null;
//		ResultSet rs = null;
		String sql = """
					SELECT USER_ID, USER_LOGIN_ID, USER_PASSWORD
					,USER_NAME, USER_SSN, USER_EMAIL, USER_PHONE
					, USER_ZIPCODE, USER_ADDRESS, USER_ADDRESS_DETAIL
					, TOTAL_MONEY, CREATED_AT, DELETED_AT
					FROM VW_USER_INFO
					WHERE USER_LOGIN_ID = ? AND USER_PASSWORD = ?
					AND DELETED_AT IS NULL
					""";
		try (Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)) {
			//conn = DBCPConn.getConnection();
			//pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			try(ResultSet rs = pstmt.executeQuery()) {
				//rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dto = new UserInfoDTO();
					
					dto.setUserId(rs.getInt("USER_ID"));
					dto.setUserLoginId(rs.getString("USER_LOGIN_ID"));
					dto.setUserPassword(rs.getString("USER_PASSWORD"));
					dto.setUserName(rs.getString("USER_NAME"));
					dto.setUserSsn(rs.getString("USER_SSN"));
					dto.setUserEmail(rs.getString("USER_EMAIL"));
					dto.setUserPhone(rs.getString("USER_PHONE"));
					dto.setUserZipcode(rs.getString("USER_ZIPCODE"));
					dto.setUserAddress(rs.getString("USER_ADDRESS"));
					dto.setUserAddressDetail(rs.getString("USER_ADDRESS_DETAIL"));
					dto.setTotalMoney(rs.getInt("TOTAL_MONEY"));
					dto.setCreatedAt(rs.getString("CREATED_AT"));
					dto.setDeletedAt(rs.getString("DELETED_AT"));
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
//		finally {
//			try {
//				if(rs!=null)
//					rs.close();
//				if(pstmt!=null)
//					pstmt.close();
//				if(conn!=null)
//					conn.close();
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
		return dto;
	}

}
