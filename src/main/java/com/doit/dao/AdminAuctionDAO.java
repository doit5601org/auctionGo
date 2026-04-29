package com.doit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.doit.dto.AuctionBidParticipationDTO;
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
		
		
		// 쿼리문 준비 (1/2)
		String sql = "SELECT *"
					+ " FROM ("
					+ "	SELECT"
					+ "		ROW_NUMBER() OVER(ORDER BY AUCTION_ID DESC) AS AUCTION_NUM"
					+ "		, AUCTION_ID"
					+ "		, USER_ID"
					+ "		, AUCTION_TITLE"
					+ "		, AUCTION_END_DATE AS AUCTION_END_DATE"
					+ "		, IS_FINISHED"
					+ "		, IMAGE_PATH_1"
					+ "		, BID_CURRENT_PRICE"
					+ "		, BID_MAX_PRICE"
					+ "		, BID_COUNT"
					+ "	FROM VW_AUCTION_LIST";
		
		if (auctionStatus.equalsIgnoreCase("active"))
		{
			sql += " WHERE IS_FINISHED = '진행중'";
		}
		else if (auctionStatus.equalsIgnoreCase("closed"))
		{
			sql += " WHERE IS_FINISHED = '마감'";
		}
		
		
		// 쿼리문 준비 (2/2)
		sql +=  ")"
				+ " WHERE AUCTION_NUM >= ?"		// 시작번호 
				+ "  AND AUCTION_NUM <= ?";		// 끝 번호
		
		
		
		// 현재 페이지의 데이터 시작 번호, 끝 번호 구하기
		int dataStartNum = (page - 1) * sizePerPage + 1;
		int dataEndNum = page * sizePerPage;
		
		// DB 작업 수행
		try(Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			pstmt.setInt(1, dataStartNum);
			pstmt.setInt(2, dataEndNum);

			try(ResultSet rs = pstmt.executeQuery();)
			{
				while (rs.next())
				{
					AuctionDTO dto = new AuctionDTO();
					
					dto.setAuctionId(rs.getInt("AUCTION_ID"));
					dto.setUserId(rs.getInt("USER_ID"));
					dto.setAuctionTitle(rs.getString("AUCTION_TITLE"));
					dto.setAuctionEndDate(rs.getString("AUCTION_END_DATE"));
					dto.setIsFinished(rs.getString("IS_FINISHED"));
					dto.setImagePath1(rs.getString("IMAGE_PATH_1"));
					dto.setBidCurrentPrice(rs.getInt("BID_CURRENT_PRICE"));
					dto.setBidMaxPrice(rs.getInt("BID_MAX_PRICE"));
					dto.setBidCount(rs.getInt("BID_COUNT"));
					
					result.add(dto);
				}
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("DB 작업 중 에러 발생: " + e.getMessage(), e);
		}
		
		return result;
	}
	
	
	
	// 경매 상세 정보 조회
	public AuctionDTO selectAuctionDetail(int auctionId)
	{
		AuctionDTO result = new AuctionDTO();
		
		String sql = "SELECT *"
				+ "	FROM ("
				+ "		SELECT"
				+ "			VAL.AUCTION_ID"
				+ "			, VAL.AUCTION_TITLE"
				+ "			, VAL.BID_CURRENT_PRICE"
				+ "			, TO_CHAR(VAL.AUCTION_END_DATE, 'YYYY-MM-DD HH24:MI:SS') AS AUCTION_END_DATE"
				+ "			, VAL.AUCTION_CONTENT"
				+ "			, P.IMAGE_PATH_1"
				+ "			, P.IMAGE_PATH_2"
				+ "			, P.IMAGE_PATH_3"
				+ "			, PIMG.FILE_PATH"
				+ "			, ROW_NUMBER() OVER(ORDER BY PIMG.IMAGE_ORDER ASC) AS IMAGE_ORDER"
				+ "		FROM VW_AUCTION_LIST VAL JOIN PRODUCT P"
				+ "			ON VAL.PRODUCT_ID = P.PRODUCT_ID"
				+ "			"
				+ "			JOIN PRODUCT_IMAGE PIMG"
				+ "			ON P.PRODUCT_ID = PIMG.PRODUCT_ID"
				+ "			WHERE VAL.AUCTION_ID = ?"
				+ "	)"
				+ "	PIVOT("
				+ "		MAX(FILE_PATH)"
				+ "		FOR IMAGE_ORDER IN (1 AS IMAGE_PATH_4"
				+ "							, 2 AS IMAGE_PATH_5"
				+ "							, 3 AS IMAGE_PATH_6"
				+ "							, 4 AS IMAGE_PATH_7"
				+ "							, 5 AS IMAGE_PATH_8"
				+ "							, 6 AS IMAGE_PATH_9"
				+ "							, 7 AS IMAGE_PATH_10"
				+ "							)"
				+ "	)";

		
		try(Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			)
		{
			pstmt.setInt(1, auctionId);
			
			try(ResultSet rs = pstmt.executeQuery();)
			{
				if (rs.next())
				{
					result.setAuctionId(rs.getInt("AUCTION_ID"));
					result.setAuctionTitle(rs.getString("AUCTION_TITLE"));
					result.setBidCurrentPrice(rs.getInt("BID_CURRENT_PRICE"));
					result.setAuctionEndDate(rs.getString("AUCTION_END_DATE"));
					result.setAuctionContent(rs.getString("AUCTION_CONTENT"));
					result.setImagePath1(rs.getString("IMAGE_PATH_1"));
					result.setImagePath2(rs.getString("IMAGE_PATH_2"));
					result.setImagePath3(rs.getString("IMAGE_PATH_3"));
					result.setImagePath4(rs.getString("IMAGE_PATH_4"));
					result.setImagePath5(rs.getString("IMAGE_PATH_5"));
					result.setImagePath6(rs.getString("IMAGE_PATH_6"));
					result.setImagePath7(rs.getString("IMAGE_PATH_7"));
					result.setImagePath8(rs.getString("IMAGE_PATH_8"));
					result.setImagePath9(rs.getString("IMAGE_PATH_9"));
					result.setImagePath10(rs.getString("IMAGE_PATH_10"));
				}
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("DB 작업 중 에러 발생: " + e.getMessage(), e);
		}
		
		return result;
	}
	
	
	// 특정 경매의 총 입찰 횟수 가져오기
	public int selectAuctionBidTotalCount(int auctionId)
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS AUCTION_BID_TOTAL_COUNT"
					+ " FROM AUCTION_BID_PARTICIPATION"
					+ " WHERE AUCTION_ID = ?";
		
		try(Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			)
		{
			pstmt.setInt(1, auctionId);
			
			try(ResultSet rs = pstmt.executeQuery();)
			{
				if (rs.next())
				{
					result = rs.getInt("AUCTION_BID_TOTAL_COUNT");
				}
			}
		} catch (Exception e)
		{
			throw new RuntimeException("DB 작업 중 에러 발생: " + e.getMessage(), e);
		}
		
		return result;
	}
	
	
	// 특정 경매의 입찰 기록 가져오기
	public List<AuctionBidParticipationDTO> selectAuctionBidHistory(int auctionId)
	{
		List<AuctionBidParticipationDTO> result = new ArrayList<>();
		
		String sql = "SELECT"
					+ "	BID_ID"
					+ "	, BID_RANK"
					+ "	, USER_ID"
					+ "	, BID_PRICE"
					+ "	, BID_TIME"
					+ "	, BID_STATUS"
					+ " FROM VW_BID_LIST"
					+ " WHERE AUCTION_ID = ?";
		
		try(Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			)
		{
			pstmt.setInt(1, auctionId);
			
			try(ResultSet rs = pstmt.executeQuery();)
			{
				while (rs.next())
				{
					AuctionBidParticipationDTO dto = new AuctionBidParticipationDTO();
					
					dto.setBidId(rs.getInt("BID_ID"));
					dto.setBidRank(rs.getInt("BID_RANK"));
					dto.setUserId(rs.getInt("USER_ID"));
					dto.setBidPrice(Long.parseLong(rs.getString("BID_PRICE")));
					dto.setBidTime(Timestamp.valueOf(rs.getString("BID_TIME")));
					dto.setBidStatus(rs.getString("BID_STATUS"));
					
					result.add(dto);
				}
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("DB 작업 중 에러 발생: " + e.getMessage(), e);
		}
		
		return result;
	}

}// class AdminAuctionDAO END