package com.doit.dao;
import com.doit.jydto.*;
import com.doit.util.DBCPConn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class AdminUserDAO
{
	// 관리자가 모든 회원을 조회하는 메소드
	public List<ShowUserDTO> showAllUsers() throws SQLException
	{
		Connection conn = DBCPConn.getConnection();
		
		List<ShowUserDTO> list = new ArrayList<>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ShowUserDTO dto = null;
		
		try
		{
			String sql = "SELECT USERKEY, USERID, USERNAME, USERTEL, USERCREATED, USERSTATUS"
					+ " FROM VIEW_ADMIN_USER_LIST"
					+ " ORDER BY USERKEY DESC";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				dto = new ShowUserDTO();
				
				dto.setUserKey(rs.getInt("USERKEY"));
				dto.setUserId(rs.getString("USERID"));
				dto.setUserName(rs.getString("USERNAME"));
				dto.setUserTel(rs.getString("USERTEL"));
				dto.setUserCreated(rs.getString("USERCREATED"));
				dto.setUserStatus(rs.getString("USERSTATUS"));
				
				list.add(dto);
			}
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if (rs != null) {
                rs.close();
            }
			if (pstmt != null) {
                pstmt.close();
            }
			if (conn != null) {
	            DBCPConn.close(conn);
	        }
		}
		return list;
	}
	
	
	// 관리자가 회원 상세 정보를 조회하는 메소드
	public ShowUserDTO showUserDetail() throws SQLException
	{
		Connection conn = DBCPConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ShowUserDTO dto = null;
		
		try
		{
			String sql = "SELECT USER_ID, USER_LOGIN_ID, USER_NAME, USER_SSN,"
					+ " USER_EMAIL,USER_PHONE, USER_ADDRESS, USER_ADDRESS_DETAIL,"
					+ " CREATED_AT, USER_STATUS"
					+ " FROM VIEW_USER_INFO";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				dto.setUserKey(rs.getInt("USER_ID"));
				dto.setUserId(rs.getString("USER_LOGIN_ID"));
				dto.setUserName(rs.getString("USER_NAME"));
				dto.setUserSsn(rs.getString("USER_SSN"));
				dto.setUserEmail(rs.getString("USER_EMAIL"));
				dto.setUserTel(rs.getString("USER_PHONE"));
				dto.setUserAddress(rs.getString("USER_ADDRESS"));
				dto.setUserAddressDetail(rs.getString("USER_ADDRESS_DETAIL"));
				dto.setUserCreated(rs.getString("CREATED_AT"));
				dto.setUserStatus(rs.getString("USER_STATUS"));
				
				
			}
		}catch (Exception e)
		{
			e.printStackTrace();
		}	
		finally
		{
			if (rs != null) {
                rs.close();
            }
			if (pstmt != null) {
                pstmt.close();
            }
			if (conn != null) {
	            DBCPConn.close(conn);
	        }
		}
		return dto; 
	}
	
	
	
	
	
	
	
	
	
	
	
}
