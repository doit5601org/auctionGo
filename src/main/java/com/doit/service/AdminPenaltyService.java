package com.doit.service;

import com.doit.dao.AdminPenaltyDAO;
import com.doit.dto.PenaltyHistoryDTO;

public class AdminPenaltyService
{
	//-- 속성 --//
	private AdminPenaltyDAO apDao;
	
	//-- 생성자 --//
	public AdminPenaltyService()
	{
		this.apDao = new AdminPenaltyDAO();
	}
	
	//-- 메서드 --//
	// 패널티 등록
	public int registerPenalty(PenaltyHistoryDTO phDto)
	{
		int result = 0;
		
		result = apDao.insertPenalty(phDto);
		
		return result;
	}
	

}// class AdminPenaltyService END