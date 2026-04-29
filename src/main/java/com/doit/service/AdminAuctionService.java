package com.doit.service;

import java.util.List;

import com.doit.dao.AdminAuctionDAO;
import com.doit.dto.AuctionBidParticipationDTO;
import com.doit.dto.AuctionDTO;

public class AdminAuctionService
{
	//-- 속성 --//
	private AdminAuctionDAO adminAuctionDao;
	
	//-- 생성자 --//
	public AdminAuctionService()
	{
		this.adminAuctionDao = new AdminAuctionDAO();
	}
	
	
	//-- 메서드 --//
	// 경매 총 갯수 가져오기
	public int getAuctionTotalCount(String auctionStatus)
	{
		int result = 0;
		
		result = adminAuctionDao.selectAuctionTotalCount(auctionStatus);
		
		return result;
	}
	
	// 경매 리스트 가져오기
	public List<AuctionDTO> getAuctionList(String auctionStatus, int page, int sizePerPage)
	{
		List<AuctionDTO> result = adminAuctionDao.selectAuctionList(auctionStatus, page, sizePerPage);
		
		return result;
	}
	
	// 경매 상세 정보 조회
	public AuctionDTO getAuctionDetail(int auctionId)
	{
		AuctionDTO auctionDto = adminAuctionDao.selectAuctionDetail(auctionId);
		
		return auctionDto;
	}
	
	// 특정 경매의 총 입찰 횟수 가져오기
	public int getAuctionBidTotalCount(int auctionId)
	{
		int result = 0;
		
		result = adminAuctionDao.selectAuctionBidTotalCount(auctionId);
		
		return result;
	}
	
	
	// 특정 경매의 총 입찰 기록 가져오기
	public List<AuctionBidParticipationDTO> getAuctionBidHistory(int auctionId)
	{
		List<AuctionBidParticipationDTO> result = adminAuctionDao.selectAuctionBidHistory(auctionId);
		
		return result;
	}
	
}// class AdminAuctionService END