package com.doit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.doit.dto.AuctionDTO;
import com.doit.util.DBCPConn;

public class AdminAuctionDAO
{
	//-- 메서드 --//
	// 경매 총 갯수 가져오기
	public int selectAuctionTotalCount(String auctionStatus)
	{
		int result = 0;
		
		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS TOTAL_COUNT FROM VW_AUCTION_LIST";
		
		if (auctionStatus.equalsIgnoreCase("active"))
		{
			sql += " WHERE IS_FINISHED = '진행중'";
		}
		else if (auctionStatus.equalsIgnoreCase("closed"))
		{
			sql += " WHERE IS_FINISHED = '마감'";
		}
		
		
		// DB 작업 수행
		try(Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();)
		{
			if (rs.next())
			{
				result = rs.getInt("TOTAL_COUNT");
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("DB 작업중 에러 발생: " + e.getMessage(), e);
		}
		
		return result;
	}
	
	
	
	// 경매 리스트 가져오기
	public List<AuctionDTO> selectAuctionList(String auctionStatus, int page, int sizePerPage)
	{
		List<AuctionDTO> result = new ArrayList<>();
		
		
		// 현재 페이지의 데이터 시작 번호, 끝 번호 구하기
		int dataStartNum = (page - 1) * sizePerPage + 1;
		int dataEndNum = page * sizePerPage;
		
		
		// 쿼리문 준비
		String sql = "";
		
		
		if (auctionStatus.equalsIgnoreCase("active"))
		{
			sql += " WHERE IS_FINISHED = '진행중'";
		}
		else if (auctionStatus.equalsIgnoreCase("closed"))
		{
			sql += " WHERE IS_FINISHED = '마감'";
		}
		
		
		
		
		
		// DB 작업 수행
		try
		{
			
		}
		catch (Exception e)
		{
			// TODO: handle exception
		}
		
		return result;
	}

}// class AdminAuctionDAO END