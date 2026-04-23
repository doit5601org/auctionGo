package com.doit.dto;

import java.sql.Date;

public class PenaltyHistoryDTO
{
	private int penaltyId;                 // 패널티 코드 (PK)
	private int userId;                    // 회원 고유키 (FK)
	private int penaltyTypeId;             // 패널티 부여 구분 코드 (FK)
	private int adminAccountId;            // 관리자 계정 번호 (FK)
	private int penaltyScore;              // 패널티 점수
	private Date createdAt;                // 등록 일자

	public PenaltyHistoryDTO() {}

	public int getPenaltyId()
	{
		return penaltyId;
	}

	public void setPenaltyId(int penaltyId)
	{
		this.penaltyId = penaltyId;
	}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public int getPenaltyTypeId()
	{
		return penaltyTypeId;
	}

	public void setPenaltyTypeId(int penaltyTypeId)
	{
		this.penaltyTypeId = penaltyTypeId;
	}

	public int getAdminAccountId()
	{
		return adminAccountId;
	}

	public void setAdminAccountId(int adminAccountId)
	{
		this.adminAccountId = adminAccountId;
	}

	public int getPenaltyScore()
	{
		return penaltyScore;
	}

	public void setPenaltyScore(int penaltyScore)
	{
		this.penaltyScore = penaltyScore;
	}

	public Date getCreatedAt()
	{
		return createdAt;
	}

	public void setCreatedAt(Date createdAt)
	{
		this.createdAt = createdAt;
	}
}
