package com.doit.dto;

public class MoneyTransactionListDTO
{
	private int userId, amount;
	private String transactionType,transactionDate,description;
	
	public MoneyTransactionListDTO() {}
	
	public MoneyTransactionListDTO(int userId, int amount, String transactionType, String transactionDate,
			String description)
	{
		this.userId = userId;
		this.amount = amount;
		this.transactionType = transactionType;
		this.transactionDate = transactionDate;
		this.description = description;
	}
	
	
	public int getUserId()
	{
		return userId;
	}
	public void setUserId(int userId)
	{
		this.userId = userId;
	}
	public int getAmount()
	{
		return amount;
	}
	public void setAmount(int amount)
	{
		this.amount = amount;
	}
	public String getTransactionType()
	{
		return transactionType;
	}
	public void setTransactionType(String transactionType)
	{
		this.transactionType = transactionType;
	}
	public String getTransactionDate()
	{
		return transactionDate;
	}
	public void setTransactionDate(String transactionDate)
	{
		this.transactionDate = transactionDate;
	}
	public String getDescription()
	{
		return description;
	}
	public void setDescription(String description)
	{
		this.description = description;
	}
	
	
	
}
