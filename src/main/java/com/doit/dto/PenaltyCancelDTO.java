package com.doit.dto;

import java.sql.Date;

public class PenaltyCancelDTO
{
	private int penaltyCancelId;           // 패널티 취소 코드 (PK)
	private int penaltyId;                 // 패널티 코드 (FK)
	private int adminAccountId;            // 관리자 계정 번호 (FK)
	private String cancelReason;           // 취소 사유
	private Date canceledAt;               // 취소 일자

	public PenaltyCancelDTO() {}

	public int getPenaltyCancelId()
	{
		return penaltyCancelId;
	}

	public void setPenaltyCancelId(int penaltyCancelId)
	{
		this.penaltyCancelId = penaltyCancelId;
	}

	public int getPenaltyId()
	{
		return penaltyId;
	}

	public void setPenaltyId(int penaltyId)
	{
		this.penaltyId = penaltyId;
	}

	public int getAdminAccountId()
	{
		return adminAccountId;
	}

	public void setAdminAccountId(int adminAccountId)
	{
		this.adminAccountId = adminAccountId;
	}

	public String getCancelReason()
	{
		return cancelReason;
	}

	public void setCancelReason(String cancelReason)
	{
		this.cancelReason = cancelReason;
	}

	public Date getCanceledAt()
	{
		return canceledAt;
	}

	public void setCanceledAt(Date canceledAt)
	{
		this.canceledAt = canceledAt;
	}
}
