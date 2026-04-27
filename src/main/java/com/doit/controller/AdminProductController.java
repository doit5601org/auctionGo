package com.doit.controller;

import java.io.IOException;
import java.util.List;

import com.doit.dao.AdminProductDAO;
import com.doit.dto.ProductDTO;
import com.doit.service.AdminProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/product/*")
public class AdminProductController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		process(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		process(req, resp);
	}

//------------------------------------------------------------------------------------------------------------------------------
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String methodType = request.getMethod();
		String uri = request.getRequestURI();
		String path = uri.substring(request.getContextPath().length());
		
		String viewPath = "/WEB-INF/views";

		//-- GET 방식 요청 처리 --//
		// forward 처리
		if (methodType.equalsIgnoreCase("GET"))
		{
			//-- 상품 --//
			// 상품 전체 조회
			if (path.equalsIgnoreCase("/admin/product/list"))
			{
				// 요청 파라미터 수신
				//-- 전체: all
				//   공개: public
				//   비공개: privete
				String productStatus = request.getParameter("productStatus");
				
				// null 처리
				//-- null → 페이지 최초 진입 → 전체 리스트 출력
				if (productStatus == null)
				{
					productStatus = "all";
				}
				
				
				// DAO 객체, Service 객체 생성
				AdminProductDAO apDao = new AdminProductDAO();
				AdminProductService apService = new AdminProductService(apDao);
				
				// 전체 상품 갯수 가져와서 request 에 바인딩
				int productCount = apService.getProductCount(productStatus);
				request.setAttribute("productCount", productCount);
				
				// 상품 리스트 가져오기
				List<ProductDTO> productList = apService.getProductList(productStatus);
				request.setAttribute("productList", productList);

				// 포워드 할 경로 설정
				viewPath = viewPath + "/admin/productList.jsp";
			}
			
			
			// 포워드 처리
			request.getRequestDispatcher(viewPath).forward(request, response);
		}
		
		
		
		// POST 방식 요청 처리
		else if (methodType.equalsIgnoreCase("POST"))
		{
			
		}
	}// process(...) END

}// class AdminProductController END
