package com.doit.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;

import com.doit.dto.AuctionResultViewDTO;
import com.doit.dto.BidActionDTO;
import com.doit.dto.MoneyChargeHistoryDTO;
import com.doit.dto.MoneyTransactionListDTO;
import com.doit.util.DBCPConn;

public class ProductBuyDAO
{

	// 낙찰 결제
	public void paymentBid(BidActionDTO dto) throws SQLException
	{
		Connection conn = DBCPConn.getConnection();
		CallableStatement cstmt = null;
		String sql = "";

		try
		{
			sql = "{CALL PRC_WINNING_PAYMENT_CREATE(?,?,?)}";

			cstmt = conn.prepareCall(sql);

			cstmt.setInt(1, dto.getUserId());
			cstmt.setInt(2, dto.getBidResultId());
			cstmt.setInt(3, dto.getAmount());

			cstmt.executeUpdate();

		} catch (SQLException e)
		{
			e.printStackTrace();
			throw e;

		} finally
		{
			try
			{
				cstmt.close();
				DBCPConn.close(conn);
			} catch (Exception e)
			{
				e.printStackTrace();
				System.out.println(e);
			}
		}
	}

	// 구매 확정
	public void confirmBid(BidActionDTO dto) throws SQLException
	{
		Connection conn = DBCPConn.getConnection();
		CallableStatement cstmt = null;
		String sql = "";

		try
		{
			sql = "{CALL PRC_PURCHASE_CONFIRM(?,?)";

			cstmt = conn.prepareCall(sql);

			cstmt.setInt(1, dto.getUserId());
			cstmt.setInt(2, dto.getBidResultId());

			cstmt.executeUpdate();

		} catch (Exception e)
		{
			e.printStackTrace();
			throw e;

		} finally
		{
			try
			{
				cstmt.close();
				DBCPConn.close(conn);
			} catch (Exception e)
			{
				e.printStackTrace();
				System.out.println(e);
			}
		}

	}

	// 낙찰 결제 취소
	public void failBid(BidActionDTO dto) throws SQLException
	{
		Connection conn = DBCPConn.getConnection();
		CallableStatement cstmt = null;
		String sql = "{CALL BID_FAILURE_HISTORY(?,?)";
		
		try
		{
			cstmt = conn.prepareCall(sql);
			
			cstmt.setInt(1, dto.getUserId());
			cstmt.setInt(2, dto.getBidResultId());
			
			cstmt.executeUpdate();
			
		} catch (SQLException e)
		{
			e.printStackTrace();
			throw e;
		}finally
		{
			try
			{
				cstmt.close();
				DBCPConn.close(conn);
			} catch (Exception e)
			{
				e.printStackTrace();
				System.out.println(e);
			}
		}
	}

	// 머니 이력
	public ArrayList<MoneyTransactionListDTO> moneyTransectionList(int userId)
	{
		ArrayList<MoneyTransactionListDTO> result = new ArrayList<>();
		
		Connection conn = DBCPConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		String sql = "";

		try
		{
			ArrayList<MoneyTransactionListDTO> list = new ArrayList<>();

			sql = "USER_ID, TRANSACTION_TYPE, AMOUNT, TRANSACTION_DATE, DESCRIPTION FROM VW_MONEY_HISTORY WHERE USER_ID = ?";

			pstmt.setInt(1, userId);

			res = pstmt.executeQuery(sql);

			while (res.next())
			{
				MoneyTransactionListDTO dto = new MoneyTransactionListDTO();

				dto.setUserId(res.getInt("USER_ID"));
				dto.setTransactionType(res.getString("TRANSACTION_TYPE"));
				dto.setAmount(res.getInt("AMOUNT"));
				dto.setTransactionDate(res.getString("TRANSACTION_DATE"));
				dto.setDescription(res.getString("DESCRIPTION"));

				list.add(dto);
			}

			return list;

		} catch (Exception e)
		{
			e.printStackTrace();

		} finally
		{
			try
			{
				res.close();
				pstmt.close();
				DBCPConn.close(conn);
			} catch (Exception e)
			{
				e.printStackTrace();
				System.out.println(e);
			}
		}
		
		return result;
	}

	// 머니 충전
	public void moneyCharge(MoneyChargeHistoryDTO dto)
	{
		Connection conn = DBCPConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = "";

		try
		{
			sql = "INSERT INTO MONEY_CHARGE_HISTORY(MONEY_CHARGE_ID,USER_ID,MONEY_CHARGE_METHOD_ID,CHARGE_AMOUNT)"
					+ " VALUES(MONEY_CHARGE_SEQ.NEXTVAL,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getUserId());
			pstmt.setInt(2, dto.getMoneyChargeMethodId());
			pstmt.setInt(3, dto.getChargeAmount());

			pstmt.executeUpdate();

		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			try
			{
				pstmt.close();
				DBCPConn.close(conn);
			} catch (Exception e)
			{
				e.printStackTrace();
				System.out.println(e);
			}
		}
	}

	
	// 낙찰 조회
	public ArrayList<AuctionResultViewDTO> auctionResultList(int userId)
	{
		ArrayList<AuctionResultViewDTO> result = new ArrayList<>();
		
		Connection conn = DBCPConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		String sql = "";
		try
		{
			ArrayList<AuctionResultViewDTO> list = new ArrayList<AuctionResultViewDTO>();
			
			sql = 
					"""
					SELECT 경매번호,경매제목,낙찰자번호,낙찰자ID,낙찰금액,낙찰일시,낙찰결과번호
					,PRODUCT_ID AS 제품ID,START_PRICE AS 시작가,CREATED_AT AS 경매생성일
					,AUCTION_PERIOD_ID AS 경매기간,WINNING_BID_ID AS 낙찰자입찰번호,WINNING_BID_TIME AS 낙찰시간,AUCTION_FINAL_PRICE AS 결제낙찰금액
					,AUCTION_STATUS AS 경매상태, WINNING_STATUS AS 낙찰상태, WINNING_PAYMENT_STATUS AS 낙찰자결제상태, WINNING_PAYMENT_MONEY_ID AS 머니ID
					,WINNING_PAYMENT_DATE AS 결제일자, BID_FAIL_YN AS 실패여부, BID_FAIL_TYPE AS 실패타입, SHIPPING_YN AS 배송여부, SHIPPING_DATE AS 배송일자
					,PURCHASE_CONFIRM_YN AS 구매확정여부, PURCHASE_CONFIRM_DATE AS 구매확정일자
					FROM VW_UNPAID_WINNING_TARGET A
					LEFT JOIN VW_AUCTION_WINNING_RESULT B
					ON B.AUCTION_ID = A.경매번호
					WHERE 낙찰자번호 = ?
					""";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userId);
			
			res = pstmt.executeQuery();
			
			while(res.next())
			{
				AuctionResultViewDTO dto = new AuctionResultViewDTO();
				
				dto.setAuctionId(res.getInt("경매번호"));
				dto.setWinnerUserId(res.getInt("낙찰자번호"));
				dto.setWinnerAmount(res.getInt("낙찰금액"));
				dto.setProductId(res.getInt("제품ID"));
				dto.setStartPrice(res.getInt("시작가"));
				dto.setAuctionUseDate(res.getInt("경매기간"));
				dto.setWinnerBidId(res.getInt("낙찰자입찰번호"));
				dto.setFinalPrice(res.getInt("결제낙찰금액"));
				dto.setWinnerId(res.getInt("낙찰결과번호"));
				dto.setPaymentId(res.getInt("머니ID"));
				dto.setFailType(res.getInt("실패타입"));
				dto.setWinner(res.getString("낙찰자ID"));
				dto.setAuctionTitle(res.getString("경매제목"));
				dto.setWinnerDate(res.getString("낙찰일자"));
				dto.setAuctionStartDate(res.getString("경매생성일"));
				dto.setWinnerBidDate(res.getString("낙찰시간"));
				dto.setAuctionStat(res.getString("경매상태"));
				dto.setWinnerStat(res.getString("낙찰상태"));
				dto.setPaymentStat(res.getString("낙찰자결제상태"));
				dto.setPaymentDate(res.getString("결제일자"));
				dto.setFail(res.getString("실패여부"));
				dto.setShipping(res.getString("배송여부"));
				dto.setShippingDate(res.getString("배송일자"));
				dto.setConfirm(res.getString("구매확정여부"));
				dto.setConfirmDate(res.getString("구매확정일자"));
			
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}finally {
			try
			{
				res.close();
				pstmt.close();
				DBCPConn.close(conn);
			} catch (Exception e)
			{
				e.printStackTrace();
				System.out.println(e);
			}
		}
		
		return result;
	}
	
	// 회원 머니 확인
	public int moneyCheck(int userId)
	{
		Connection conn = DBCPConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		String sql = "";
		int result = 0;
		
		try
		{
			sql = "SELECT FN_GET_USER_MONEY_BALANCE(?) FROM DUAL";
			
			pstmt = conn.prepareCall(sql);
			
			pstmt.setInt(1, userId);
			
			res = pstmt.executeQuery();
			
			while(res.next())
			{
				result = res.getInt(result);
			}
			
			return result;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally
		{
			try
			{
				res.close();
				pstmt.close();
				DBCPConn.close(conn);
			} catch (Exception e)
			{
				e.printStackTrace();
				System.out.println(e);
			}
		}
		
		return result;
	}
	
	// 결제 품목에대한 정보
	public void takeItem()
	{
		Connection conn = DBCPConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		String sql = "";
		
		try
		{
			sql = ""; 
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}finally {
			try
			{
				res.close();
				pstmt.close();
				DBCPConn.close(conn);
			} catch (Exception e)
			{
				e.printStackTrace();
				System.out.println(e);
			}
		}
		
	}

}
