package com.doit.dao;

import java.sql.CallableStatement;
import java.sql.Connection;

import com.doit.dto.PenaltyHistoryDTO;
import com.doit.util.DBCPConn;

public class AdminPenaltyDAO
{
	// 패널티 등록
	public int insertPenalty(PenaltyHistoryDTO phDto)
	{
		int result = 0;
		
		String sql = "{ call PRC_PENALTY_ASSIGN(?, ?, ?, ?) }";
		
		try(Connection conn = DBCPConn.getConnection();
			CallableStatement cstmt = conn.prepareCall(sql);
		   )
		{
			cstmt.setInt(1, phDto.getUserId());
			cstmt.setInt(2, phDto.getAdminAccountId());
			cstmt.setInt(3, phDto.getPenaltyTypeId());
			cstmt.setInt(4, phDto.getPenaltyScore());

			result = cstmt.executeUpdate();
		}
		catch (Exception e)
		{
			throw new RuntimeException("DB 작업 에러 발생: " + e.getMessage(), e);
		}
		
		return result;
	}
	
}// class AdminPenaltyDAO END