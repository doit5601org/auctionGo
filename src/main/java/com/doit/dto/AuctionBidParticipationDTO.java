package com.doit.dto;

import java.sql.Timestamp;

public class AuctionBidParticipationDTO
{
	private int bidId;                     // 입찰 코드 (PK)
	private int userId;                    // 회원 고유키 (FK)
	private int auctionId;                 // 경매 코드 (FK)
	private Timestamp bidTime;             // 입찰 시간
	private long bidPrice;                 // 입찰가
	
	// View 테이블 항목 추가
	private String bidStatus;				// 입찰 기록의 상태 (ex: 낙찰 유력)
	private int bidRank;					// 입찰 순위
	
	
	public AuctionBidParticipationDTO() {}

	
	
	public int getBidId()
	{
		return bidId;
	}

	public void setBidId(int bidId)
	{
		this.bidId = bidId;
	}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public int getAuctionId()
	{
		return auctionId;
	}

	public void setAuctionId(int auctionId)
	{
		this.auctionId = auctionId;
	}

	public Timestamp getBidTime()
	{
		return bidTime;
	}

	public void setBidTime(Timestamp bidTime)
	{
		this.bidTime = bidTime;
	}

	public long getBidPrice()
	{
		return bidPrice;
	}

	public void setBidPrice(long bidPrice)
	{
		this.bidPrice = bidPrice;
	}

	public String getBidStatus()
	{
		return bidStatus;
	}

	public void setBidStatus(String bidStatus)
	{
		this.bidStatus = bidStatus;
	}

	public int getBidRank()
	{
		return bidRank;
	}

	public void setBidRank(int bidRank)
	{
		this.bidRank = bidRank;
	}

	
}