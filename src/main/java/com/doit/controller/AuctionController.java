package com.doit.controller;

import java.io.IOException;

import com.doit.dao.AuctionDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/auction/")
public class AuctionController extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	private AuctionDAO auctionDAO = new AuctionDAO();

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
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		/*
		 * 경매목록
		 * request.getRequestDispatcher("/WEB-INF/views/auction/auctionList.jsp").forward(request, response);
		 * 
		 * 경매 상세 조회 // request.setAttribute("auction", auction); //
		  request.getRequestDispatcher("/WEB-INF/views/auction/auctionDetail.jsp").forward(request, response);
		 
		 * 경매 신고 등록 // response.sendRedirect(contextPath +
		 * "/auction/detail.do?auctionId=" + request.getParameter("auctionId"));
		 */		
		

	}
	
 
}
