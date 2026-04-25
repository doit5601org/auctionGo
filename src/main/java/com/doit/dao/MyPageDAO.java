package com.doit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.doit.dto.UserInfoDTO;
import com.doit.util.DBCPConn;

public class MyPageDAO {

	
	// 비밀번호 확인 메소드
	public int checkPwd(String userId, String userPwd) {
		int result = 0;
		String sql ="""
				SELECT COUNT(*) AS COUNT
				FROM USER_ACCOUNT
				WHERE USER_LOGIN_ID = ? AND USER_PASSWORD = ?
				""";
		try(Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					result = rs.getInt("COUNT");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	// 회원 정보 수정 메소드
	public int modifyUserProfile(UserInfoDTO dto) {
		int result = 0;
		
		String sql="""
				UPDATE USER_PROFILE
				SET USER_EMAIL = ? , USER_PHONE = ?, USER_ZIPCODE = ?, USER_ADDRESS =?, USER_ADDRESS_DETAIL = ?
				WHERE USER_ID = ?
				""";
		try (Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, dto.getUserEmail());
			pstmt.setString(2, dto.getUserPhone());
			pstmt.setString(3, dto.getUserZipcode());
			pstmt.setString(4, dto.getUserAddress());
			pstmt.setString(5, dto.getUserAddressDetail());
			pstmt.setInt(6, dto.getUserId());

			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		return result;
	}
	
	// 비밀번호 수정 메소드
	public int modifyUserPwd(String userLoginId, String changePwd) {
		int result = 0;
		String sql="""
				UPDATE USER_ACCOUNT
				SET USER_PASSWORD = ?
				WHERE USER_LOGIN_ID = ?
				""";
		try (Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, changePwd);
			pstmt.setString(2, userLoginId);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
