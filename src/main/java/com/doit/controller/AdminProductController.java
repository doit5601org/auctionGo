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
				//-- productStatus, nowPage
				String productStatus = request.getParameter("productStatus");
				//-- 전체: all
				//   공개: public
				//   비공개: privete
				String nowPage = request.getParameter("page");
				
				// 파라미터 null 처리
				//-- null → 페이지 최초 진입 → 전체 리스트 출력
				if (productStatus == null)
				{
					productStatus = "all";
				}
				if (nowPage == null)
				{
					nowPage = "1";
				}

				
				// Service 객체 생성
				AdminProductService apService = new AdminProductService();
				
				// 전체 상품 갯수 가져오기
				int productTotalCount = apService.getProductCount(productStatus);
				
				// 상품 리스트 가져오기
				List<ProductDTO> productList = apService.getProductList(productStatus);
				

				
				// 필요한 파라미터들 바인딩
				request.setAttribute("productTotalCount", productTotalCount);
				request.setAttribute("productList", productList);
				request.setAttribute("productStatus", productStatus);
				request.setAttribute("nowPage", nowPage);
				
				
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
