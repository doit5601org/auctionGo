package com.doit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.doit.dto.AuctionDTO;
import com.doit.dto.BidRankDTO;
import com.doit.dto.ProductDTO;
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
	
	
	// 내 등록 상품 전체 데이터 갯수
	public int dataCount(int userId) {
		int result = 0;
		
		String sql = """
				SELECT COUNT(*) AS COUNT
				FROM PRODUCT
				WHERE USER_ID = ?
				""";
		try (Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setInt(1, userId);
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
	
	
	// 내 등록 상품 게시글 리스트
	public List<ProductDTO> myProductBoard(int offset, int size, int userId, String type){
		
		List<ProductDTO> result = new ArrayList<ProductDTO>();
		
		
		String sql = """
				SELECT PRODUCT_ID, PRODUCT_RELEASE_NAME, PRODUCT_ALIAS, IMAGE_PATH_1, IS_PUBLIC, CREATED_AT   
				FROM PRODUCT
				WHERE USER_ID = ?""";
		
				if("PUBLIC".equals(type)) {
					sql+= " AND IS_PUBLIC = 1";
				}else if("PRIVATE".equals(type)) {
					sql+= " AND IS_PUBLIC = 0";
				}
				sql+=" ORDER BY PRODUCT_ID DESC OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";
		
		try(Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setInt(1, userId);
			pstmt.setInt(2, offset);
			pstmt.setInt(3, size);

			try(ResultSet rs = pstmt.executeQuery()) {
				while(rs.next()) {
					
					ProductDTO dto = new ProductDTO();
					dto.setProductId(rs.getInt("PRODUCT_ID"));
					dto.setProductReleaseName(rs.getString("PRODUCT_RELEASE_NAME"));
					dto.setProductAlias(rs.getString("PRODUCT_ALIAS"));
					dto.setImagePath1(rs.getString("IMAGE_PATH_1"));
					dto.setIsPublic(rs.getInt("IS_PUBLIC"));
					dto.setCreatedAt(rs.getString("CREATED_AT"));
					
					result.add(dto);
					
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}	
	
	
	// 내 경매 현황 게시글 리스트
	public List<AuctionDTO> myAuctionBoard(int offset, int size, int userId){
		
		List<AuctionDTO> result = new ArrayList<AuctionDTO>();
		
		
		String sql = """
				SELECT AUCTION_ID, AUCTION_TITLE
				, AUCTION_START_DATE, AUCTION_END_DATE, IMAGE_PATH_1, BID_COUNT
				FROM VW_AUCTION_LIST
				WHERE USER_ID = ?
				ORDER BY AUCTION_ID DESC OFFSET ? ROWS FETCH FIRST ? ROWS ONLY""";
		
		try(Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setInt(1, userId);
			pstmt.setInt(2, offset);
			pstmt.setInt(3, size);

			try(ResultSet rs = pstmt.executeQuery()) {
				while(rs.next()) {
					
					AuctionDTO dto = new AuctionDTO();
					
					dto.setAuctionId(rs.getInt("AUCTION_ID"));
					dto.setAuctionTitle(rs.getString("AUCTION_TITLE"));
					dto.setAuctionStartDate(rs.getString("AUCTION_START_DATE"));
					dto.setAuctionEndDate(rs.getString("AUCTION_END_DATE"));
					dto.setImagePath1(rs.getString("IMAGE_PATH_1"));
					dto.setBidCount(rs.getInt("BID_COUNT"));
	
					result.add(dto);
					
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}	
	
	
	// 경매 상세 - 입찰 순위 조회
	public List<BidRankDTO> myAuctionBidRank(int auctionId){
		List<BidRankDTO> result = new ArrayList<BidRankDTO>();
		
		String sql = """
				SELECT AUCTION_ID, BID_PRICE, BID_TIME, CURRENT_RANK, TOTAL_BIDDERS
				FROM VW_AUCTION_BID_RANK
				WHERE AUCTION_ID = ?
				ORDER BY CURRENT_RANK
				""";
		
		try(Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setInt(1, auctionId);
			
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					BidRankDTO dto = new BidRankDTO();
					dto.setAuctionId(rs.getInt("AUCTION_ID"));
					dto.setBidPrice(rs.getInt("BID_PRICE"));
					dto.setBidTime(rs.getString("BID_TIME"));
					dto.setCurrentRank(rs.getInt("CURRENT_RANK"));
					dto.setTotalBidders(rs.getInt("TOTAL_BIDDERS"));
					
					result.add(dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
