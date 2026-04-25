package com.doit.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.doit.dao.MyPageDAO;
import com.doit.dto.AuctionDTO;
import com.doit.dto.BidRankDTO;
import com.doit.dto.ProductDTO;
import com.doit.dto.UserInfoDTO;
import com.doit.util.Pagination;

public class MyPageService {

	private final MyPageDAO myPageDao;

	public MyPageService(MyPageDAO dao) {
		this.myPageDao = dao;
	}

	// 회원 정보 변경 (비밀번호 확인 후 업데이트)
	public String changeInfo(String userLoginId, String userPwd, UserInfoDTO dto) {
		String result = null;
		
		int check = myPageDao.checkPwd(userLoginId, userPwd);
		
		if(check>0) {
			int changeInfo = myPageDao.modifyUserProfile(dto);
			if(changeInfo>0) {
				result = "정보 수정이 완료되었습니다.";
			}else {
				result = "오류가 발생하여 수정이 완료되지 않았습니다.";
			}
		}else if(check==0) {
			result = "비밀번호가 일치하지 않습니다.";
		}
		
		return result;
	}
	
	// 비밀번호 변경 
	public String changePw(String userLoginId, String userPwd, String changePwd) {
		String result = null;
		
		
		int check = myPageDao.checkPwd(userLoginId, userPwd);
		
		if(check>0) {
			int changeUserPwd = myPageDao.modifyUserPwd(userLoginId, changePwd);	
			
			if(changeUserPwd>0) {
				result = "정보 수정이 완료되었습니다.";
			}else {
				result = "오류가 발생하여 수정이 완료되지 않았습니다.";
			}
			
			
		}else {
			result ="비밀번호가 일치하지 않습니다.";
		}
		
		
		return result;
	}
	
	// 내 등록 상품 리스트 만들기
	public Map<String, Object> myProductList(String page, String type, int userId, String cp) {
		
		Map<String, Object> resultMap = new HashMap<>();
		try {
			Pagination util = new Pagination();
			
			int currentPage = 1;
			if(page!=null && !page.isEmpty()) {
				currentPage = Integer.parseInt(page);
			}
			
			int dataCount = myPageDao.dataCount(userId);

			int size = 10;
			int totalPage = util.pageCount(dataCount, size);
			
			if(currentPage > totalPage)
				currentPage = totalPage;

			int offset = (currentPage - 1) * size;
			if(offset<0)
				offset = 0;

			
			List<ProductDTO> list = myPageDao.myProductBoard(offset, size, userId, type);
			
			String listUrl = cp+"/user/product";
			//================================================================
			// #경로수정필요# 실제 상품의 상세 페이지
			//String detailUrl = cp + "/product/productDetail?productNum=";
			//================================================================

			String query = "page="+currentPage;

			if(type!=null&&!type.isEmpty()) {
				query += "&type="+type;
				listUrl += "?type="+type;
			}
	
			String paging = util.paging(currentPage, totalPage, listUrl);
			
			resultMap.put("paging", paging);
			resultMap.put("list", list);
			resultMap.put("page", currentPage);
			resultMap.put("dataCount", dataCount);
			resultMap.put("size", size);
			resultMap.put("totalPage", totalPage);
			//resultMap.put("detailUrl", detailUrl);
			resultMap.put("query", query);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}
	
	// 내 경매 현황 리스트 만들기
		public Map<String, Object> myAuctionStatus(String page, int userId, String cp) {
			
			Map<String, Object> resultMap = new HashMap<>();
			try {
				Pagination util = new Pagination();
				
				int currentPage = 1;
				if(page!=null && !page.isEmpty()) {
					currentPage = Integer.parseInt(page);
				}
				
				int dataCount = myPageDao.dataCount(userId);

				int size = 10;
				int totalPage = util.pageCount(dataCount, size);
				
				if(currentPage > totalPage)
					currentPage = totalPage;

				int offset = (currentPage - 1) * size;
				if(offset<0)
					offset = 0;

				
				List<AuctionDTO> list = myPageDao.myAuctionBoard(offset, size, userId);
				
				String listUrl = cp+"/user/auction/active";
				//================================================================
				// #경로수정필요# 실제 경매의 상세 페이지
				//String detailUrl = cp + "/auction/auctionDetail?auctionId=";
				//================================================================
				String query = "page="+currentPage;
				String paging = util.paging(currentPage, totalPage, listUrl);
				
				
				// 리스트에 랭킹 데이터 추가
				for(AuctionDTO dto:list) {
					List<BidRankDTO> rankList = myPageDao.myAuctionBidRank(dto.getAuctionId());
					dto.setBidRankList(rankList);
				}
				
				
				resultMap.put("paging", paging);
				resultMap.put("list", list);
				resultMap.put("page", currentPage);
				resultMap.put("dataCount", dataCount);
				resultMap.put("size", size);
				resultMap.put("totalPage", totalPage);
				//resultMap.put("detailUrl", detailUrl);
				resultMap.put("query", query);

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return resultMap;
		}
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
}
