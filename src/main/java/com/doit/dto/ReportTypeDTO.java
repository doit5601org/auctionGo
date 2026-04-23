package com.doit.dto;

public class ReportTypeDTO
{
	private int reportTypeId;              // 신고 유형 코드 (PK)
	private String reportTypeName;         // 신고 유형명

	public ReportTypeDTO() {}

	public int getReportTypeId()
	{
		return reportTypeId;
	}

	public void setReportTypeId(int reportTypeId)
	{
		this.reportTypeId = reportTypeId;
	}

	public String getReportTypeName()
	{
		return reportTypeName;
	}

	public void setReportTypeName(String reportTypeName)
	{
		this.reportTypeName = reportTypeName;
	}
}
