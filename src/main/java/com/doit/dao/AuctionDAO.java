package com.doit.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.doit.dto.AuctionDTO;
import com.doit.dto.ReportDTO;
import com.doit.util.DBCPConn;

public class AuctionDAO
{

	// 경매 상품 목록 조회 (진행중 경매) - 페이징 + 키워드 검색
	// IS_FINISHED = 진행중인 경매만 노출?? 마감도 표시하려면 where절 수정
	public List<AuctionDTO> selectAuctionList(int start, int end, String searchKeyword) throws SQLException
	{
		List<AuctionDTO> list = new ArrayList<>();
		Connection conn = DBCPConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM (" + "    SELECT ROWNUM rnum, a.* FROM ("
				+ "        SELECT AUCTION_ID, AUCTION_TITLE, START_PRICE,"
				+ "               AUCTION_START_DATE, AUCTION_END_DATE, IS_FINISHED,"
				+ "               PRODUCT_ID, PRODUCT_RELEASE_NAME,"
				+ "               MANUFACTURER_NAME, PRODUCT_GRADE_NAME, IMAGE_PATH_1,"
				+ "               BID_CURRENT_PRICE, BID_COUNT" + " FROM VW_AUCTION_LIST"
				+ "        WHERE IS_FINISHED = '진행중'" + " AND AUCTION_TITLE LIKE ?"
				+ "        ORDER BY AUCTION_ID DESC" + "    ) a" + ") WHERE rnum BETWEEN ? AND ?";

		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,
			searchKeyword == null || searchKeyword.trim().isEmpty() ? "%" : "%" + searchKeyword + "%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				AuctionDTO dto = new AuctionDTO();
				dto.setAuctionId(rs.getInt("AUCTION_ID"));
				dto.setAuctionTitle(rs.getString("AUCTION_TITLE"));
				dto.setStartPrice(rs.getInt("START_PRICE"));
				dto.setAuctionStartDate(rs.getString("AUCTION_START_DATE"));
				dto.setAuctionEndDate(rs.getString("AUCTION_END_DATE"));
				dto.setIsFinished(rs.getString("IS_FINISHED"));
				dto.setProductId(rs.getInt("PRODUCT_ID"));
				dto.setProductReleaseName(rs.getString("PRODUCT_RELEASE_NAME"));
				dto.setManufacturerName(rs.getString("MANUFACTURER_NAME"));
				dto.setProductGradeName(rs.getString("PRODUCT_GRADE_NAME"));
				dto.setImagePath1(rs.getString("IMAGE_PATH_1"));
				dto.setBidCurrentPrice(rs.getInt("BID_CURRENT_PRICE"));
				dto.setBidCount(rs.getInt("BID_COUNT"));
				list.add(dto);
			}
		} finally
		{
			if (rs != null)
				try
				{
					rs.close();
				} catch (Exception e)
				{
				}
			if (pstmt != null)
				try
				{
					pstmt.close();
				} catch (Exception e)
				{
				}
			DBCPConn.close(conn);
		}
		return list;
	}

	// 경매 상품 전체 건수 조회 (페이징 계산용) - 진행중만
	public int selectAuctionCount(String searchKeyword) throws SQLException
	{
		Connection conn = DBCPConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		String sql = "SELECT COUNT(*) FROM VW_AUCTION_LIST" + " WHERE IS_FINISHED = '진행중'"
				+ " AND AUCTION_TITLE LIKE ?";

		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchKeyword == null ? "%" : "%" + searchKeyword + "%");

			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
		} finally
		{
			if (rs != null)
				try
				{
					rs.close();
				} catch (Exception e)
				{
				}
			if (pstmt != null)
				try
				{
					pstmt.close();
				} catch (Exception e)
				{
				}
			DBCPConn.close(conn);
		}
		return count;
	}

	// 경매 상품 상세 조회 - VW_AUCTION_LIST 전체 컬럼 매핑
	public AuctionDTO selectAuctionDetail(int auctionId) throws SQLException
	{
		AuctionDTO dto = null;
		Connection conn = DBCPConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT AUCTION_ID, AUCTION_TITLE, AUCTION_CONTENT, START_PRICE,"
				+ "       AUCTION_PERIOD_ID, AUCTION_PERIOD_NAME,"
				+ "       AUCTION_START_DATE, AUCTION_END_DATE, IS_FINISHED,"
				+ "       PRODUCT_ID, PRODUCT_RELEASE_NAME, PRODUCT_ALIAS,"
				+ "       MANUFACTURER_NAME, PRODUCT_GRADE_NAME, IMAGE_PATH_1,"
				+ "       BID_CURRENT_PRICE, BID_MAX_PRICE, BID_COUNT" + " FROM VW_AUCTION_LIST"
				+ "       WHERE AUCTION_ID = ?";

		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, auctionId);

			rs = pstmt.executeQuery();

			if (rs.next())
			{
				dto = new AuctionDTO();
				dto.setAuctionId(rs.getInt("AUCTION_ID"));
				dto.setAuctionTitle(rs.getString("AUCTION_TITLE"));
				dto.setAuctionContent(rs.getString("AUCTION_CONTENT"));
				dto.setStartPrice(rs.getInt("START_PRICE"));

				dto.setAuctionPeriodId(rs.getInt("AUCTION_PERIOD_ID"));
				dto.setAuctionPeriodName(rs.getString("AUCTION_PERIOD_NAME"));

				dto.setAuctionStartDate(rs.getString("AUCTION_START_DATE"));
				dto.setAuctionEndDate(rs.getString("AUCTION_END_DATE"));
				dto.setIsFinished(rs.getString("IS_FINISHED"));

				dto.setProductId(rs.getInt("PRODUCT_ID"));
				dto.setProductReleaseName(rs.getString("PRODUCT_RELEASE_NAME"));
				dto.setProductAlias(rs.getString("PRODUCT_ALIAS"));
				dto.setManufacturerName(rs.getString("MANUFACTURER_NAME"));
				dto.setProductGradeName(rs.getString("PRODUCT_GRADE_NAME"));
				dto.setImagePath1(rs.getString("IMAGE_PATH_1"));

				dto.setBidCurrentPrice(rs.getInt("BID_CURRENT_PRICE"));
				dto.setBidCount(rs.getInt("BID_COUNT"));

				// BID_MAX_PRICE 는 입찰이 없으면 NULL
				Integer maxPrice = rs.getInt("BID_MAX_PRICE");
				dto.setBidMaxPrice(rs.wasNull() ? null : Integer.valueOf(maxPrice));
			}
		} finally
		{
			if (rs != null)
				try
				{
					rs.close();
				} catch (Exception e)
				{
				}
			if (pstmt != null)
				try
				{
					pstmt.close();
				} catch (Exception e)
				{
				}
			DBCPConn.close(conn);
		}
		return dto;
	}

	// 경매 신고 등록 - PRC_REPORT_CREATE 프로시저 호출
	public void insertAuctionReport(ReportDTO dto) throws SQLException
	{
		Connection conn = DBCPConn.getConnection();
		CallableStatement cstmt = null;

		try
		{
			String sql = "{CALL PRC_REPORT_CREATE(?, ?, ?, ?, ?)}";
			cstmt = conn.prepareCall(sql);

			cstmt.setInt(1, dto.getUserId()); // P_USER_ID
			cstmt.setInt(2, dto.getReportTypeId()); // P_REPORT_TYPE
			cstmt.setInt(3, dto.getAuctionId()); // P_TARGET_ID (경매 ID)
			cstmt.setInt(4, 2); // P_TARGET_TYPE (경매 고정)
			cstmt.setString(5, dto.getReportReason()); // P_REPORT_REASON

			cstmt.executeUpdate();

		} catch (SQLException e)
		{
			e.printStackTrace();
			throw e;
		} finally
		{
			if (cstmt != null)
				try
				{
					cstmt.close();
				} catch (Exception e)
				{
				}
			DBCPConn.close(conn);
		}
	}
}
