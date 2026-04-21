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
		
		String viewPath = "/WEB-INF/views";
		
		// GET 방식 요청 처리 (=화면 이동)
		if (methodType.equalsIgnoreCase("GET"))
		{
			//-- 경매 및 상품 --//
			// 상품 전체 조회
			if (uri.endsWith("/product/list"))
			{
				viewPath = viewPath + "/admin/productList.jsp";
			}
			// 경매 전체 조회
			else if (uri.endsWith("/auction/list"))
			{
				viewPath = viewPath + "/admin/auctionList.jsp";
			}
			// 상품 상세 조회
			else if (uri.endsWith("/product/detail"))
			{
				viewPath = viewPath + "/admin/productDetail.jsp";
			}
			// 경매 상세 조회
			else if (uri.endsWith("/auction/detail"))
			{
				viewPath = viewPath + "/admin/auctionDetail.jsp";
			}
			
			//-- 신고 처리 --//
			// 신고 접수 목록
			else if (uri.endsWith("/reports/list"))
			{
				viewPath = viewPath + "/admin/reportsList.jsp";
			}
			// 접수 신고건 처리
			else if (uri.endsWith("/reports/process"))
			{
				viewPath = viewPath + "/admin/reportsProcess.jsp";
			}
			// 신고 처리 이력
			else if (uri.endsWith("/reports/history"))
			{
				viewPath = viewPath + "/admin/reportsHistory.jsp";
			}
			
			
			//-- 패널티 처리 --//
			// 패널티 부여
			else if (uri.endsWith("/penalty/register"))
			{
				viewPath = viewPath + "/admin/penaltyRegister.jsp";
			}
			// 패널티 취소
			else if (uri.endsWith("/penalty/cancel"))
			{
				viewPath = viewPath + "/admin/penaltyCancel.jsp";
			}
			
			
			
			request.getRequestDispatcher(viewPath).forward(request, response);
		}
		// POST 방식 요청 처리
		else if (methodType.equalsIgnoreCase("POST"))
		{
			
		}
	}// process(...) END
	
}// class AdminController END