package com.doit.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/*")
public class AdminController extends HttpServlet
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

//------------------------------------------------------------------------------------------------------------------------
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String methodType = request.getMethod();
		String uri = request.getRequestURI();
		String path = uri.substring(request.getContextPath().length());
		
		String viewPath = "/WEB-INF/views";

		// GET 방식 요청 처리 (=화면 이동)
		if (methodType.equalsIgnoreCase("GET"))
		{
			//-- 경매 --//
			// 경매 전체 조회
			if (path.equalsIgnoreCase("/admin/show-all-auctions"))
			{
				viewPath = viewPath + "/admin/auctionList.jsp";
			}
			// 경매 상세 조회
			else if (path.equalsIgnoreCase("/admin/auction/detail"))
			{
				viewPath = viewPath + "/admin/auctionDetail.jsp";
			}
			
			//-- 상품 --//
			// 상품 전체 조회
			else if (path.equalsIgnoreCase("/admin/show-all-products"))
			{
				viewPath = viewPath + "/admin/productList.jsp";
			}
			// 상품 상세 조회
			else if (path.equalsIgnoreCase("/admin/product/detail"))
			{
				viewPath = viewPath + "/admin/productDetail.jsp";
			}
			
			//-- 신고 --//
			// 신고 접수 목록
			else if (path.equalsIgnoreCase("/admin/show-all-auctions"))
			{
				viewPath = viewPath + "/admin/reportsList.jsp";
			}
			// 접수 신고건 처리
			else if (path.equalsIgnoreCase("/admin/report/process"))
			{
				viewPath = viewPath + "/admin/reportsProcess.jsp";
			}
			// 신고 처리 이력
			else if (path.equalsIgnoreCase("/admin/show-history-reports"))
			{
				viewPath = viewPath + "/admin/reportsHistory.jsp";
			}

			//-- 패널티 처리 --//
			// 패널티 이력
			else if (path.equalsIgnoreCase("/admin/show-history-penalties"))
			{
				viewPath = viewPath + "/admin/penaltyHistory.jsp";
			}
			// 패널티 부여
			else if (path.equalsIgnoreCase("/admin/penalty/register"))
			{
				viewPath = viewPath + "/admin/penaltyRegister.jsp";
			}
			// 패널티 취소
			else if (path.equalsIgnoreCase("/admin/penalty/cancel"))
			{
				viewPath = viewPath + "/admin/penaltyCancel.jsp";
			}
			
			
						
			
			
			
			
			
			request.getRequestDispatcher(viewPath).forward(request, response);
			return;
		}
		// POST 방식 요청 처리
		else if (methodType.equalsIgnoreCase("POST"))
		{
			
		}
	}// process(...) END
	
}// class AdminController END