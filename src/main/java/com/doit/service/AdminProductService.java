package com.doit.service;

import java.util.ArrayList;
import java.util.List;

import com.doit.dao.AdminProductDAO;
import com.doit.dto.ProductDTO;

public class AdminProductService
{
//-- 속성 --//
	private final AdminProductDAO apDao;
	
//-- 생성자 --//
	public AdminProductService(AdminProductDAO dao)
	{
		this.apDao = dao;
	}
	
//-- 메서드 --//
	
	// 상품 갯수 가져오기
	public int getProductCount(String productStatus)
	{
		int result = 0;
		
		result = apDao.selectProductCount(productStatus);
		
		return result;
	}// getTotalProductCount() END
	
	
	// 상품 리스트 가져오기
	public List<ProductDTO> getProductList(String productStatus)
	{
		List<ProductDTO> result = new ArrayList<>();
		
		result = apDao.selectProductList(productStatus);
		
		return result;
	}

}// class AdminProductService END